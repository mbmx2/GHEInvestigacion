# language: es
# Deuda Técnica - Identificación y Clasificación
@status:proposed
# @evidence:code
@type:acceptance
@domain:general
# DETECCIÓN: Encontrar y clasificar deuda técnica antes de que crezca
Característica: Identificación y Clasificación de Deuda Técnica (GHE)
  Como tech lead del proyecto GHE
  Quiero identificar y clasificar deuda técnica sistemáticamente
  Para poder gestionarla antes de que afecte calidad y velocidad

  # ─────────────────────────────────────────────────────────────
  # 1. TIPOS DE DEUDA TÉCNICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de deuda técnica
    Dado que se clasifica deuda técnica
    Cuando se identifica
    Entonces se categoriza:
      | Tipo                        | Descripción          | Ejemplo GHE         |
      | Deliberada (Strategy)      | Decisión consciente por velocidad | "Implementamos rápido, refactor después" |
      | Inadvertida (Knowling)     | Falta de conocimiento | "No sabíamos que SQLite tenía límite X" |
      | Bitácora (Drift)           | Diseño que se degrada con el tiempo | "Código que antes era limpio ahora no" |
      | Debt vs. Legacy            | Deuda que se hereda | "Código de versión anterior que funciona" |

  Escenario: Formas de deuda técnica
    Dado que se identifican formas de deuda
    Cuando se escanea código
    Entonces se detecta:
      | Forma                       | Cómo detectarla      |
      | Code smells                 | Linting, análisis estático |
      | Tests faltantes             | Cobertura <85%       |
      | Documentación faltante      | Sin docstrings       |
      | Dependencias desactualizadas| lein ancient         |
      | Configuración hardcodeada   | Grep de valores fijos|
      | Funciones muy largas        | >50 líneas           |
      | Clases con muchas responsabilidades | >7 métodos  |
      | Duplicación de código       | >3% duplicación      |
      | Complejidad ciclomática alta| >10 por función      |

  # ─────────────────────────────────────────────────────────────
  # 2. DÉTECCIÓN AUTOMÁTICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección con herramientas
    Dado que se ejecutan herramientas de detección
    Cuando se escanea proyecto
    Entonces:
      | Herramienta                | Qué detecta          | Frecuencia |
      | clj-kondo (linting)        | Code smells, bugs    | Cada commit |
      | lein ancient               | Dependencias viejas  | Semanal    |
      | cloverage                  | Cobertura de tests   | CI/CD      |
      | SonarQube                  | Deuda técnica global | Mensual    |
      | Manual code review         | Diseño, arquitectura | Continua   |

  Escenario: Detección con code review
    Dado que se revisa código en PR
    Cuando se detecta deuda
    Entonces se registra:
      | Campo                      |
      | Archivo affected           |
      | Líneas afectadas           |
      | Tipo de deuda              |
      | Severidad                  |
      | Justificación (si deliberada) |
      | Fecha de identificación    |

  # ─────────────────────────────────────────────────────────────
  # 3. SEVERIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación por severidad
    Dado que se clasifica deuda por severidad
    Cuando se evalúa impacto
    Entonces:
      | Severidad                  | Criterio             |
      | Crítica                    | Afecta seguridad, datos, o funcionalidad core |
      | Alta                       | Afecta rendimiento, mantenibilidad significativa |
      | Media                      | Incomodidad, trabajo adicional futuro |
      | Baja                       | Estética, preferencia de estilo |

  Escenario: Ejemplos por severidad
    Dado que se listan ejemplos de cada severidad
    Cuando se clasifica
    Entonces:
      | Severidad                  | Ejemplo en GHE       |
      | Crítica                    | Sin backup de datos   |
      | Alta                       | Sin tests en módulo farmacia |
      | Media                      | Funciones >50 líneas  |
      | Baja                       | Nombres inconsistentes|

  # ─────────────────────────────────────────────────────────────
  # 4. DEUDA EN SOFTWARE MÉDICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Deuda técnica crítica en contexto médico
    Dado que se identifica deuda en contexto médico
    Cuando se evalúa riesgo
    Entonces:
      | Deuda                       | Riesgo clínico       | Prioridad |
      | Sin validación de dosis     | Sobredosis           | Crítica   |
      | Sin alerta de alergias      | Reacción alérgica    | Crítica   |
      | Sin audit log               | Sin trazabilidad     | Crítica   |
      | Sin backup                  | Pérdida de expediente| Alta      |
      | Sin cifrado                 | Fuga de datos        | Alta      |
  