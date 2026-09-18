# language: es
# Propuesta 5: Kit de Diagnóstico Rápido Integrado
Característica: Dispositivos Point-of-Care Integrados (GHE Maternidad)
  Como médico de la maternidad
  Quiero que los dispositivos diagnósticos se conecten automáticamente con GHE
  Para leer datos sin transcripción manual

  # ─────────────────────────────────────────────────────────────
  # 1. GLUCÓMETRO BLUETOOTH
  # ─────────────────────────────────────────────────────────────

  Escenario: Lectura automática de glucómetro
    Dado que la paciente se realiza glucosa capilar
    Cuando el glucómetro envía resultado por Bluetooth
    Entonces el sistema:
      | Acción                      |
      | Recibe valor automáticamente|
      | Registra en expediente      |
      | Valida contra rango         |
      | Alerta si >140 postprandial |

  # ─────────────────────────────────────────────────────────────
  # 2. OXÍMETRO BLUETOOTH
  # ─────────────────────────────────────────────────────────────

  Escenario: Lectura automática de oxímetro
    Dado que se mide SpO2 de la paciente
    Cuando el oxímetro envía resultado
    Entonces el sistema:
      | Acción                      |
      | Recibe SpO2 y FC            |
      | Registra en expediente      |
      | Valida SpO2 >95%           |
      | Alerta si <95%             |

  # ─────────────────────────────────────────────────────────────
  # 3. TENSIÓMETRO DIGITAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Lectura automática de PA
    Dado que se mide PA de la paciente
    Cuando el tensiómetro envía resultado
    Entonces el sistema:
      | Acción                      |
      | Recibe PA sistólica/diastólica |
      | Registra en expediente      |
      | Valida contra rango por trimestre |
      | Alerta si >140/90          |

  # ─────────────────────────────────────────────────────────────
  # 4. TIRAS REACTIVAS (FUTURO)
  # ─────────────────────────────────────────────────────────────

  Escenario: Lectura de tira reactiva por foto
    Dado que se realiza蛋白uria con tira reactiva
    Cuando se toma foto con celular
    Entonces el sistema (futuro):
      | Acción                      |
      | Analiza foto con IA         |
      | Lee resultado de proteinuria|
      | Registra en expediente      |
      | Clasifica: Negativa/+ /++ /+++ |

  # ─────────────────────────────────────────────────────────────
  # 5. MÉTRICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de integración
    Dado que se mide efectividad
    Cuando se compara con lectura manual
    Entonces:
      | Métrica                    | Manual    | Integrado |
      | Tiempo de lectura          | 2 min     | 5 seg     |
      | Errores de transcripción   | 10%       | 0%        |
      | Datos faltantes            | 15%       | 0%        |
      | Satisfacción médica        | 7/10      | 9/10      |
