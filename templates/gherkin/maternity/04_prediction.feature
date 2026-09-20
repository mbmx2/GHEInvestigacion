# language: es
# @id GHE-MAT-PRED-001
# @type clinical
# @domain maternity
# @layer clinical
# @risk s1
# @owner medical-director
# @status proposed
@domain:maternity @type:clinical @risk:s1 @status:proposed
Característica: Predicción de Complicaciones Obstétricas
  Como médico del proyecto GHE
  Quiero modelos predictivos de complicaciones
  Para intervenir preventivamente y salvar vidas

  Contexto:
    Dado que el sistema tiene modelos predictivos activos

  Escenario Outline: Riesgo de preeclampsia
    Dado que paciente tiene <factores>
    Cuando se calcula score de preeclampsia
    Entonces riesgo = "<riesgo>" y acción = "<acción>"

    Ejemplos:
      | factores                                    | riesgo | acción                          |
      | IMC 22, primigesta, PA normal               | Bajo   | Monitoreo rutinario             |
      | IMC 33, primigesta, PA 128/82               | Alto   | ASA 100mg + control semanal     |
      | IMC 35, historia familiar, PA 135/88         | Muy alto | Hospitalización parcial   |
      | IMC 28, multiparidad, PA 118/72              | Bajo   | Monitoreo rutinario             |

  Escenario Outline: Riesgo de parto prematuro
    Dado que paciente tiene <factores>
    Cuando se calcula score
    Entonces riesgo = "<riesgo>" y acción = "<acción>"

    Ejemplos:
      | factores                                    | riesgo | acción                          |
      | Sin historia previa, FFn negativa           | Bajo   | Control normal                  |
      | 1 episodio de parto prematuro, cervix 30mm  | Moderado | Control quincenal          |
      | 2 episodios, cervix 25mm, FFn positiva     | Alto   | Corticoides + considerar hospitalización |

  Escenario Outline: Riesgo de diabetes gestacional
    Dado que paciente tiene <factores>
    Cuando se calcula score
    Entonces riesgo = "<riesgo>" y acción = "<acción>"

    Ejemplos:
      | factores                                    | riesgo | acción                          |
      | IMC 22, sin historia familiar DM           | Bajo   | Curva tolerancia rutinaria 24 sem |
      | IMC 31, madre con DM                         | Alto   | Curva tolerancia temprana 16 sem  |
      | IMC 35, DM gestacional previo               | Muy alto | Curva tolerancia inmediata  |

  Escenario Outline: Riesgo de IUGR
    Dado que AU = <au> cm en semana <semana>
    Entonces clasificación = "<clasificación>"

    Ejemplos:
      | au  | semana | clasificación               |
      | 28  | 28     | Normal (AU=semana)          |
      | 24  | 28     | Posible IUGR (<10% esperada)|
      | 20  | 28     | IUGR probable (<20% esperada)|
      | 32  | 28     | Crecimiento acelerado       |
