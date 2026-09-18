# Guía Offline-First para el Proyecto GHE

> *"Offline-first no es una característica — es la razón de ser de GHE."*

---

## 1. ¿Qué es Offline-First?

**Offline-First** es una arquitectura donde el sistema funciona completamente sin conexión a internet, y la sincronización es un proceso secundario que mejora la experiencia pero no es necesaria para operar.

### Contexto GHE

GHE opera en la **Maternidad de Altotonga**, una comunidad rural en la sierra de Veracruz, México, con conectividad **2G/EDGE intermitente**. Sin offline-first, el sistema sería inútil.

---

## 2. Arquitectura Offline-First de GHE

```
┌─────────────────────────────────────────────────────────────┐
│                    USUARIO (Médico/Enfermera)                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              UI (ClojureScript)                      │   │
│  │  - Indicador de conexión (🟢/🔴)                    │   │
│  │  - Feedback de "Guardado localmente"                │   │
│  └─────────────────────┬───────────────────────────────┘   │
│                        │                                    │
│  ┌─────────────────────┴───────────────────────────────┐   │
│  │           APPLICATION LAYER                          │   │
│  │  - Use Cases                                         │   │
│  │  - Validación de negocio                             │   │
│  └─────────────────────┬───────────────────────────────┘   │
│                        │                                    │
│  ┌─────────────────────┴───────────────────────────────┐   │
│  │           DOMAIN LAYER                               │   │
│  │  - Entidades (Patient, Consultation, Prescription)   │   │
│  │  - Value Objects (CURP, BloodType, VitalSigns)       │   │
│  │  - Eventos de dominio                                │   │
│  │  - Reglas de negocio                                 │   │
│  └─────────┬───────────────────────────┬───────────────┘   │
│            │                           │                    │
│  ┌─────────┴─────────┐     ┌─────────┴─────────┐         │
│  │  LOCAL STORAGE    │     │   SYNC ENGINE     │         │
│  │  (SQLite + WAL)   │     │   (Outbox Pattern)│         │
│  │                   │     │                   │         │
│  │  ┌─────────────┐ │     │  ┌─────────────┐  │         │
│  │  │   patients  │ │     │  │ sync_outbox │  │         │
│  │  │ consultations│ │     │  │ conflicts   │  │         │
│  │  │ prescriptions│ │    │  │ sync_log    │  │         │
│  │  │ vital_signs │ │     │  └─────────────┘  │         │
│  │  │ pregnancies │ │     │                   │         │
│  │  │ audit_log   │ │     │  Estrategia:      │         │
│  │  └─────────────┘ │     │  - Outbox Pattern │         │
│  │                   │     │  - Delta Sync     │         │
│  │  FUENTE DE        │     │  - Retry + Backoff│         │
│  │  VERDAD LOCAL     │     │  - Conflict Res.  │         │
│  └───────────────────┘     └─────────┬─────────┘         │
│                                      │                    │
│                              ┌───────┴───────┐           │
│                              │   NETWORK     │           │
│                              │   DETECTION   │           │
│                              │               │           │
│                              │  🟢 Online    │           │
│                              │  🔴 Offline   │           │
│                              │  🟡 Syncing   │           │
│                              └───────┬───────┘           │
│                                      │                    │
│                              ┌───────┴───────┐           │
│                              │   CLOUD       │           │
│                              │   (Future)    │           │
│                              │               │           │
│                              │  - Backup     │           │
│                              │  - Multi-site │           │
│                              │  - Reporting  │           │
│                              └───────────────┘           │
└─────────────────────────────────────────────────────────────┘
```

---

## 3. Componentes Clave

### 3.1. Local Storage (SQLite)

| Característica | Valor |
|---|---|
| **Base de datos** | SQLite 3.40+ con SQLCipher |
| **Cifrado** | AES-256 |
| **Journal mode** | WAL (Write-Ahead Logging) |
| **FTS5** | Búsqueda de texto completo |
| **Tamaño máximo** | 2GB |
| **Rendimiento** | <50ms por operación |

### 3.2. Sync Engine

| Componente | Función |
|---|---|
| **Outbox Pattern** | Cola de operaciones pendientes |
| **Delta Sync** | Solo enviar cambios |
| **Batch Processing** | Enviar múltiples ops juntas |
| **Retry + Backoff** | Reintentar con espera exponencial |
| **Conflict Resolution** | Última escritura gana |

### 3.3. Connectivity Detection

| Estado | Comportamiento |
|---|---|
| **Online (WiFi)** | Sync inmediata |
| **Online (2G)** | Sync diferida, datos críticos primero |
| **Offline** | Todo local, sync cuando haya |

---

## 4. Flujo de Datos

### 4.1. Operación Offline

```
1. Médico registra signos vitales
2. UI captura datos
3. Application valida
4. Domain procesa
5. SQLite guarda (WAL mode, <50ms)
6. sync_outbox registra operación
7. UI muestra "Guardado localmente ✅"
8. Cuando haya internet, sync ejecuta
```

### 4.2. Sincronización

```
1. Connectivity detection detecta internet
2. Sync engine lee sync_outbox (por prioridad)
3. Envía lote de operaciones al cloud
4. Cloud procesa y retorna resultado
5. sync_outbox marca como SYNCED
6. Si conflicto → resuelve automáticamente
7. Si fallo → retry con backoff
```

---

## 5. Conflict Resolution

| Estrategia | Cuándo | Ejemplo |
|---|---|---|
| **Last-write-wins** | Por defecto | Signos vitales |
| **Merge automático** | Campos diferentes | Nombre + teléfono |
| **Manual** | Datos críticos | Diagnóstico |
| **No resolver** | Auditoría | Log de cambios |

---

## 6. Métricas

```yaml
offline_first_metrics:
  local_storage:
    avg_operation_time: "45ms"
    database_size: "350MB (10K patients)"
    fts_search_time: "180ms"
  
  sync_engine:
    pending_operations: 23
    sync_success_rate: "99.2%"
    avg_sync_time: "12s"
    conflict_resolution_rate: "98% automatic"
  
  connectivity:
    online_hours_per_day: 8
    offline_hours_per_day: 16
    avg_bandwidth: "50 Kbps (2G)"
  
  data_integrity:
    hash_verification: "100%"
    backup_frequency: "daily"
    restoration_time: "<5 min"
```

---

## 7. Checklist

- [ ] SQLite configurado con WAL + AES-256
- [ ] Outbox pattern implementado
- [ ] Delta sync funcionando
- [ ] Conflict resolution automática
- [ ] Connectivity detection activa
- [ ] Indicador de conexión en UI
- [ ] Backup automático diario
- [ ] Retry con backoff exponencial
- [ ] Integrity hash por registro
- [ ] FTS5 para búsquedas

---

## 8. Referencias

- **"Offline-First Applications"**: O'Reilly
- **"PouchDB: The Database that Syncs"**: PouchDB documentation
- **"CRDTs: Consistent, Available, Partition-Tolerant Data Structures"**: Research papers
- **"Local-First Software"**: Ink & Switch research

---

*Offline-First en GHE: El sistema funciona siempre, con o sin internet.*
