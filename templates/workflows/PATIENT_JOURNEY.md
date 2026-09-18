# Journey del Paciente en GHE

---

## 1. Vista General del Journey

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    JOURNEY COMPLETO DEL PACIENTE                        │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐│
│  │ Llegada  │→ │ Registro │→ │  Triaje  │→ │ Consulta │→ │ Salida   ││
│  │          │  │          │  │          │  │          │  │          ││
│  │ Walk-in  │  │ 2 min    │  │ 5 min    │  │ 10 min   │  │ 3 min    ││
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘  └──────────┘│
│       │              │              │              │              │     │
│       │              │              │              │              │     │
│  ┌────┴──────────────┴──────────────┴──────────────┴──────────────┴───┐│
│  │                    TIEMPO TOTAL: ~20 minutos                      ││
│  └────────────────────────────────────────────────────────────────────┘│
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Escenario 1: Primera Visita (Paciente Nuevo)

### Paso 1: Llegada
```
 paciente llega al consultorio
 ↓
 recepcionista saluda
 ↓
 ¿Tiene cita? → NO → Registro walk-in
```

### Paso 2: Registro (2 minutos)
```
recepcionista captura:
├── Nombre completo
├── CURP (o datos disponibles)
├── Fecha de nacimiento
├── Sexo
├── Teléfono
├── Domicilio
└── Contacto de emergencia

sistema crea:
├── Expediente con ID único
├── Estado: "Activo"
├── Timestamp de creación
└── Asignación automática a médico disponible
```

### Paso 3: Triaje (5 minutos)
```
enfermería registra:
├── Signos vitales:
│   ├── Presión arterial
│   ├── Frecuencia cardíaca
│   ├── Temperatura
│   ├── Peso
│   └── Talla
├── Motivo de consulta
├── Alergias conocidas
├── Medicamentos actuales
└── Antecedentes relevantes

sistema:
├── Calcula IMC
├── Clasifica riesgo (bajo/medio/alto/crítico)
├── Asigna prioridad
└── Notifica al médico
```

### Paso 4: Consulta Médica (10 minutos)
```
médico:
├── Abre expediente
├── Revisa triaje
├── Interrogatorio:
│   ├── Padecimiento actual
│   ├── Antecedentes
│   └── Revisión por aparatos
├── Exploración física
├── Diagnóstico (CIE-10)
├── Plan terapéutico
├── Prescripción (si aplica)
└── Firma nota

sistema:
├── Guarda nota de evolución
├── Genera receta electrónica
├── Envía a farmacia
├── Agenda seguimiento (si aplica)
└── Registra en auditoría
```

### Paso 5: Farmacia (3 minutos)
```
farmacia:
├── Recibe receta electrónica
├── Verifica inventario
├── Surt medicamento
├── Registra dispensación:
│   ├── Lote
│   ├── Caducidad
│   └── Cantidad
└── Entrega al paciente

sistema:
├── Descuenta inventario
├── Vincula dispensación a receta
├── Actualiza estado de receta
└── Registra en auditoría
```

### Paso 6: Salida
```
paciente:
├── Recibe medicamento
├── Recibe indicaciones
├── Recibe fecha de seguimiento
└── Sale del consultorio

sistema:
├── Cierra consulta
├── Actualiza expediente
├── Genera recordatorio (WhatsApp)
└── Prepara datos para sync
```

---

## 3. Escenario 2: Control Prenatal

### Flujo de 9 meses

```
MES 1-3 (Primer Trimestre)
├── 1ra visita: Confirmación de embarazo
├── Registro: FUR, EDD, factores de riesgo
├── Estudios: Biometría, glucosa, orina, VDRL
├── Suplementación: Ácido fólico, hierro
└── Próximo control: 4 semanas

MES 4-6 (Segundo Trimestre)
├── Controles mensuales
├── Signos vitales
├── Altura uterina
├── FCF
├── Ecografía (20-24 semanas)
├── Tamizaje de diabetes gestacional
└── Próximo control: 4 semanas

MES 7-9 (Tercer Trimestre)
├── Controles quincenales
├── Vigilancia de preeclampsia
├── Vigilancia de crecimiento fetal
├── Plan de parto
├── Educación: Signos de alarma
└── Próximo control: 2 semanas

PARTO
├── Atención del parto
├── Registro del nacimiento
├── Evaluación neonatal
└── Ingreso al puerperio

PUERPERIO
├── Control a las 6 semanas
├── Evaluación postparto
├── Planificación familiar
└── Cierre del embarazo
```

---

## 4. Escenario 3: Emergencia Obstétrica

### Flujo de Emergencia

```
DETECCIÓN
├── Paciente llega con sangrado/dolor/cefalea severa
├── Triaje inmediato (sin turno)
├── Clasificación: CRÍTICO
└── Alerta máxima al médico

ATENCIÓN INMEDIATA
├── Médico atiende en <5 minutos
├── Evaluación completa
├── Decisiones:
│   ├── ¿Puede manejarse localmente?
│   │   ├── Sí → Tratamiento + monitoreo
│   │   └── No → Referencia urgente
│   └── Referencia:
│       ├── Generar nota de referencia
│       ├── Incluir resumen clínico
│       ├── Incluir signos vitales
│       ├── Incluir estudios
│       └── Contactar hospital receptor

SEGUIMIENTO
├── Registro completo de emergencia
├── Nota de referencia en expediente
├── Seguimiento post-emergencia
└── Reporte a COFEPRIS (si aplica)
```

---

## 5. Escenario 4: Paciente Crónico (Diabetes/HTA)

### Flujo de Seguimiento

```
REGISTRO INICIAL
├── Diagnóstico confirmado
├── Plan de tratamiento
├── Meta terapéutica
├── Frecuencia de seguimiento
└── Educación al paciente

SEGUIMIENTO PERIÓDICO
├── Cada 1-3 meses
├── Signos vitales
├── Evaluación de adherencia
├── Ajuste de medicamentos
├── Estudios de control
├── Educación continua
└── Recordatorios automáticos

ALERTAS AUTOMÁTICAS
├── PA > meta → Alerta
├── Glucosa > meta → Alerta
├── No asistencia → Recordatorio
├── Estudios pendientes → Recordatorio
└── Cambio de tratamiento → Nota
```

---

## 6. Métricas del Journey

| Métrica | Objetivo | Medición |
|---|---|---|
| Tiempo total primera visita | <30 min | Timestamps |
| Tiempo de registro | <2 min | Timestamps |
| Tiempo de triaje | <5 min | Timestamps |
| Tiempo de consulta | <15 min | Timestamps |
| Tiempo de dispensación | <5 min | Timestamps |
| Satisfacción del paciente | >85% | Encuesta |
| Retorno para seguimiento | >80% | Registros |
| Complicaciones detectadas | >95% | Registros |

---

*Journey GHE: Cada paso cuenta para la vida del paciente.*
