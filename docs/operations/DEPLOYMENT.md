# Guía de Despliegue de GHE

---

## 1. Requisitos del Sistema

### 1.1. Hardware Mínimo

| Componente | Mínimo | Recomendado |
|---|---|---|
| CPU | 2 cores | 4 cores |
| RAM | 4 GB | 8 GB |
| Almacenamiento | 50 GB SSD | 256 GB SSD |
| Red | 2G/EDGE (offline funciona) | WiFi/Ethernet |
| Pantalla | 1024x768 | 1920x1080 |
| Impresora | No requerida | térmica de tickets |

### 1.2. Software

| Componente | Versión | Propósito |
|---|---|---|
| SO | Debian 12 / Ubuntu 22.04 LTS | Base del sistema |
| Java | OpenJDK 17+ | Runtime de Clojure |
| SQLite | 3.40+ | Base de datos |
| Nginx | 1.24+ | Reverse proxy (opcional) |
| Docker | 24.0+ | Contenedor (opcional) |

### 1.3. Conectividad

| Escenario | Conectividad | Funcionalidad |
|---|---|---|
| **Sin internet** | Ninguna | 100% offline |
| **2G/EDGE** | Lenta, intermitente | Offline + sync diferida |
| **WiFi/Ethernet** | Estable | Full + sync en tiempo real |

---

## 2. Instalación

### 2.1. Instalación Rápida (Docker)

```bash
# Clonar repositorio
git clone https://github.com/org/GHE.git
cd GHE

# Ejecutar con Docker Compose
docker-compose up -d

# Verificar
curl http://localhost:3000/health
```

### 2.2. Instalación Manual

```bash
# 1. Instalar dependencias
sudo apt update
sudo apt install -y openjdk-17-jre sqlite3 nginx

# 2. Descargar GHE
wget https://github.com/org/GHE/releases/latest/ghe.jar -O /opt/ghe/ghe.jar

# 3. Crear servicio systemd
sudo tee /etc/systemd/system/ghe.service <<EOF
[Unit]
Description=GHE - Sistema de Gestión Hospitalaria Electrónica
After=network.target

[Service]
Type=simple
User=ghe
Group=ghe
WorkingDirectory=/opt/ghe
ExecStart=/usr/bin/java -jar /opt/ghe/ghe.jar
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

# 4. Iniciar servicio
sudo systemctl daemon-reload
sudo systemctl enable ghe
sudo systemctl start ghe

# 5. Verificar
sudo systemctl status ghe
curl http://localhost:3000/health
```

### 2.3. Configuración

```yaml
# /opt/ghe/config.edn
{:server {:port 3000
          :host "0.0.0.0"}
 
 :database {:path "/var/lib/ghe/ghe.db"
            :encryption-key "TU-CLAVE-SECRETA-256"}
 
 :auth {:session-timeout-minutes 30
        :max-login-attempts 5
        :lockout-duration-minutes 15}
 
 :backup {:enabled true
          :directory "/var/backups/ghe"
          :schedule "0 2 * * *"}  # 2:00 AM diario
 
 :sync {:enabled true
        :server-url "https://sync.ghe.local"
        :interval-seconds 300}
 
 :audit {:enabled true
         :retention-years 10}
 
 :ui {:language "es"
      :theme "medical"
      :logo-path "/opt/ghe/logo.png"}}
```

---

## 3. Configuración de Usuarios

### 3.1. Usuarios Iniciales

```bash
# Crear usuario admin
curl -X POST http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -d '{
    "username": "admin",
    "password": "CHANGE-ME-IMMEDIATELY",
    "role": "admin",
    "name": "Administrador del Sistema"
  }'

# Crear usuario médico
curl -X POST http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -d '{
    "username": "dr.perez",
    "password": "secure-password",
    "role": "doctor",
    "name": "Dr. Juan Pérez",
    "cedula": "12345678"
  }'
```

### 3.2. Roles por Defecto

| Usuario | Rol | Permisos |
|---|---|---|
| admin | Admin | Total |
| dr.perez | Doctor | Consultas, recetas, pacientes |
| enfermera.ana | Nurse | Signos vitales, triaje |
| farmacia.carlos | Pharmacy | Inventario, dispensación |
| recepcion.maria | Reception | Registro, agenda |

---

## 4. Backup

### 4.1. Backup Manual

```bash
# Backup completo
/opt/ghe/scripts/backup.sh

# Backup con nombre personalizado
/opt/ghe/scripts/backup.sh "before-update-1.2.0"
```

### 4.2. Backup Automático

```bash
# Cron job (ya configurado en config.edn)
# Ejecuta a las 2:00 AM diario
0 2 * * * /opt/ghe/scripts/backup.sh >> /var/log/ghe/backup.log 2>&1
```

### 4.3. Restauración

```bash
# Listar backups disponibles
/opt/ghe/scripts/list-backups.sh

# Restaurar backup específico
/opt/ghe/scripts/restore.sh /var/backups/ghe/ghe-backup-2024-09-18.encrypted
```

---

## 5. Monitoreo

### 5.1. Health Check

```bash
# Verificar estado del sistema
curl http://localhost:3000/health

# Respuesta esperada:
{
  "status": "healthy",
  "database": "connected",
  "uptime": "5d 12h 30m",
  "patients": 1234,
  "consultations-today": 45
}
```

### 5.2. Logs

```bash
# Ver logs en tiempo real
journalctl -u ghe -f

# Ver logs de errores
journalctl -u ghe -p err

# Ver logs de auditoría
tail -f /var/log/ghe/audit.log
```

### 5.3. Métricas

| Métrica | Umbral | Acción |
|---|---|---|
| Uptime | <99% | Investigar |
| Tiempo respuesta API | >200ms | Optimizar |
| Disco lleno | >80% | Limpiar/expandir |
| Errores por hora | >10 | Investigar |
| Backups fallidos | >0 | Corregir |

---

## 6. Actualización

### 6.1. Proceso de Actualización

```bash
# 1. Crear backup ANTES de actualizar
/opt/ghe/scripts/backup.sh "pre-update"

# 2. Descargar nueva versión
wget https://github.com/org/GHE/releases/latest/ghe.jar -O /opt/ghe/ghe.jar.new

# 3. Verificar checksum
sha256sum /opt/ghe/ghe.jar.new
# Comparar con el publicado en releases

# 4. Detener servicio
sudo systemctl stop ghe

# 5. Reemplazar
mv /opt/ghe/ghe.jar /opt/ghe/ghe.jar.old
mv /opt/ghe/ghe.jar.new /opt/ghe/ghe.jar

# 6. Ejecutar migraciones si existen
java -jar /opt/ghe/ghe.jar migrate

# 7. Iniciar servicio
sudo systemctl start ghe

# 8. Verificar
curl http://localhost:3000/health
```

### 6.2. Rollback

```bash
# Si la actualización falla
sudo systemctl stop ghe
mv /opt/ghe/ghe.jar.old /opt/ghe/ghe.jar
sudo systemctl start ghe
```

---

## 7. Seguridad en Producción

### 7.1. Checklist

- [ ] Password admin cambiado
- [ ] TLS configurado (si aplica)
- [ ] Firewall configurado
- [ ] Backup automatizado funcionando
- [ ] Auditoría habilitada
- [ ] Logs rotándose
- [ ] Monitoreo activo
- [ ] Usuarios innecesarios eliminados

### 7.2. Firewall

```bash
# Solo permitir puertos necesarios
sudo ufw allow 22/tcp    # SSH
sudo ufw allow 80/tcp    # HTTP (redirect a HTTPS)
sudo ufw allow 443/tcp   # HTTPS
sudo ufw deny 3000/tcp   # GHE directo (no exponer)
sudo ufw enable
```

---

## 8. Troubleshooting

### 8.1. Problemas Comunes

| Problema | Causa | Solución |
|---|---|---|
| No inicia | Puerto ocupado | Cambiar puerto en config.edn |
| No responde | Base de datos corrupta | Restaurar desde backup |
| Lento | Disco lleno | Limpiar logs, expandir disco |
| No sincroniza | Sin internet | Verificar conexión, reintentar |
| Login falla | Usuarios dañados | Recrear usuario admin |

### 8.2. Comandos Útiles

```bash
# Estado del servicio
sudo systemctl status ghe

# Reiniciar
sudo systemctl restart ghe

# Verificar base de datos
sqlite3 /var/lib/ghe/ghe.db "SELECT COUNT(*) FROM patients;"

# Verificar integridad
sqlite3 /var/lib/ghe/ghe.db "PRAGMA integrity_check;"

# Exportar logs
/opt/ghe/scripts/export-logs.sh
```

---

*Despliegue GHE: Simple, seguro, verificable.*
