# language: es
# @id GHE-FW-PARAPHRASE-001
# @type contract
# @domain framework
# @layer process
# @risk s1
# @owner tech-lead
# @status proposed
@domain:framework @type:contract @risk:s1 @status:proposed
Característica: Paráfrasis Obligatoria de Peticiones Informales
  Como coordinator del sistema de agents
  Quiero que todo agente transforme peticiones informales en el template formal del negocio
  Para que cada interacción sea consistente sin depender del formato del usuario

  # ─────────────────────────────────────────────────────────────
  # REGLA FUNDAMENTAL:
  # El agente NUNCA debe procesar una petición informal directamente.
  # SIEMPRE debe generar una paráfrasis al template formal primero.
  # ─────────────────────────────────────────────────────────────

  Contexto:
    Dado que el usuario puede enviar peticiones en cualquier formato
    Y que el template formal del negocio tiene secciones obligatorias

  Escenario: Petición informal a template formal
    Dado que el usuario dice "arregla el bug del login que no funciona"
    Cuando el agente procesa la petición
    Entonces el agente DEBE generar paráfrasis:
      | Sección formal             | Contenido inferido |
      | CONTEXTO                   | Módulo: autenticación |
      | OBJETIVO                   | Resolver: login falla |
      | ALCANCE                    | Bug en componente de login |
      | BASE SWEBOK                | Pruebas, construcción |
      | EVIDENCIA OBLIGATORIA      | Tests que demuestren fix |
    Y el agente NO debe procesar sin generar la paráfrasis
    Y la paráfrasis debe ser visible antes de la implementación

  Escenario: Petición ambigua a template formal
    Dado que el usuario dice "mejora el sistema"
    Cuando el agente procesa la petición
    Entonces el agente DEBE:
      | Paso                       |
      | 1. Identificar qué se quiere mejorar |
      | 2. Generar paráfrasis con supuestos |
      | 3. Presentar paráffasis al usuario para confirmar |
      | 4. Solo proceder después de confirmación |

  Escenario: Petición que contradice el framework
    Dado que el usuario pide algo que contradice las 15 reglas
    Cuando el agente detecta la contradicción
    Entonces el agente DEBE:
      | Paso                       |
      | 1. Señalar la contradicción |
      | 2. Explicar por qué contradice |
      | 3. Proponer alternativa     |
      | 4. Esperar decisión humana |

  Escenario: Petición que omite evidencia
    Dado que el usuario no menciona evidencia
    Cuando el agente genera paráfrasis
    Entonces el agente DEBE:
      | Paso                       |
      | 1. Incluir EVIDENCIA OBLIGATORIA en paráfrasis |
      | 2. Definir qué evidencia se generará |
      | 3. No procesar sin evidencia planificada |
