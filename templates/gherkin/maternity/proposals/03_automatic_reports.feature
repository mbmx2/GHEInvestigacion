# language: es
# Propuesta 3: Reportes Automáticos COFEPRIS
@status:proposed
@type:acceptance
@domain:maternity
Característica: Generación Automática de Reportes (GHE Maternidad)
  Como administrador de la maternidad
  Quiero que los reportes se generen automáticamente
  Para ahorrar tiempo y cumplir con COFEPRIS

  # ─────────────────────────────────────────────────────────────
  # 1. HOJA DIARIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Generación automática de hoja diaria
    Dado que es final del día
    Cuando el sistema genera hoja diaria
    Entonces incluye:
      | Campo                      | Contenido           |
      | Fecha                      | Automática          |
      | Total de consultas         | Conteo automático   |
      | Consultas prenatales       | Filtrado por tipo   |
      | Emergencias obstétricas    | Filtrado por tipo   |
      | Partos del día             | Conteo              |
      | Cesáreas del día           | Conteo              |
      | Signos vitales promedio    | Calculado           |

  Escenario: Exportación de hoja diaria
    Dado que se genera hoja diaria
    Cuando se solicita exportación
    Entonces:
      | Formato                     | Disponible          |
      | PDF                         | ✅                   |
      | Excel                       | ✅                   |
      | JSON                        | ✅                   |

  # ─────────────────────────────────────────────────────────────
  # 2. SUIVE
  # ─────────────────────────────────────────────────────────────

  Escenario: Generación de reporte SUIVE trimestral
    Dado que es fin de trimestre
    Cuando se genera reporte SUIVE
    Entonces incluye:
      | Campo                      | Contenido           |
      | Período                    | Trimestre           |
      | IRA en menores de 5        | Conteo por CIE-10  |
      | IGIs                       | Conteo por CIE-10  |
      | Enfermedades respiratorias | Conteo por CIE-10  |
      | Mortalidad materna         | Conteo              |
      | Partos atendidos           | Conteo              |

  # ─────────────────────────────────────────────────────────────
  # 3. INDICADORES OBSTÉTRICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Dashboard de indicadores mensual
    Dado que se genera dashboard mensual
    Cuando se consulta
    Entonces incluye:
      | Indicador                    | Fórmula             |
      | % control prenatal adecuado | (Controles / Embarazadas) × 100 |
      | % anemia detectada          | (Anemia / Total) × 100 |
      | % hipertensión gestacional  | (HTA / Total) × 100 |
      | % diabetes gestacional      | (DMG / Total) × 100 |
      | Tasa de cesáreas            | (Cesáreas / Partos) × 100 |
      | Tasa de parto prematuro     | (Prematuros / Partos) × 100 |
      | Mortalidad materna          | (Muertes maternas / Partos) × 100,000 |

  # ─────────────────────────────────────────────────────────────
  # 4. EXPORTACIÓN PARA INVESTIGACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Exportación anonimizada
    Dado que se solicita exportación para investigación
    Cuando se procesa
    Entonces:
      | Verificación               | Estado    |
      | Sin datos identificables   | ✅         |
      | CURP ofuscada              | ✅         |
      | Solo datos relevantes      | ✅         |
      | Consentimiento verificado  | ✅         |
