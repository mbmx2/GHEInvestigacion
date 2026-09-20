# language: es
# Propuesta 6: Ecografía con IA
@status:proposed
@type:acceptance
@domain:maternity
Característica: Análisis IA de Ecografía Obstétrica (GHE Maternidad)
  Como médico de la maternidad
  Quiero que el sistema analice automáticamente imágenes de ecografía
  Para medir biometría fetal y detectar anomalías

  # ─────────────────────────────────────────────────────────────
  # 1. CAPTURA DE IMAGEN
  # ─────────────────────────────────────────────────────────────

  Escenario: Captura de imagen desde ecógrafo portátil
    Dado que se realiza ecografía obstétrica
    Cuando se captura imagen
    Entonces el sistema:
      | Acción                      |
      | Recibe imagen por USB/WiFi  |
      | Almacena en expediente      |
      | Asocia a gestacional age    |
      | Inicia análisis IA          |

  # ─────────────────────────────────────────────────────────────
  # 2. ANÁLISIS AUTOMÁTICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Medición automática de biometría
    Dado que se analiza imagen de ecografía
    Cuando el modelo de IA detecta estructuras
    Entonces mide:
      | Parámetro                  | Método IA           |
      | DBP (diámetro biparietal)  | Detección de bordes  |
      | CC (circunferencia cefálica)| Ajuste de elipse    |
      | CA (circunferencia abdominal)| Ajuste de elipse  |
      | LF (longitud femoral)     | Detección de bordes  |

  Escenario: Comparación con curvas de crecimiento
    Dado que se tienen mediciones de biometría
    Cuando se comparan con curvas
    Entonces el sistema muestra:
      | Parámetro | Medición | Percentil | Estado    |
      | DBP       | 60 mm    | 50        | Normal    |
      | CC        | 210 mm   | 50        | Normal    |
      | CA        | 180 mm   | 45        | Normal    |
      | LF        | 45 mm    | 50        | Normal    |
      | Peso estimado | 650g | 50        | Normal    |

  # ─────────────────────────────────────────────────────────────
  # 3. DETECCIÓN DE ANOMALÍAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de anomalía estructural
    Dado que el modelo de IA analiza imagen
    Cuando detecta hallazgo anómalo
    Entonces genera alerta:
      | Hallazgo                    | Alerta               |
      | Anomalia de línea media     | ⚠️ Revisar con especialista |
      | Hidrocefalia                | ❌ Referencia urgente |
      | Polihidramnios              | ⚠️ Evaluar causa     |
      | Oligohidramnios             | ❌ Evaluar función renal |

  # ─────────────────────────────────────────────────────────────
  # 4. REPORTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Generación de reporte de ecografía
    Dado que se completa análisis de ecografía
    Cuando se genera reporte
    Entonces incluye:
      | Sección                   |
      | Datos de la paciente      |
      | Edad gestacional          |
      | Biometría fetal completa  |
      | Percentiles               |
      | Peso fetal estimado       |
      | Líquido amniótico         |
      | Placenta                  |
      | Presentación fetal        |
      | Hallazgos                 |
      | Impresión diagnóstica     |
      | Imagen adjunta            |

  # ─────────────────────────────────────────────────────────────
  # 5. MÉTRICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de precisión de IA
    Dado que se compara IA con medición manual experta
    Cuando se evalúa
    Entonces:
      | Parámetro | Correlación IA-experto |
      | DBP       | >0.95                  |
      | CC        | >0.93                  |
      | CA        | >0.94                  |
      | LF        | >0.92                  |
      | Peso fetal| >0.90                  |
