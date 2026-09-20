# language: es
# Laboratorio Clínico Completo
@status:proposed
@type:acceptance
@domain:hospital
Característica: Gestión de Laboratorio (GHE Hospital)
  Como director de laboratorio del hospital
  Quiero workflows completos de laboratorio
  Para generar resultados precisos y oportunos

  # ─────────────────────────────────────────────────────────────
  # 1. SOLICITUD Y PROCESAMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Flujo completo de solicitud a resultado
    Dado que el médico solicita estudio
    Cuando se ejecuta el flujo
    Entonces:
      | Paso                       | Tiempo objetivo |
      | Solicitud generada        | Instantáneo      |
      | Toma de muestra           | <30 min          |
      | Transporte a laboratorio  | <30 min          |
      | Procesamiento             | Según estudio    |
      | Resultado disponible      | Según urgencia   |
      | Notificación al médico   | Automática       |

  # ─────────────────────────────────────────────────────────────
  # 2. TIPOS DE ESTUDIOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Catálogo de estudios disponibles
    Dado que se lista estudios disponibles
    Cuando se consulta
    Entonces:
      | Categoría                  | Estudios |
      | Biometría hemática         | BHC completa,VS,EOS |
      | Química sanguínea          | Glucosa, creatinina, perfil hepático |
      | Coagulación                | TP, TTP, INR, fibrinógeno |
      | Orina                     | Uroanálisis, urocultivo |
      | Microbiología             | Cultivos, antibiograma |
      | Hormonas                  | TSH, T4L, insulinemia |
      | Tumores                    | AFP, CEA, CA-125 |
      | Perfil lipídico           | CT, LDL, HDL, TG |

  # ─────────────────────────────────────────────────────────────
  # 3. VALORES CRÍTICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Notificación de valor crítico
    Dado que se detecta valor crítico
    Cuando se notifica
    Entonces:
      | Parámetro                  | Crítico si |
      | Glucosa                    | <50 o >500  |
      | Potasio                    | <2.5 o >6.0 |
      | Sodio                      | <120 o >160  |
      | Hemoglobina               | <5           |
      | Plaquetas                 | <50,000      |
      | INR                        | >5.0         |
      | pH                         | <7.20 o >7.60|
    Y notificación inmediata al médico

  # ─────────────────────────────────────────────────────────────
  # 4. CONTROL DE CALIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Control de calidad interno
    Dado que se ejecuta control de calidad
    Cuando se evalúa
    Entonces:
      | Control                   | Frecuencia |
      | Control bajo             | Diario     |
      | Control medio            | Diario     |
      | Control alto             | Diario     |
    Y se verifica:
      | Criterio                   |
      | Resultado dentro de 2 DS de la media |
      | Westgard rules cumplidas  |
      | Trend estable             |

  # ─────────────────────────────────────────────────────────────
  # 5. TURNO DE LABORATORIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Handoff de laboratorio
    Dado que se entrega turno de laboratorio
    Cuando se documenta
    Entonces incluye:
      | Sección                   |
      | Estudios pendientes      |
      | Muestras en procesamiento |
      | Resultados críticos notificados |
      | Controles de calidad fuera de rango |
      | Equipos con fallas       |
      | Insumos por agotarse     |
