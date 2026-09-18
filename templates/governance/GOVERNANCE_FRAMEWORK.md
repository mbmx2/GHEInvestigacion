# Templates de Gobernanza, Agents y Reglas Especializadas

> *"Sin gobernanza, los agents son código sin dirección. Con gobernanza, son fuerza multiplicadora."*

---

## 1. Estructura de Gobernanza

### 1.1. Modelo de Gobernanza Multiagente

```
┌─────────────────────────────────────────────────────────────┐
│                    GOBERNANZA GHE                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  NIVEL 1: GOBERNANZA ESTRATÉGICA                           │
│  ├── Comité Directivo                                       │
│  │   ├── Director de proyecto                               │
│  │   ├── Director médico                                    │
│  │   └── Director de TI                                     │
│  ├── Decisiones: roadmap, presupuesto, alianzas            │
│  └── Frecuencia: Mensual                                   │
│                                                             │
│  NIVEL 2: GOBERNANZA TÁCTICA                               │
│  ├── Comité Técnico                                         │
│  │   ├── Tech lead                                          │
│  │   ├── Architect                                          │
│  │   └── QA lead                                            │
│  ├── Decisiones: arquitectura, estándares, release         │
│  └── Frecuencia: Semanal                                   │
│                                                             │
│  NIVEL 3: GOBERNANZA OPERATIVA                             │
│  ├── Scrum Master / Coordinador de agents                  │
│  ├── Decisiones: sprint, asignación, bloqueos              │
│  └── Frecuencia: Diaria                                    │
│                                                             │
│  NIVEL 4: GOBERNANZA DE AGENTS                             │
│  ├── Coordinator Agent (Agente 0)                          │
│  ├── Decisiones: distribución, priorización, resolución    │
│  └── Frecuencia: Continua                                  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 2. Templates de Agents

### 2.1. Template: Definición de Agent

```yaml
# AGENT-[ID]: [NOMBRE DEL AGENTE]
agent_id: "AGENT-[XXX]"
version: "1.0"
created: "[Fecha]"

# Identidad
name: "[Nombre del agente]"
role: "[Rol principal]"
discipline: "[Disciplina especializada]"
description: "[Descripción concisa del agente]"

# Capacidades
capabilities:
  - "[Capacidad 1]"
  - "[Capacidad 2]"
  - "[Capacidad 3]"

# Herramientas disponibles
tools:
  - name: "[Herramienta 1]"
    purpose: "[Propósito]"
    access_level: "read/write/admin"
  - name: "[Herramienta 2]"
    purpose: "[Propósito]"
    access_level: "read/write"

# Templates que puede usar
templates:
  - "[Template 1]"
  - "[Template 2]"
  - "[Template 3]"

# Restricciones
constraints:
  - "[Restricción 1]"
  - "[Restricción 2]"
  - "[Restricción 3]"

# Inputs esperados
inputs:
  - name: "[Input 1]"
    type: "[string/json/file]"
    required: true
  - name: "[Input 2]"
    type: "[string/json]"
    required: false

# Outputs producidos
outputs:
  - name: "[Output 1]"
    format: "[markdown/json/yaml]"
    description: "[Descripción]"
  - name: "[Output 2]"
    format: "[markdown/json]"
    description: "[Descripción]"

# Protocolo de comunicación
communication:
  inbound: "[Qué mensajes puede recibir]"
  outbound: "[Qué mensajes puede enviar]"
  escalation: "[Cuándo escalar al coordinador]"
  format: "[Formato de mensajes]"

# Métricas de desempeño
metrics:
  - name: "[Métrica 1]"
    target: "[Objetivo]"
    measurement: "[Cómo medir]"
  - name: "[Métrica 2]"
    target: "[Objetivo]"
    measurement: "[Cómo medir]"

# Dependencias
dependencies:
  - agent: "[Agent dependiente]"
    relationship: "[depends_on/blocks/provides_to]"
    purpose: "[Para qué]"

# Configuración
config:
  temperature: 0.3  # Precisión vs. creatividad
  max_tokens: 4096
  timeout_seconds: 300
  retry_attempts: 3
```

### 2.2. Template: Registro de Agents

```yaml
# Registro de Agents del Proyecto GHE
version: "1.0"
last_updated: "[Fecha]"

agents:
  # ─── GOBERNANZA ───
  - id: "AGENT-000"
    name: "Coordinator"
    role: "Coordinador General"
    discipline: "Gestión de Proyecto"
    level: 1
    status: "active"
    
  # ─── ANÁLISIS ───
  - id: "AGENT-001"
    name: "Legal Analyst"
    role: "Analista Jurídico"
    discipline: "Derecho"
    level: 2
    status: "active"
    
  - id: "AGENT-002"
    name: "Economic Analyst"
    role: "Analista Económico"
    discipline: "Economía"
    level: 2
    status: "active"
    
  - id: "AGENT-003"
    name: "Ethics Analyst"
    role: "Analista Ético"
    discipline: "Bioética"
    level: 2
    status: "active"
    
  - id: "AGENT-004"
    name: "Sociological Analyst"
    role: "Analista Sociológico"
    discipline: "Sociología"
    level: 2
    status: "active"
    
  - id: "AGENT-005"
    name: "Technical Analyst"
    role: "Analista Técnico"
    discipline: "Ingeniería de Software"
    level: 2
    status: "active"
    
  - id: "AGENT-006"
    name: "Clinical Analyst"
    role: "Analista Clínico"
    discipline: "Medicina"
    level: 2
    status: "active"
    
  - id: "AGENT-007"
    name: "Data Analyst"
    role: "Analista de Datos"
    discipline: "Ciencia de Datos"
    level: 2
    status: "active"
    
  # ─── DESARROLLO ───
  - id: "AGENT-010"
    name: "Requirements Agent"
    role: "Especialista en Requisitos"
    discipline: "Ingeniería de Requisitos"
    level: 3
    status: "active"
    
  - id: "AGENT-011"
    name: "Architecture Agent"
    role: "Arquitecto de Software"
    discipline: "Arquitectura"
    level: 3
    status: "active"
    
  - id: "AGENT-012"
    name: "Developer Agent"
    role: "Desarrollador"
    discipline: "Programación"
    level: 3
    status: "active"
    
  - id: "AGENT-013"
    name: "QA Agent"
    role: "Ingeniero de Calidad"
    discipline: "Testing"
    level: 3
    status: "active"
    
  - id: "AGENT-014"
    name: "Security Agent"
    role: "Especialista en Seguridad"
    discipline: "Seguridad Informática"
    level: 3
    status: "active"
    
  - id: "AGENT-015"
    name: "DevOps Agent"
    role: "Ingeniero DevOps"
    discipline: "Infraestructura"
    level: 3
    status: "active"
    
  # ─── CLÍNICO ───
  - id: "AGENT-020"
    name: "Medical Director Agent"
    role: "Director Médico"
    discipline: "Medicina General"
    level: 2
    status: "active"
    
  - id: "AGENT-021"
    name: "Obstetric Agent"
    role: "Especialista Obstétrico"
    discipline: "Obstetricia"
    level: 3
    status: "active"
    
  - id: "AGENT-022"
    name: "Pharmacy Agent"
    role: "Farmacéutico"
    discipline: "Farmacia"
    level: 3
    status: "active"
    
  - id: "AGENT-023"
    name: "Nursing Agent"
    role: "Enfermera"
    discipline: "Enfermería"
    level: 3
    status: "active"
```

---

## 3. Reglas Especializadas

### 3.1. Template: Regla de Agente

```yaml
# RULE-[ID]: [NOMBRE DE LA REGLA]
rule_id: "RULE-[XXX]"
version: "1.0"
created: "[Fecha]"

# Metadata
name: "[Nombre descriptivo]"
description: "[Descripción de la regla]"
category: "[Seguridad/Calidad/Proceso/Ética]"
priority: "[Crítica/Alta/Media/Baja]"
applies_to: "[Agent IDs o todos]"

# Condición de activación
trigger:
  event: "[Evento que activa la regla]"
  conditions:
    - "[Condición 1]"
    - "[Condición 2]"

# Acción a tomar
action:
  type: "[reject/flag/modify/notify/escalate]"
  description: "[Qué hacer]"
  parameters:
    - "[Parámetro 1]"

# Excepciones
exceptions:
  - condition: "[Cuándo no aplica]"
    action: "[Qué hacer en su lugar]"

# Ejemplo de uso
example:
  input: "[Ejemplo de input]"
  expected_output: "[Ejemplo de output]"

# Auditoría
audit:
  log_level: "[info/warn/error]"
  notify: "[Quién recibe notificación]"
  retention: "[Período de retención]"
```

### 3.2. Reglas de Seguridad

```yaml
# Reglas de seguridad para todos los agents
security_rules:
  
  RULE-SEC-001:
    name: "No exponer datos de pacientes"
    description: "Ningún agent puede exponer datos identificables de pacientes en logs, mensajes o outputs públicos"
    applies_to: "ALL"
    priority: "CRÍTICA"
    action: "reject"
    exception: "Solo agentes autorizados con RBAC pueden acceder a datos identificables"
    
  RULE-SEC-002:
    name: "Cifrado de datos sensibles"
    description: "Todos los datos sensibles deben estar cifrados antes de transmitir o almacenar"
    applies_to: "ALL"
    priority: "CRÍTICA"
    action: "reject"
    exception: "Ninguna"
    
  RULE-SEC-003:
    name: "No hardcodear credenciales"
    description: "Ningún agent puede incluir credenciales, tokens o claves en código o configuración"
    applies_to: "ALL"
    priority: "CRÍTICA"
    action: "reject"
    exception: "Ninguna"
    
  RULE-SEC-004:
    name: "Auditoría de accesos"
    description: "Todo acceso a datos sensibles debe ser registrado en audit log"
    applies_to: "ALL"
    priority: "ALTA"
    action: "flag"
    exception: "Ninguna"
    
  RULE-SEC-005:
    name: "Validación de input"
    description: "Todo input debe ser validado antes de procesar"
    applies_to: "ALL"
    priority: "ALTA"
    action: "reject"
    exception: "Ninguna"
```

### 3.3. Reglas de Calidad

```yaml
# Reglas de calidad para desarrollo
quality_rules:
  
  RULE-QUAL-001:
    name: "TDD obligatorio"
    description: "Todo código nuevo debe tener tests escritos antes o simultáneamente"
    applies_to: "AGENT-012, AGENT-013"
    priority: "ALTA"
    action: "reject"
    condition: "Si código no tiene tests asociados"
    
  RULE-QUAL-002:
    name: "Cobertura mínima 85%"
    description: "La cobertura de código no puede bajar de 85%"
    applies_to: "AGENT-013"
    priority: "ALTA"
    action: "flag"
    condition: "Si cobertura < 85%"
    
  RULE-QUAL-003:
    name: "Code review obligatorio"
    description: "Todo código debe tener al menos 1 aprobación antes de merge"
    applies_to: "AGENT-012"
    priority: "ALTA"
    action: "reject"
    condition: "Si PR no tiene approvals"
    
  RULE-QUAL-004:
    name: "No merge con tests fallidos"
    description: "Ningún PR puede merge si hay tests fallidos"
    applies_to: "AGENT-012, AGENT-013"
    priority: "CRÍTICA"
    action: "reject"
    exception: "Ninguna"
    
  RULE-QUAL-005:
    name: "Documentación actualizada"
    description: "Todo cambio debe incluir actualización de documentación"
    applies_to: "AGENT-012"
    priority: "MEDIA"
    action: "flag"
    condition: "Si PR modifica API o dominio sin actualizar docs"
```

### 3.4. Reglas Éticas

```yaml
# Reglas éticas para análisis y desarrollo
ethics_rules:
  
  RULE-ETH-001:
    name: "Beneficencia primero"
    description: "Toda decisión debe priorizar el beneficio del paciente"
    applies_to: "ALL"
    priority: "CRÍTICA"
    action: "flag"
    condition: "Si decisión puede causar daño al paciente"
    
  RULE-ETH-002:
    name: "Consentimiento informado"
    description: "El paciente debe dar consentimiento para uso de sus datos"
    applies_to: "AGENT-020, AGENT-021"
    priority: "CRÍTICA"
    action: "reject"
    exception: "Emergencias vitales donde consentimiento es imposible"
    
  RULE-ETH-003:
    name: "No sobreprescripción"
    description: "No prescribir medicamentos innecesariamente"
    applies_to: "AGENT-020, AGENT-021, AGENT-022"
    priority: "CRÍTICA"
    action: "flag"
    condition: "Si CDS detecta prescripción excesiva"
    
  RULE-ETH-004:
    name: "Equidad en acceso"
    description: "El sistema debe ser accesible para todos, sin discriminación"
    applies_to: "AGENT-011, AGENT-012"
    priority: "ALTA"
    action: "flag"
    condition: "Si funcionalidad excluye a algún grupo"
    
  RULE-ETH-005:
    name: "Transparencia algorítmica"
    description: "Si se usa IA, el paciente debe saberlo"
    applies_to: "AGENT-012, AGENT-020"
    priority: "ALTA"
    action: "flag"
    condition: "Si se implementa IA diagnóstica"
```

### 3.5. Reglas de Proceso

```yaml
# Reglas de proceso para desarrollo
process_rules:
  
  RULE-PROC-001:
    name: "Definition of Done"
    description: "Ningún feature se marca como listo sin cumplir DoD completo"
    applies_to: "AGENT-012, AGENT-013"
    priority: "ALTA"
    action: "reject"
    checklist:
      - "Tests pasan (100%)"
      - "Cobertura >85%"
      - "Code review aprobado"
      - "Documentación actualizada"
      - "Sin bugs S1/S2"
      - "Specs definidos"
      
  RULE-PROC-002:
    name: "Technical debt budget"
    description: "Máximo 20% del sprint para deuda técnica"
    applies_to: "AGENT-010"
    priority: "MEDIA"
    action: "flag"
    condition: "Si sprint planning asigna >20% a deuda"
    
  RULE-PROC-003:
    name: "Release checklist"
    description: "Ningún release sin checklist completo"
    applies_to: "AGENT-015"
    priority: "CRÍTICA"
    action: "reject"
    checklist:
      - "Tests completos"
      - "Security scan limpio"
      - "Changelog actualizado"
      - "Backup verificado"
      - "Rollback plan documentado"
      
  RULE-PROC-004:
    name: "Incident response"
    description: "Todo incidente S1 debe tener response en <1 hora"
    applies_to: "ALL"
    priority: "CRÍTICA"
    action: "escalate"
    condition: "Si se detecta incidente S1"
```

### 3.6. Reglas de Comunicación

```yaml
# Reglas de comunicación entre agents
communication_rules:
  
  RULE-COM-001:
    name: "Formato estándar de mensajes"
    description: "Todos los mensajes deben seguir formato YAML estándar"
    applies_to: "ALL"
    priority: "ALTA"
    action: "reject"
    format:
      from: "[agent_id]"
      to: "[agent_id o ALL]"
      type: "[request/response/notification]"
      priority: "[low/medium/high/critical]"
      content: "[mensaje]"
      timestamp: "[ISO 8601]"
      
  RULE-COM-002:
    name: "Escalamiento obligatorio"
    description: "Si un agent no puede resolver, debe escalar al coordinador"
    applies_to: "ALL"
    priority: "ALTA"
    action: "escalate"
    condition: "Si agent no tiene permisos o capacidad"
    
  RULE-COM-003:
    name: "Confirmación de recepción"
    description: "Todo mensaje crítico debe ser confirmado"
    applies_to: "ALL"
    priority: "MEDIA"
    action: "flag"
    condition: "Si mensaje crítico no recibe ACK en 5 min"
    
  RULE-COM-004:
    name: "Log de comunicación"
    description: "Toda comunicación entre agents debe ser registrada"
    applies_to: "ALL"
    priority: "MEDIA"
    action: "log"
    exception: "Comunicación rutinaria de bajo nivel"
```

---

## 4. Personalización de Agents.md

### 4.1. Template: Configuración de Agent

```yaml
# AGENT-[ID] Configuration
agent_id: "AGENT-[XXX]"

# ─── PERSONALIDAD ───
personality:
  style: "[formal/informal/técnico/clínico]"
  verbosity: "[minimal/moderate/detailed]"
  tone: "[neutral/empático/asertivo]"
  language: "[español/inglés/bilingüe]"
  
# ─── CONOCIMIENTO ───
knowledge:
  domains:
    - domain: "[dominio 1]"
      expertise: "[básico/intermedio/experto]"
      sources: "[fuentes confiables]"
    - domain: "[dominio 2]"
      expertise: "[básico/intermedio/experto]"
      sources: "[fuentes confiables]"
  
  constraints:
    - "[No especular sin evidencia]"
    - "[Citar fuentes]"
    - "[Priorizar fuentes mexicanas]"
    
# ─── COMPORTAMIENTO ───
behavior:
  on_uncertainty: "[ask/escalate/guess-with-disclaimer]"
  on_conflict: "[escalate/choose-safest/document]"
  on_error: "[retry/escalate/fail-gracefully]"
  on_timeout: "[retry-once/escalate/return-partial]"
  
# ─── OUTPUT ───
output:
  format: "[markdown/json/yaml]"
  structure: "[tesis-antitesis-sintesis/recommendation/report]"
  max_length: "[ words/líneas]"
  must_include:
    - "[Evidencia]"
    - "[Fuentes]"
    - "[Recomendaciones]"
  must_not_include:
    - "[Datos identificables]"
    - "[Especulación sin base]"
    
# ─── COLABORACIÓN ───
collaboration:
  can_ask: "[agent_ids o ALL]"
  can_inform: "[agent_ids o ALL]"
  must_notify: "[agent_ids en caso de...]"
  depends_on: "[agent_ids]"
  provides_to: "[agent_ids]"
```

### 4.2. Template: Optimización de Agent

```yaml
# Optimización de AGENT-[ID]
agent_id: "AGENT-[XXX]"
optimization_date: "[Fecha]"

# ─── MÉTRICAS ACTUALES ───
current_metrics:
  accuracy: "[porcentaje]"
  response_time: "[segundos]"
  consistency: "[porcentaje]"
  user_satisfaction: "[1-10]"
  error_rate: "[porcentaje]"
  
# ─── ANÁLISIS DE DEBILIDADES ───
weaknesses:
  - weakness: "[debilidad 1]"
    impact: "[alto/medio/bajo]"
    root_cause: "[causa raíz]"
  - weakness: "[debilidad 2]"
    impact: "[alto/medio/bajo]"
    root_cause: "[causa raíz]"
    
# ─── PLAN DE OPTIMIZACIÓN ───
optimization_plan:
  - action: "[acción 1]"
    expected_improvement: "[mejora esperada]"
    effort: "[bajo/medio/alto]"
    timeline: "[cuándo]"
  - action: "[acción 2]"
    expected_improvement: "[mejora esperada]"
    effort: "[bajo/medio/alto]"
    timeline: "[cuándo]"
    
# ─── BENCHMARK ───
benchmark:
  against: "[agent similar o estándar]"
  metrics_comparison:
    - metric: "[métrica]"
      current: "[valor actual]"
      target: "[valor objetivo]"
      gap: "[diferencia]"
```

---

## 5. Template: Propuesta de Mejora

```yaml
# IMPROVEMENT-[ID]: [Título de la mejora]
improvement_id: "IMP-[XXX]"
version: "1.0"
created: "[Fecha]"
author: "[Quién propone]"

# Metadata
title: "[Título descriptivo]"
description: "[Descripción de la mejora]"
category: "[Funcional/Técnica/Proceso/Seguridad/UX]"
priority: "[Crítica/Alta/Media/Baja]"
status: "[Propuesta/En revisión/Aprobada/Implementada/Rechazada]"

# Problema actual
current_state:
  problem: "[Qué problema resuelve]"
  impact: "[Impacto del problema]"
  affected_users: "[Quiénes se afectan]"
  frequency: "[Qué tan frecuente]"

# Propuesta
proposal:
  solution: "[Solución propuesta]"
  benefits: "[Beneficios esperados]"
  alternatives: "[Otras alternativas consideradas]"
  chosen_alternative: "[Por qué esta alternativa]"

# Implementación
implementation:
  effort: "[Estimación de esfuerzo]"
  timeline: "[Cronograma]"
  resources: "[Recursos necesarios]"
  dependencies: "[Dependencias]"
  risks: "[Riesgos identificados]"
  
# Métricas de éxito
success_metrics:
  - metric: "[Métrica 1]"
    current: "[Valor actual]"
    target: "[Valor objetivo]"
    measurement: "[Cómo medir]"
  - metric: "[Métrica 2]"
    current: "[Valor actual]"
    target: "[Valor objetivo]"
    measurement: "[Cómo medir]"

# Aprobación
approval:
  required_from: "[Quiénes deben aprobar]"
  decision: "[Pendiente/Aprobada/Rechazada]"
  decision_date: "[Fecha]"
  rationale: "[Justificación de la decisión]"

# Seguimiento
tracking:
  assigned_to: "[Quién implementa]"
  start_date: "[Fecha de inicio]"
  end_date: "[Fecha estimada de fin]"
  status_updates:
    - date: "[Fecha]"
      update: "[Actualización]"
```

---

## 6. Workflow: Gobernanza de Agents

```yaml
workflow: "Gobernanza de Agents"
trigger: "Nuevo agent o cambio de configuración"

steps:
  - step: 1
    action: "Evaluar necesidad del agent"
    agent: "AGENT-000"
    template: "Agent Definition Template"
    
  - step: 2
    action: "Definir reglas aplicables"
    agent: "AGENT-000"
    template: "Rules Template"
    
  - step: 3
    action: "Configurar personalización"
    agent: "AGENT-000"
    template: "Agent Configuration Template"
    
  - step: 4
    action: "Validar con stakeholder"
    agent: "Relevante"
    template: "Approval Template"
    
  - step: 5
    action: "Registrar en catálogo"
    agent: "AGENT-000"
    template: "Agent Registry"
    
  - step: 6
    action: "Monitorear desempeño"
    agent: "AGENT-000"
    template: "Optimization Template"
    
  - step: 7
    action: "Optimizar según métricas"
    agent: "AGENT-000"
    template: "Optimization Template"
```

---

## 7. Métricas de Gobernanza

```yaml
governance_metrics:
  agents:
    total_active: 20
    avg_accuracy: "88%"
    avg_response_time: "45s"
    escalation_rate: "12%"
    error_rate: "2%"
    
  rules:
    total_rules: 25
    critical_rules: 8
    violations_this_month: 3
    compliance_rate: "97%"
    
  improvements:
    proposed: 15
    approved: 10
    implemented: 7
    success_rate: "85%"
    
  communication:
    avg_messages_per_day: 45
    avg_response_time: "30s"
    escalation_rate: "8%"
    satisfaction: "8.5/10"
```

---

*Gobernanza de Agents: Reglas claras, agents efectivos, resultados medibles.*
