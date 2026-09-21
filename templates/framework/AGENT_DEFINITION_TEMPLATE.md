# Template: Definición de Agent

```yaml
# AGENT-[ID]: [NOMBRE]
agent_id: "AGENT-[XXX]"
version: "1.0"
created: "[Fecha]"
last_reviewed: "[Fecha]"

# Identidad
name: "[Nombre del agent]"
role: "[Rol principal]"
discipline: "[Disciplina especializada]"
description: "[Qué hace este agent en 1 línea]"

# Capacidades
capabilities:
  - "[Capacidad 1]"
  - "[Capacidad 2]"
  - "[Capacidad 3]"

# Herramientas
tools:
  - name: "[Herramienta]"
    purpose: "[Para qué la usa]"
    access_level: "read/write/admin"

# Templates que puede usar
templates:
  - "[template_id_1]"
  - "[template_id_2]"

# Restricciones (qué NO puede hacer)
constraints:
  - "[Restricción 1]"
  - "[Restricción 2]"

# Inputs esperados
inputs:
  - name: "[Input]"
    type: "[string/json/file]"
    required: true/false

# Outputs producidos
outputs:
  - name: "[Output]"
    format: "[markdown/json/yaml]"
    description: "[Qué produce]"

# Protocolo de comunicación
communication:
  inbound: "[Qué puede recibir]"
  outbound: "[Qué puede enviar]"
  escalation: "[Cuándo escalar]"
  format: "[Formato de mensajes]"

# Métricas de desempeño
metrics:
  - name: "[Métrica]"
    target: "[Objetivo]"
    measurement: "[Cómo medir]"

# Dependencias
dependencies:
  - agent: "[Agent dependiente]"
    relationship: "[depends_on/blocks/provides_to]"
    purpose: "[Para qué]"

# Configuración
config:
  temperature: 0.3
  max_tokens: 4096
  timeout_seconds: 300
  retry_attempts: 3
```

---

## Template: Registro de Agentes

```yaml
# Registro de Agents del Proyecto GHE
version: "1.0"
last_updated: "[Fecha]"

agents:
  # GOBERNANZA
  - id: "AGENT-000"
    name: "Coordinator"
    role: "Coordinador General"
    level: 1
    status: "active"

  # ANÁLISIS
  - id: "AGENT-001"
    name: "Legal Analyst"
    role: "Analista Jurídico"
    level: 2
    status: "active"

  # DESARROLLO
  - id: "AGENT-010"
    name: "Requirements Agent"
    role: "Especialista en Requisitos"
    level: 3
    status: "active"

  # CLÍNICO
  - id: "AGENT-020"
    name: "Medical Director Agent"
    role: "Director Médico"
    level: 2
    status: "active"
```
