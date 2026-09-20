# language: es
# @id GHE-MAT-VALID-001
# @type clinical
# @domain maternity
# @layer clinical
# @risk s1
# @owner medical-director
# @status proposed
@domain:maternity @type:clinical @risk:s1 @status:proposed
Característica: Validación Automática para Embarazo
  Como médico de GHE
  Quiero validación automática de cada dato
  Para prevenir errores que pongan en riesgo madre y bebé

  Contexto:
    Dado que el sistema está activo
    Y que se registran datos en paciente embarazada

  Escenario Outline: Validar valor de laboratorio por trimestre
    Dado que se registra <parámetro> = <valor> en trimestre <trimestre>
    Entonces resultado = "<resultado>" y nivel = "<nivel>"

    Ejemplos:
      | parámetro  | valor | trimestre | resultado        | nivel       |
      | Hb         | 12.5  | 1         | ✅ Normal        | Info        |
      | Hb         | 10.2  | 2         | ⚠️ Anemia leve   | Advertencia |
      | Hb         | 8.5   | 3         | ⚠️ Anemia moderada| Advertencia |
      | Hb         | 6.8   | 2         | ❌ Anemia severa  | Bloqueo     |
      | Glucosa    | 85    | 1         | ✅ Normal        | Info        |
      | Glucosa    | 105   | 1         | ⚠️ Elevada       | Advertencia |
      | Glucosa    | 145   | 1         | ⚠️ Positiva curva | Advertencia |
      | Glucosa    | 200   | 1         | ❌ Diabetes      | Bloqueo     |
      | TSH        | 1.5   | 1         | ✅ Normal        | Info        |
      | TSH        | 3.2   | 1         | ⚠️ Alto 1T       | Advertencia |
      | TSH        | 5.5   | 1         | ❌ Crítico       | Bloqueo     |
      | Creatinina | 0.5   | 2         | ✅ Normal        | Info        |
      | Creatinina | 0.8   | 2         | ⚠️ Elevada       | Advertencia |
      | Creatinina | 1.2   | 2         | ❌ Anormal       | Bloqueo     |

  Escenario Outline: Validar PA por sem gestacional
    Dado que PA = <pa> en semana <semana>
    Entonces clasificación = "<clasificación>"

    Ejemplos:
      | pa      | semana | clasificación           |
      | 118/72  | 20     | Normal                  |
      | 130/85  | 24     | Límite alto             |
      | 140/90  | 28     | HTA gestacional         |
      | 145/92  | 30     | HTA gestacional        |
      | 160/100 | 32     | HTA severa             |
      | 170/110 | 25     | Emergencia            |

  Escenario Outline: Bloquear medicamento contraindicado
    Dado que médico prescribe <medicamento> en trimestre <trimestre>
    Entonces sistema bloquea = "<bloqueo>"

    Ejemplos:
      | medicamento   | trimestre | bloqueo |
      | Ibuprofeno    | 3         | Sí      |
      | Ibuprofeno    | 1         | No      |
      | Enalapril     | 2         | Sí      |
      | Labetalol     | 1         | No      |
      | Paracetamol    | 3         | No      |
      | Metotrexato   | 2         | Sí      |

  Escenario: Detectar interacción medicamentosa
    Dado que paciente toma <medicamento_actual> y médico prescribe <nuevo_medicamento>
    Entonces alerta = "<alerta>"

    Ejemplos:
      | medicamento_actual | nuevo_medicamento | alerta                    |
      | Warfarina          | Aspirina          | Sangrado severo          |
      | Warfarina          | Paracetamol      | Sin interacción         |
      | Labetalol         | Aspirina         | Sin interacción significativa |
      | Litio             | Ibuprofeno      | Toxicidad renal        |

  Escenario: Detectar tendencia de PA
    Dado que PA ha subido en <número> controles consecutivos
    Entonces alerta = "<alerta>"

    Ejemplos:
      | número | alerta                              |
      | 2      | Monitorear tendencia                 |
      | 3      | Vigilar preeclampsia                 |
      | 4      | Considerar hospitalización           |
