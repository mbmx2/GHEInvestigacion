# language: es
# Propuesta 7: Red de Maternidades GHE
@status:proposed
@type:acceptance
@domain:maternity
Característica: Red Conectada de Maternidades (GHE Maternidad)
  Como director de salud regional
  Quiero que múltiples maternidades usen GHE conectadas
  Para tener visibilidad consolidada y referencias eficientes

  # ─────────────────────────────────────────────────────────────
  # 1. MULTI-TENANT
  # ─────────────────────────────────────────────────────────────

  Escenario: Múltiples maternidades en una instancia
    Dado que hay 5 maternidades usando GHE
    Cuando se configura multi-tenant
    Entonces:
      | Maternidad                  | BD separada         |
      | Altotonga                   | ghe_altotonga.db    |
      | Tezonapa                    | ghe_tezonapa.db     |
      | Huatusco                    | ghe_huatusco.db     |
      | Coacoatzintla               | ghe_coacoatzintla.db|
      | Alto Lucero                 | ghe_alto_lucero.db  |

  # ─────────────────────────────────────────────────────────────
  # 2. SYNC CENTRAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Sincronización con servidor central
    Dado que cada maternidad tiene su BD local
    Cuando hay internet
    Entonces sincronizan con cloud:
      | Dato                        | Frecuencia          |
      | Datos agregados             | Diaria              |
      | Reportes                    | Trimestral          |
      | Indicadores                 | Mensual             |
      | Datos individuales          | Solo con consentimiento |

  # ─────────────────────────────────────────────────────────────
  # 3. DASHBOARD NACIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Dashboard consolidado regional
    Dado que el director consulta dashboard regional
    Cuando se genera
    Entonces incluye:
      | Maternidad | Embarazadas | Controles | Partos | Complicaciones |
      | Altotonga  | 120         | 95        | 12     | 3              |
      | Tezonapa   | 80          | 70        | 8      | 2              |
      | Huatusco   | 150         | 130       | 18     | 4              |
      | **Total**  | **350**     | **295**   | **38** | **9**          |

  # ─────────────────────────────────────────────────────────────
  # 4. REFERENCIA DIGITAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Referencia entre maternidades
    Dado que una paciente requiere especialista
    Cuando se genera referencia
    Entonces el sistema:
      | Paso                       |
      | 1. Selecciona maternidad destino |
      | 2. Genera resumen clínico  |
      | 3. Envía digitalmente      |
      | 4. Maternidad destino recibe|
      | 5. Agenda cita             |

  # ─────────────────────────────────────────────────────────────
  # 5. BENCHMARKING
  # ─────────────────────────────────────────────────────────────

  Escenario: Comparación de indicadores
    Dado que se comparan indicadores entre maternidades
    Cuando se genera reporte
    Entonces:
      | Indicador | Altotonga | Tezonapa | Huatusco | Promedio regional |
      | % control prenatal | 78% | 85% | 72% | 78% |
      | % anemia | 35% | 28% | 42% | 35% |
      | % HTA gestacional | 12% | 8% | 15% | 12% |
      | Tasa cesáreas | 25% | 20% | 22% | 22% |
