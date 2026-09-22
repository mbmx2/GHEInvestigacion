# language: es
# @id GHE-ISO13485-003
# @type business-rule
# @domain quality
# @layer governance
# @risk s1
# @owner quality-director
# @status proposed
# @requirement REQ-ISO13485-003
# @risk-control CTRL-ISO13485-003
# @regulation ISO-13485
@domain:quality @type:business-rule @risk:s1 @status:proposed
Característica: Acciones Correctivas y Preventivas (CAPA)
  Como encargado de calidad
  Quiero un proceso CAPA robusto
  Para prevenir recurrencia de no conformidades y mejorar continuamente

  Regla: No conformidad se clasifica y prioriza

    Escenario: Registro de no conformidad
      Dado que se detecta no conformidad
      Cuando se registra
      Entonces se clasifica:
        | Campo           | Opciones                      |
        | Tipo            | Producto/proceso/sistema      |
        | Severidad       | Crítica/mayor/menor           |
        | Fuente          | Auditoría/queja/incidente/interne |
        | Alcance         | Aislado/sistémico             |
      Y se asigna responsable de investigación

    Escenario: CAPA obligatoria para severidad crítica
      Dado que no conformidad es clasificada como crítica
      Cuando se evalúa
      Entonces se activa CAPA inmediata
      Y se notifica a dirección
      # @invariante INV-ISO13485-CAPA-001

  Regla: Causa raíz se investiga sistemáticamente

    Escenario: Análisis de causa raíz
      Dado que CAPA está activa
      Cuando se investiga causa raíz
      Entonces se usa herramienta apropiada:
        | Herramienta         | Cuándo usarla     |
        | Ishikawa            | Múltiples causas  |
        | 5 Porqués           | Causa lineal       |
        | Árbol de fallos     | Sistemas complejos |
        | FMEA                | Riesgos de diseño  |

    Escenario: Acción correctiva definida
      Dado que causa raíz está identificada
      Cuando se define acción correctiva
      Entonces se especifica:
        | Campo              |
        | Acción específica  |
        | Responsable        |
        | Fecha de cierre    |
        | Evidencia requerida|
        | Verificación de efectividad|

  Regla: Efectividad se verifica

    Escenario: Verificación de efectividad
      Dado que acción correctiva fue implementada
      Cuando se verifica efectividad
      Entonces se confirma que:
        | Criterio                       |
        | No conformidad no recurre      |
        | Proceso mejorado               |
        | Documentación actualizada      |
      Y se cierra CAPA con evidencia

    Escenario: CAPA no efectiva
      Dado que verificación muestra recurrencia
      Cuando se evalúa
      Entonces se reabre CAPA
      Y se investiga nueva causa raíz
      Y se escala a dirección

  Regla: Acciones preventivas se planifican

    Escenario: Identificación de tendencia
      Dado que análisis muestra tendencia preocupante
      Cuando se evalúa riesgo potencial
      Entonces se inicia acción preventiva
      Y se documenta justificación

  Regla: CAPA tiene ciclo de vida controlado

    Escenario: Ciclo de vida CAPA
      Dado que CAPA está activa
      Cuando avanza en su ciclo
      Entonces pasa por estados:
        | Estado        |
        | Abierta       |
        | Investigación |
        | Acción        |
        | Verificación  |
        | Cerrada       |
      Y cada transición se registra con timestamp

    Escenario: CAPA excedida en tiempo
      Dado que CAPA supera fecha de cierre
      Cuando se detecta retraso
      Entonces sistema genera alerta al responsable
      Y escala si excede 30 días
