# Estándares de Seguridad para GHE

---

## 1. Principios de Seguridad

```
1. Defense in Depth - Múltiples capas de protección
2. Least Privilege - Acceso mínimo necesario
3. Fail Secure - En caso de fallo, denegar acceso
4. Separation of Duties - Separación de responsabilidades
5. Security by Design - Seguridad desde el diseño
```

---

## 2. Autenticación

### 2.1. Requisitos

| Requisito | Implementación | Estado |
|---|---|---|
| Password hasheado | bcrypt (salt + hash) | ✅ |
| Bloqueo por intentos | 5 intentos → bloqueo 15 min | ✅ |
| Sesión segura | Token con expiración | ✅ |
| Logout automático | 30 min de inactividad | ✅ |
| MFA | Futuro (TOTP) | 📋 |

### 2.2. Almacenamiento de Passwords

```clojure
;; NUNCA almacenar passwords en texto plano
;; Usar bcrypt con work factor 12+

(ns ghe.auth)

(defn hash-password
  "Genera hash bcrypt del password."
  [password]
  (bcrypt/hash-bcrypt password :work-factor 12))

(defn verify-password
  "Verifica password contra hash."
  [password hash]
  (bcrypt/check-bcrypt password hash))
```

---

## 3. Autorización (RBAC)

### 3.1. Roles Definidos

```clojure
(def roles
  {:admin
   {:description "Administrador del sistema"
    :permissions #{:manage-users
                   :view-reports
                   :system-config
                   :audit-access
                   :backup-restore}}
   
   :doctor
   {:description "Médico"
    :permissions #{:create-consultation
                   :prescribe
                   :view-patients
                   :view-full-history
                   :sign-notes
                   :refer-patients}}
   
   :nurse
   {:description "Enfermera"
    :permissions #{:record-vitals
                   :triage
                   :view-patients
                   :record-prenatal-visit}}
   
   :pharmacy
   {:description "Farmacéutico"
    :permissions #{:dispense
                   :manage-inventory
                   :view-prescriptions
                   :receive-merchandise}}
   
   :reception
   {:description "Recepcionista"
    :permissions #{:register-patient
                   :schedule
                   :view-basic-info
                   :print-records}}})
```

### 3.2. Matriz de Acceso

| Recurso | Admin | Doctor | Nurse | Pharmacy | Reception |
|---|---|---|---|---|---|
| Ver expediente completo | ✅ | ✅ | ⚠️ Parcial | ❌ | ❌ |
| Ver datos demográficos | ✅ | ✅ | ✅ | ✅ | ✅ |
| Crear consulta | ❌ | ✅ | ❌ | ❌ | ❌ |
| Registrar signos vitales | ❌ | ✅ | ✅ | ❌ | ❌ |
| Prescribir medicamentos | ❌ | ✅ | ❌ | ❌ | ❌ |
| Sur medicamentos | ❌ | ❌ | ❌ | ✅ | ❌ |
| Manejar inventario | ❌ | ❌ | ❌ | ✅ | ❌ |
| Ver reportes | ✅ | ⚠️ Los suyos | ⚠️ Los suyos | ⚠️ Farmacia | ❌ |
| Configurar sistema | ✅ | ❌ | ❌ | ❌ | ❌ |
| Ver auditoría | ✅ | ❌ | ❌ | ❌ | ❌ |

---

## 4. Cifrado

### 4.1. En Reposo (AES-256)

```clojure
;; SQLite database encryption
;; Usar SQLCipher o cifrado a nivel de aplicación

(ns ghe.infrastructure.encryption)

(defn encrypt-data
  "Cifra datos con AES-256-GCM."
  [plaintext key]
  (let [iv (generate-iv)]
    {:ciphertext (aes/encrypt plaintext key iv)
     :iv iv
     :algorithm "AES-256-GCM"}))

(defn decrypt-data
  "Descifra datos con AES-256-GCM."
  [ciphertext key iv]
  (aes/decrypt ciphertext key iv))
```

### 4.2. En Tránsito (TLS 1.3)

```
Todas las comunicaciones HTTP deben ser HTTPS con TLS 1.3.
Configuración del servidor:
- Protocolo: TLS 1.3 solamente
- Cipher suites: TLS_AES_256_GCM_SHA384
- HSTS: max-age=31536000
- Certificate pinning: para sincronización
```

### 4.3. Backups Cifrados

```clojure
(defn create-encrypted-backup
  "Crea backup cifrado de la base de datos."
  [db-path backup-path encryption-key]
  (let [db-data (slurp db-path)
        encrypted (encrypt-data db-data encryption-key)]
    (spit backup-path (pr-str encrypted))
    {:backup-path backup-path
     :timestamp (java.time.Instant/now)
     :size (.length (java.io.File. backup-path))}))
```

---

## 5. Auditoría

### 5.1. Qué Registrar

| Acción | Obligatorio | Ejemplo |
|---|---|---|
| Login/Logout | ✅ | Usuario X inició sesión |
| Crear registro | ✅ | Paciente Y creado |
| Leer registro | ✅ | Expediente Z consultado |
| Modificar registro | ✅ | Nota modificada |
| Eliminar registro | ✅ | (Soft delete) |
| Exportar datos | ✅ | Expediente exportado a PDF |
| Cambio de permisos | ✅ | Rol modificado |
| Error de seguridad | ✅ | Intento de acceso denegado |

### 5.2. Formato de Auditoría

```sql
CREATE TABLE audit_log (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    user_role TEXT NOT NULL,
    action TEXT NOT NULL,           -- 'create', 'read', 'update', 'delete'
    entity_type TEXT NOT NULL,      -- 'patient', 'consultation', etc.
    entity_id TEXT NOT NULL,
    old_value TEXT,                 -- JSON (antes del cambio)
    new_value TEXT,                 -- JSON (después del cambio)
    ip_address TEXT,
    user_agent TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    hash TEXT NOT NULL              -- SHA-256 para integridad
);
```

### 5.3. Integridad del Log

```clojure
(defn calculate-audit-hash
  "Calcula hash SHA-256 de un registro de auditoría."
  [audit-entry]
  (let [data (str (:user-id audit-entry)
                  (:action audit-entry)
                  (:entity-type audit-entry)
                  (:entity-id audit-entry)
                  (:timestamp audit-entry))]
    (sha256-hash data)))

(defn verify-audit-integrity
  "Verifica que el log de auditoría no ha sido alterado."
  [db]
  (let [entries (db/get-all-audit-entries db)]
    (every? (fn [entry]
              (= (:hash entry)
                 (calculate-audit-hash entry)))
            entries)))
```

---

## 6. Datos Sensibles (LFPDPPP)

### 6.1. Clasificación

```clojure
(def data-classification
  {:public      {:description "Datos no sensibles"
                 :protection "Ninguna especial"}
   :internal    {:description "Datos internos del sistema"
                 :protection "Acceso controlado"}
   :confidential {:description "Datos confidenciales"
                  :protection "Cifrado + RBAC"}
   :sensitive   {:description "Datos sensibles (salud)"
                 :protection "Consentimiento + Cifrado + RBAC + Audit"}})
```

### 6.2. Consentimiento

```clojure
(defn requires-consent?
  "Determina si un tipo de dato requiere consentimiento."
  [data-type]
  (contains? #{:health-data
               :biometric-data
               :genetic-data
               :sexual-health
               :mental-health
               :substance-use}
             data-type))

(defn get-consent-form
  "Genera formulario de consentimiento para tratamiento de datos."
  [patient-id data-types]
  {:patient-id patient-id
   :data-types data-types
   :purposes ["Atención médica" "Investigación" "Reportes sanitarios"]
   :rights ["Acceso" "Rectificación" "Cancelación" "Oposición"]
   :timestamp (java.time.Instant/now)})
```

---

## 7. Backup y Recuperación

### 7.1. Estrategia de Backup

| Tipo | Frecuencia | Retención | Almacenamiento |
|---|---|---|---|
| Backup completo | Diario | 30 días | Local + USB |
| Backup incremental | Cada hora | 7 días | Local |
| Backup de auditoría | Semanal | 1 año | Local + USB offsite |

### 7.2. Proceso de Backup

```clojure
(defn perform-daily-backup
  "Ejecuta backup diario automatizado."
  [config]
  (let [timestamp (java.time.Instant/now)
        backup-name (str "ghe-backup-" timestamp ".encrypted")
        backup-path (str (:backup-dir config) "/" backup-name)]
    ;; 1. Crear backup cifrado
    (create-encrypted-backup 
      (:db-path config) 
      backup-path 
      (:encryption-key config))
    ;; 2. Verificar integridad
    (verify-backup-integrity backup-path)
    ;; 3. Registrar en auditoría
    (log-audit-event :backup-created {:path backup-path})
    ;; 4. Limpiar backups antiguos
    (cleanup-old-backups (:backup-dir config) 30)
    {:success true :backup backup-path}))
```

### 7.3. Restauración

```clojure
(defn restore-from-backup
  "Restaura base de datos desde backup."
  [backup-path encryption-key]
  (try
    ;; 1. Verificar integridad del backup
    (when-not (verify-backup-integrity backup-path)
      (throw (ex-info "Backup corrupto" {:backup backup-path})))
    ;; 2. Descifrar
    (let [decrypted (decrypt-backup backup-path encryption-key)]
      ;; 3. Restaurar
      (restore-db decrypted)
      ;; 4. Verificar restauración
      (verify-restore)
      {:success true})
    (catch Exception e
      {:success false :error (ex-message e)})))
```

---

## 8. OWASP Top 10: Mitigaciones

| # | Riesgo | Mitigación en GHE |
|---|---|---|
| A01 | Broken Access Control | RBAC + validación en backend |
| A02 | Cryptographic Failures | AES-256 + TLS 1.3 + bcrypt |
| A03 | Injection | Parameterized queries |
| A04 | Insecure Design | Threat modeling |
| A05 | Security Misconfiguration | Defaults seguros |
| A06 | Vulnerable Components | Dependency scanning |
| A07 | Auth Failures | Rate limiting + lockout |
| A08 | Data Integrity Failures | SHA-256 audit logs |
| A09 | Logging Failures | Audit trail completo |
| A10 | SSRF | Input validation + allowlist |

---

*Seguridad GHE: Porque los datos de salud son sagrados.*
