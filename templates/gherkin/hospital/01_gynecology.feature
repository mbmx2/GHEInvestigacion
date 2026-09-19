# language: es
# Ginecología (no obstétrica)
Característica: Consulta Ginecológica (GHE Hospital)
  Como ginecólogo del hospital
  Quiero workflows para patologías ginecológicas
  Para atender a mujeres con patologías no relacionadas con embarazo

  # ─────────────────────────────────────────────────────────────
  # 1. PATOLOGÍAS MENSTRUALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de menorragia
    Dado que la paciente presenta sangrado menstrual abundante
    Cuando se evalúa
    Entonces el sistema guía:
      | Evaluación                 |
      | Historia menstrual detallada |
      | Examen pélvico             |
      | Ecografía transvaginal     |
      | Biometría hemática         |
      | Perfil tiroideo            |
      | Coagulación               |
    Y clasifica:
      | Causa                      | Tratamiento |
      | Miomas                     | ACO, cirugía |
      | Pólipos                    | Polipectomía   |
      | Hipotiroidismo             | Levotiroxina   |
      | Trastorno coagulatorio     | Hematología    |
      | Adenomiosis                | ACO, Mirena    |

  Escenario: Manejo de amenorrea
    Dado que la paciente tiene ausencia de menstruación >3 meses
    Cuando se evalúa
    Entonces el sistema verifica:
      | Verificación               |
      | ¿Embarazo?                |
      | Prolactina                |
      | TSH                       |
      | FSH                       |
      | Progesterona              |
      | Ecografía pélvica         |
    Y clasifica:
      | Tipo                      | Causa probable  |
      | Primaria                  | Genética, anatomica |
      | Secundaria                | Hormonal, estrés, peso |

  Escenario: Manejo de SPM/SPD
    Dado que la paciente tiene síndrome premenstrual severo
    Cuando se evalúa
    Entonces el sistema guía:
      | Tratamiento               |
      | ACO (anticonceptivos orales) |
      | ISRS (fluoxetina 20mg)    |
      | Espironolactona           |
      | Terapia cognitivo-conductual |
      | Suplementos (calcio, magnesio) |

  # ─────────────────────────────────────────────────────────────
  # 2. PATOLOGÍAS DEL TRACTO REPRODUCTOR
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de miomas uterinos
    Dado que se diagnostican miomas
    Cuando se evalúa
    Entonces el sistema registra:
      | Campo                     |
      | Número de miomas          |
      | Tamaño de cada uno        |
      | Localización (FIGO)       |
      | Síntomas                  |
      | Deseo reproductivo        |
    Y clasifica tratamiento:
      | Situación                 | Tratamiento |
      | Sin síntomas              | Observación |
      | Menorragia                | ACO, Mirena, cirugía |
      | Dolor                     | ACO, AINE, cirugía |
      | Infertilidad             | Cirugía conservadora |
      | Embarazo + mioma          | Vigilancia        |

  Escenario: Manejo de endometriosis
    Dado que se diagnostica endometriosis
    Cuando se evalúa
    Entonces el sistema clasifica (rASRM):
      | Estadio   | Tratamiento |
      | I-II (leve) | ACO, AINE |
      | III-IV (moderado-severo) | Laparoscopia + ACO |
      | Dolor crónico | Multidisciplinario |
      | Infertilidad | Fertilización in vitro |

  Escenario: Manejo de SOP (Síndrome de Ovario Poliquístico)
    Dado que se diagnostica SOP
    Cuando se evalúa
    Entonces el sistema verifica criterios de Rotterdam (2 de 3):
      | Criterio                   | Presente? |
      | Oligoanovulación           | Verificar |
      | Hiperandrogenismo clínico/bioquímico | Verificar |
      | Ovarios poliquísticos ecográficos | Verificar |
    Y tratamiento según perfil:
      | Perfil                     | Tratamiento |
      | Deseo reproductivo         | Inducción de ovulación (letrozol) |
      | Sin deseoreproductivo      | ACO (espironolactona + ACO) |
      | Metabólico                 | Metformina + estilo vida |

  # ─────────────────────────────────────────────────────────────
  # 3. INFECCIONES GENITALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de infección vaginal
    Dado que la paciente presenta flujo vaginal anormal
    Cuando se evalúa
    Entonces el sistema guía:
      | Tipo de flujo | Diagnóstico probable | Tratamiento |
      | Blanquecino, espeso, prurito | Candidiasis | Fluconazol 150mg dosis única |
      | Gris, odor fétido | Vaginosis bacteriana | Metronidazol 500mg cada 12h x 7 días |
      | Amarillo-verdoso, espumoso | Tricomoniasis | Metronidazol 2g dosis única |
      | Acuoso, amarillo | ETS (clamidia/gonorrea) | Azitromicina 1g dosis única |

  # ─────────────────────────────────────────────────────────────
  # 4. DOLOR PÉLVICO CRÓNICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de dolor pélvico crónico
    Dado que la paciente presenta dolor pélvico >6 meses
    Cuando se evalúa
    Entonces el sistema guía:
      | Evaluación                 |
      | Historia detallada         |
      | Examen pélvico            |
      | Ecografía transvaginal    |
      | Laparoscopia diagnóstica  |
      | Evaluación multidisciplinaria |
    Y causas diferenciales:
      | Causa                      | Diagnóstico |
      | Endometriosis             | Laparoscopia |
      | Adenomiosis               | Ecografía/MRI |
      | Adherencias             | Laparoscopia |
      | Vulvodinia               | Examen especial |
      | Cistitis intersticial    | Cistoscopia   |

  # ─────────────────────────────────────────────────────────────
  # 5. CANCER GINECOLÓGICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Tamizaje de cáncer cervicouterino
    Dado que se realiza tamizaje
    Cuando se evalúa
    Entonces:
      | Edad    | Estudio         | Frecuencia |
      | 21-29   | Papanicolaou    | Cada 3 años |
      | 30-65   | PAP + HPV       | Cada 5 años |
      | 30-65   | Solo PAP        | Cada 3 años |
      | >65     | Si historial normal | Suspender |
      | Histerectomía total benigna | Suspender | — |

  Escenario: Seguimiento de displasia
    Dado que se detecta displasia cervical
    Cuando se clasifica
    Entonces:
      |Resultado | Manejo |
      | ASC-US   | Repetir PAP en 1 año o test HPV |
      | LSIL     | Colposcopía |
      | HSIL     | Conización |
      | Cáncer   | Referencia oncológica |
