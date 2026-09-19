# language: es
# Ginecología - Patologías Específicas
Característica: Patologías Ginecológicas Específicas (GHE Hospital)
  Como ginecólogo del hospital
  Quiero workflows completos para cada patología ginecológica
  Para dar atención estandarizada y de calidad

  # ─────────────────────────────────────────────────────────────
  # 1. PROLAPSO DE ÓRGANOS PÉLVICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de prolapso
    Dado que se evalúa prolapso
    Cuando se clasifica (POP-Q)
    Entonces:
      | Grado   | Descripción           | Tratamiento |
      | Grado I | Debajo del himen      | Ejercicio, pesario |
      | Grado II| Hasta el himen        | Pesario, cirugía   |
      | Grado III| Más allá del himen    | Cirugía            |
      | Grado IV| Prolapso total        | Cirugía            |

  # ─────────────────────────────────────────────────────────────
  # 2. INCONTINENCIA URINARIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de incontinencia
    Dado que se evalúa incontinencia
    Cuando se clasifica
    Entonces:
      | Tipo                      | Diagnóstico        | Tratamiento |
      | Esfuerzo                  | Pérdida al toser   | Piso pélvico, TVT |
      | Urge                      | Repentino, imperioso| Anticolinérgicos |
      | Mixta                     | Combinación        | Multimodal      |
      | Incontinencia total       | Pérdida continua   | Cirugía         |

  Escenario: Prueba de cough test
    Dado que se evalúa incontinencia de esfuerzo
    Cuando se realiza prueba
    Entonces:
      | Resultado                  | Interpretación |
      | Pérdida al toser         | Positivo para incontinencia de esfuerzo |
      | Sin pérdida              | Negativo          |

  # ─────────────────────────────────────────────────────────────
  # 3. INFECCIONES DE TRANSMISIÓN SEXUAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de ITS
    Dado que se diagnostica ITS
    Cuando se trata
    Entonces:
      | ITS        | Diagnóstico           | Tratamiento           | Notificación |
      | Clamidia   | NAAT                  | Azitromicina 1g x1   | Sí          |
      | Gonorrea   | Cultivo/NAAT          | Ceftriaxona 250mg IM | Sí          |
      | Sífilis    | VDRL/FTA              | Penicilina benzatina  | Sí          |
      | VIH        | Elisa + Western Blot  | TARGA                 | Sí          |
      | VPH        | Citología/colposcopía | Vigilancia            | No          |
      | Herpes genital | Clínico/cultivo  | Aciclovir             | No          |
      | Tricomoniasis | Microscopía/NAAT   | Metronidazol 2g x1   | No          |

  # ─────────────────────────────────────────────────────────────
  # 4. DISPLASIA CERVICAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de lesiones cervicales
    Dado que se detecta lesión cervical
    Cuando se clasifica
    Entonces:
      | resultado PAP   | Colposcopía | Biopsia | Manejo |
      | ASC-US           | Sí          | Si lesión | Seguimiento |
      | ASC-H            | Sí          | Sí       | Tratamiento |
      | LSIL             | Sí          | Opcional | Seguimiento o tratamiento |
      | HSIL             | Sí          | Sí       | Conización |
      | Cáncer invasivo   | Sí          | Sí       | Referencia oncológica |

  # ─────────────────────────────────────────────────────────────
  # 5. SANGRADO UTERINO ANORMAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de SPUA
    Dado que se evalúa sangrado uterino anormal
    Cuando se clasifica
    Entonces:
      | Causa                      | Estudio           | Tratamiento |
      | Miomas                     | Ecografía         | ACO, cirugía |
      | Pólipos                    | Histeroscopia     | Polipectomía |
      | Hiperplasia endometrial    | Biopsia           | ACO, curetaje |
      | Coagulopatía              | Coagulación       | Hematología |
      | Disfunción tiroidea       | TSH               | Levotiroxina |
      | Anovulación               | Progesterona      | ACO         |

  # ─────────────────────────────────────────────────────────────
  # 6. VULVODINIA Y DOLOR PÉLVICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de vulvodinia
    Dado que se diagnostica vulvodinia
    Cuando se trata
    Entonces:
      | Tratamiento               |
      | Fisioterapia pélvica      |
      | Terapia cognitivo-conductual |
      | Antidepresivos tricíclicos tópicos |
      | Toxina botulínica (refractario) |
      | Terapia de pareja         |

  # ─────────────────────────────────────────────────────────────
  # 7. MANEJO DE MENOPAUSIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de menopausia
    Dado que se evalúa menopausia
    Cuando se maneja
    Entonces:
      | Síntoma                    | Tratamiento |
      | Sofocos                   | HTM si no contraindicada |
      | Sequedad vaginal          | Estrógeno tópico |
      | Osteoporosis              | Calcio + vitamina D + bisfosfonatos |
      | Depresión                 | ISRS           |
      | Atrofia urogenital        | Estrógeno tópico |

  # ─────────────────────────────────────────────────────────────
  # 8. CÁNCER GINECOLÓGICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Tamizaje de cáncer de mama
    Dado que se realiza tamizaje de cáncer de mama
    Cuando se evalúa
    Entonces:
      | Edad    | Estudio           | Frecuencia |
      | 40-49   | Mamografía        | Anual (si factores) |
      | 50-74   | Mamografía        | Cada 2 años |
      | >75     | Evaluar           | Individual  |
      | Alta riesgo | RM mamaria | Anual      |

  Escenario: Manejo de masa mamaria
    Dado que se detecta masa mamaria
    Cuando se evalúa
    Entonces el sistema guía:
      | Evaluación               |
      | Exploración mamaria      |
      | Mamografía (si >30 años) |
      | Ecografía mamaria        |
      | Biopsia (si indicación)  |
      | Referencia a mastología  |
