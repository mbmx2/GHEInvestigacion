# language: es
# Lactancia Materna
Característica: Apoyo a Lactancia (GHE Maternidad)
  Como enfermera de lactancia
  Quiero herramientas para apoyar la lactancia materna
  Para que todas las madres puedan amamantar exitosamente

  # ─────────────────────────────────────────────────────────────
  # 1. REGISTRO DE LACTANCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Registro de inicio de lactancia
    Dado que la madre inicia lactancia
    Cuando se registra
    Entonces el sistema captura:
      | Campo                      | Valor              |
      | Fecha de inicio            | Automática         |
      | Tipo de lactancia          | Exclusiva/Parcial/Artificial |
      | Hora de nacimiento         | Del expediente     |
      | Primer amamantamiento     | Dentro de 1 hora   |
      | Lactancia exclusiva       | Sí/No              |

  Escenario: Registro de sesiones de lactancia
    Dado que la madre amamanta
    Cuando registra sesión
    Entonces captura:
      | Campo                      |
      | Hora de inicio            |
      | Duración                  |
      | Pecho utilizado           |
      | Señales de saciedad       |
      | Dificultades              |

  # ─────────────────────────────────────────────────────────────
  # 2. DIFICULTADES COMUNES
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de dificultad de amamantamiento
    Dado que la madre reporta dificultad
    Cuando se evalúa
    Entonces el sistema clasifica:
      | Dificultad                 | Intervention        |
      | Dolor al amamantar        | Técnica de succión  |
      | Grietas en pezón          | Cuidado del pezón   |
      | Ingurgitación             | Drenaje, compresas  |
      | Mastitis                  | Antibiótico, vacío  |
      | Baja producción           | Lactancia frecuente, galactagogos |
      | Retracción de pezones      | Extractor de pezones |

  # ─────────────────────────────────────────────────────────────
  # 3. SEGUIMIENTO DE CRECIMIENTO CON LACTANCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Monitoreo de crecimiento del neonato
    Dado que el bebé está en lactancia materna exclusiva
    Cuando se registra peso
    Entonces el sistema evalúa:
      | Semana | Peso | Percentil | Estado |
      | 0      | 3.2 kg | 50      | Normal |
      | 1      | 3.0 kg | 45      | Normal (pérdida fisiológica) |
      | 2      | 3.3 kg | 50      | Normal (recuperado) |
      | 4      | 4.0 kg | 50      | Normal |
      | 8      | 5.5 kg | 50      | Normal |
    Y alerta si:
      | Criterio                   | Alerta             |
      | Pérdida >10% peso al nacer| ⚠️ Evaluar lactancia |
      | No recupera peso a las 2 sem| ⚠️ Evaluar lactancia |
      | Percentil <10             | ⚠️ Evaluar crecimiento |

  # ─────────────────────────────────────────────────────────────
  # 4. EDUCACIÓN SOBRE LACTANCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Educación postparto inmediato
    Dado que la madre acaba de dar a luz
    Cuando recibe educación
    Entonces incluye:
      | Tema                       |
      | Importancia de primer amamantamiento en 1ra hora |
      | Técnica correcta de succión |
      | Señales de que el bebé está alimentándose |
      | Lactancia a demanda         |
      | No agregar agua o fórmula   |
      | Buscar ayuda si hay dolor  |

  # ─────────────────────────────────────────────────────────────
  # 5. MÉTRICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de lactancia
    Dado que se mide éxito de lactancia
    Cuando se genera reporte
    Entonces:
      | Métrica                    | Target     |
      | Lactancia dentro de 1 hora | >90%       |
      | Lactancia exclusiva 6 meses| >50%       |
      | Mastitis detectada a tiempo| >95%       |
      | Crecimiento adecuado       | >85%       |
