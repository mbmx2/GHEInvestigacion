# Flujos Clínicos de GHE

> *"Cada flujo representa una vida que confía en nosotros."*

---

## 1. Flujo Principal: Atención Prenatal

### 1.1. Primer Control Prenatal

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Registro   │ →  │  Triaje     │ →  │  Consulta   │ →  │  Plan de    │
│  Paciente   │    │  Obstétrico │    │  Médica     │    │  Seguimiento│
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

**Detalle:**

1. **Registro Paciente**
   - Datos demográficos (nombre, CURP, fecha nacimiento, sexo)
   - Datos de contacto (dirección, teléfono, contacto de emergencia)
   - Crear expediente clínico
   - Asignar ID de paciente

2. **Triaje Obstétrico**
   - Fecha de última regla (FUR)
   - Fecha probable de parto (FPP)
   - Edad gestacional actual
   - Factores de riesgo iniciales
   - Signos vitales baseline

3. **Consulta Médica**
   - Interrogatorio: antecedentes, padecimiento actual
   - Exploración física completa
   - Signos vitales: PA, FC, T, Peso, Talla
   - Examen obstétrico: altura uterina, FCF, presentación
   - Laboratorios: biometría hemática, glucosa, orina
   - Diagnóstico: estado de salud materno-fetal
   - Plan: próximos controles, indicaciones

4. **Plan de Seguimiento**
   - Próxima fecha de control (4 semanas)
   - Estudios pendientes
   - Medicamentos indicados
   - Signos de alarma para buscar atención urgente

### 1.2. Controles Subsecuentes

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Apertura   │ →  │  Evaluación │ →  │  Actualiza- │
│  Expediente │    │  Rápida     │    │  ción Plan  │
└─────────────┘    └─────────────┘    └─────────────┘
```

**Evaluación Rápida (5-10 minutos):**
- Signos vitales
- Altura uterina
- FCF
- Proteinuria (si aplica)
- Edema
- Peso
- Observaciones

---

## 2. Flujo de Farmacia

### 2.1. Dispensación de Medicamentos

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Receta     │ →  │  Verificar  │ →  │  Surtir     │ →  │  Registrar  │
│  Electrónica│    │  Inventario │    │  Medicamento│    │  Dispensación│
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

**Detalle:**

1. **Receta Electrónica**
   - Médico genera receta desde expediente
   - Medicamento, dosis, cantidad, instrucciones
   - Firma electrónica del médico

2. **Verificar Inventario**
   - Sistema verifica stock disponible
   - Si no hay stock → alerta + alternativas
   - Verificar caducidad

3. **Surtir Medicamento**
   - Descontar del inventario
   - Registrar lote y caducidad
   - Registrar quién surtió

4. **Registrar Dispensación**
   - Vincular a receta del paciente
   - Registrar hora de dispensación
   - Actualizar estado de receta

### 2.2. Control de Inventario

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Recepción  │ →  │  Almacenaje │ →  │  Alertas    │
│  Mercancía  │    │  y Registro │    │  Automáticas│
└─────────────┘    └─────────────┘    └─────────────┘
```

**Alertas Automáticas:**
- Stock mínimo → Resurtido
- Caducidad próxima → 3 meses antes
- Medicamento sin movimiento → 6 meses
- Lote vencido → Bloqueo de dispensación

---

## 3. Flujo de Emergencia Obstétrica

### 3.1. Detección de Complicación

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Alerta de  │ →  │  Triaje     │ →  │  Decisión   │ →  │  Acción     │
│  Sistema    │    │  Urgente    │    │  Clínica    │    │  Inmediata  │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

**Tipos de Alerta:**

| Alerta | Criterio | Acción |
|---|---|---|
| **Preeclampsia** | PA ≥ 140/90 + proteinuria | Referencia urgente |
| **Hemorragia** | Sangrado genital activo | Referencia urgente |
| **Desproporción cefalopélvica** | Tamaño fetal vs. pelvis | Evaluación especializada |
| **Ruptura prematura de membranas** | antes de 37 semanas | Referencia |
| **Sufrimiento fetal** | FCF < 110 o > 160 persistente | Monitoreo continuo |

### 3.2. Referencia a Hospital

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Generar    │ →  │  Enviar     │ →  │  Seguimiento│
│  Referencia │    │  Resumen    │    │  Posterior  │
└─────────────┘    └─────────────┘    └─────────────┘
```

**Contenido de la Referencia:**
- Resumen clínico estructurado
- Signos vitales históricos
- Diagnósticos con CIE-10
- Tratamientos previos
- Motivo de referencia
- Urgencia

---

## 4. Flujo de Reportes

### 4.1. Hoja Diaria de Pacientes

```sql
-- Generación automática
SELECT 
    DATE(consultation_date) as fecha,
    COUNT(*) as total_consultas,
    SUM(CASE WHEN consultation_type = 'prenatal' THEN 1 ELSE 0 END) as prenatales,
    SUM(CASE WHEN risk_level = 'high' THEN 1 ELSE 0 END) as alto_riesgo,
    SUM(CASE WHEN risk_level = 'critical' THEN 1 ELSE 0 END) as criticos
FROM consultations
WHERE DATE(consultation_date) = CURRENT_DATE
GROUP BY DATE(consultation_date);
```

### 4.2. Reporte SUIVE (COFEPRIS)

| Campo | Fuente en GHE |
|---|---|
| Nombre del establecimiento | Configuración del sistema |
| Fecha del reporte | Automático |
| Total de consultas | COUNT de consultations |
| Enfermedades respiratorias | Diagnósticos CIE-10 J00-J99 |
| Enfermedades diarreicas | Diagnósticos CIE-10 A09 |
| IRAs en menores de 5 | Cruzar diagnósticos + edad |

---

## 5. Flujo de Auditoría

### 5.1. Auditoría de Accesos

```sql
-- Quién accedió a qué expediente
SELECT 
    u.username,
    a.entity_type,
    a.entity_id,
    a.action,
    a.timestamp
FROM audit_log a
JOIN users u ON a.user_id = u.id
WHERE a.timestamp BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY a.timestamp DESC;
```

### 5.2. Auditoría de Integridad

```sql
-- Verificar que no hay registros alterados
SELECT 
    id,
    hash,
    -- Recalcular hash y comparar
FROM audit_log
WHERE hash != recalculated_hash;
```

---

## 6. Métricas de Flujo

| Flujo | Tiempo Objetivo | Medición |
|---|---|---|
| Registro de paciente nuevo | <2 min | Timestamps |
| Control prenatal rápido | <10 min | Timestamps |
| Dispensación de medicamento | <3 min | Timestamps |
| Generación de receta | <30 seg | Timestamps |
| Búsqueda de expediente | <500 ms | Performance logs |
| Generación de reporte | <5 seg | Performance logs |

---

*Flujos GHE: Diseñados para la velocidad sin sacrificar calidad.*
