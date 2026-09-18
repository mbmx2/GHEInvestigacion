# language: es
# Propuesta 2: Formulario Digital de Primera Visita
Característica: Formulario Digital Pre-Consulta (GHE Maternidad)
  Como paciente embarazada
  Quiero llenar un formulario en mi celular antes de llegar
  Para que mi médico tenga mi información desde el inicio

  # ─────────────────────────────────────────────────────────────
  # 1. FORMULARIO DIGITAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Paciente recibe enlace por WhatsApp
    Dado que la paciente agenda su primera consulta
    Cuando se envía enlace
    Entonces recibe:
      | Mensaje                      |
      | "Hola [nombre], para agilizar su consulta, llene este formulario antes de llegar: [enlace]"

  Escenario: Formulario contiene datos esenciales
    Dado que la paciente abre el formulario
    Cuando lo llena
    Entonces captura:
      | Sección                     | Campos                |
      | Datos personales            | Nombre, CURP, fecha nac, teléfono |
      | Embarazo                    | FUR, gestas, partos, cesáreas, abortos |
      | Antecedentes patológicos    | Enfermedades crónicas, cirugías |
      | Medicamentos actuales       | Lista de medicamentos |
      | Alergias                    | Alergias a medicamentos/alimentos |
      | Historia familiar           | DM, HTA, enfermedades hereditarias |
      | Hábitos                     | Tabaco, alcohol, alimentación |
      | Motivo de consulta          | Texto libre |

  Escenario: Formulario se valida en tiempo real
    Dado que la paciente llena el formulario
    Cuando ingresa CURP
    Entonces el sistema valida formato
    Y si es inválido muestra error: "CURP debe tener 18 caracteres en mayúsculas"

  Escenario: Formulario llega al médico
    Dado que la paciente completó el formulario
    Cuando el médico abre el expediente
    Entonces ve:
      | Sección                     | Presentación         |
      | Datos pre-cargados          | Formulario digital   |
      | Resumen de antecedentes     | Resaltados           |
      | Alertas de alergias         | En rojo              |
      | Medicamentos actuales       | Lista con dosis      |

  # ─────────────────────────────────────────────────────────────
  # 2. VALIDACIÓN AUTOMÁTICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Validación automática de FUR
    Dado que la paciente ingresa FUR "01/06/2024"
    Cuando el sistema calcula
    Entonces:
      | Campo calculado             | Resultado            |
      | Fecha probable de parto     | 08/03/2025           |
      | Edad gestacional actual     | 14 semanas           |
      | Trimestre                   | 2do                  |

  Escenario: Detección de factores de riesgo
    Dado que la paciente reporta: HTA + obesidad + primigesta
    Cuando el sistema evalúa
    Entonces clasifica como "Alto riesgo" y notifica al médico

  # ─────────────────────────────────────────────────────────────
  # 3. MÉTRICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas del formulario digital
    Dado que se mide efectividad
    Cuando se compara con formulario en papel
    Entonces:
      | Métrica                    | Papel     | Digital   |
      | Tiempo de llenado          | 15 min    | 8 min     |
      | Completitud de datos       | 60%       | 90%       |
      | Errores de transcripción   | 15%       | 2%        |
      | Tiempo de preparación médico| 10 min   | 2 min     |
