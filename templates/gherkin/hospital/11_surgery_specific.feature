# language: es
# Cirugía - Procedimientos Específicos
@status:proposed
@type:acceptance
@domain:hospital
Característica: Procedimientos Quirúrgicos (GHE Hospital)
  Como cirujano del hospital
  Quiero workflows para procedimientos quirúrgicos específicos
  Para realizar cirugías de forma segura y documentada

  # ─────────────────────────────────────────────────────────────
  # 1. HISTERECTOMÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Indicaciones de histerectomía
    Dado que se evalúa indicación de histerectomía
    Cuando se evalúa
    Entonces el sistema verifica:
      | Indicación                |
      | Miomas sintomáticos refractarios |
      | Sangrado uterino anormal  |
      | Adenomiosis sintomática   |
      | Prolapso de útero         |
      | Neoplasia intraepitelial cervical |
      | Cáncer cervicouterino early stage |
    Y clasifica tipo:
      | Tipo                      | Vía de acceso |
      | Total abdominal           | Laparotomía   |
      | Total vaginal             | Vaginal       |
      | Total laparoscópica       | Laparoscopia  |
      | Supracervical             | Abdominal/laparoscópica |

  Escenario: Checklist pre-histerectomía
    Dado que se programa histerectomía
    Cuando se verifica checklist
    Entonces incluye:
      | Verificación               |
      | Consentimiento informado  |
      | Tipo de histerectomía definido |
      | Tipo de anestesia definido |
      | Estudios preoperatorios   |
      | Tipo sanguíneo y Rh       |
      | Profilaxis antibiótica    |
      | Ayuno confirmado          |
      | Plan de analgesia post-op |

  # ─────────────────────────────────────────────────────────────
  # 2. APENDICECTOMÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de apendicitis
    Dado que se diagnostica apendicitis
    Cuando se evalúa
    Entonces el sistema guía:
      | Evaluación                 |
      | Historia y examen físico  |
      | Leucocitos, PCR           |
      | Ecografía abdominal       |
      | TAC abdomen (si duda)     |
      | Score de Alvarado         |
    Y score ≥7:
      | Acción                    |
      | Apendicectomía urgente   |
      | Profilaxis antibiótica   |
      | Consentimiento rápido    |

  Escenario: Apendicectomía laparoscópica
    Dado que se realiza apendicectomía laparoscópica
    Cuando se documenta
    Entonces el sistema registra:
      | Campo                     |
      | Hallazgos               |
      | Tamaño del apéndice      |
      | Perforación (sí/no)      |
      | Drenaje (sí/no)          |
      | Tiempo quirúrgico        |
      | Tiempo de hospitalización |

  # ─────────────────────────────────────────────────────────────
  # 3. COLECISTECTOMÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de colecistitis
    Dado que se diagnostica colecistitis
    Cuando se evalúa
    Entonces el sistema guía:
      | Evaluación                 |
      | Ecografía abdominal       |
      | Leucocitos, bilirrubina   |
      | Evaluación quirúrgica     |
      | Profilaxis antibiótica   |
    Y decide:
      | Hallazgo                  | Manejo |
      | Colecistitis aguda simple| Colecistectomía urgente (24-48h) |
      | Colecistitis complicada  | Estabilizar → cirugía diferida |
      | Colelitiasis asintomática| Observación |

  # ─────────────────────────────────────────────────────────────
  # 4. HERNIA INGUINAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de hernia inguinal
    Dado que se diagnostica hernia inguinal
    Cuando se evalúa
    Entonces el sistema guía:
      | Tipo                      | Manejo |
      | Indirecta, no complicada  | Cirugía programada |
      | Directa                   | Cirugía programada |
      | Estrangulada             | Cirugía urgente |
      | Incarcerada              | Observación o cirugía |

  # ─────────────────────────────────────────────────────────────
  # 5. CIRUGÍA DE TIROIDES
  # ─────────────────────────────────────────────────────────────

  Escenario: Indicaciones de tiroidectomía
    Dado que se evalúa tiroidectomía
    Cuando se evalúa
    Entonces:
      | Indicación                |
      | Nódulo tiroideo sospechoso (BI-RADS/TIRADS 4-5) |
      | Bocio sintomático         |
      | Hipertiroidismo refractario |
      | Cáncer de tiroides        |
      | Compresión de tráquea     |

  Escenario: Checklist de tiroidectomía
    Dado que se programa tiroidectomía
    Cuando se verifica
    Entonces incluye:
      | Verificación               |
      | Evaluación preanestésica  |
      | Función tiroidea          |
      | Calcio basal              |
      | Cirugía previa de cuello  |
      | Parálisis de cuerdas vocales |
      | Consentimiento informado  |

  # ─────────────────────────────────────────────────────────────
  # 6. CIRUGÍA DE EMERGENCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de laparotomía de emergencia
    Dado que se decide laparotomía de emergencia
    Cuando se ejecuta
    Entonces el sistema guía:
      | Paso                       |
      | 1. Consentimiento (si tiempo) |
      | 2. Preparación quirúrgica  |
      | 3. Inducción de anestesia  |
      | 4. Time-out quirúrgico    |
      | 5. Incisión               |
      | 6. Exploración            |
      | 7. Procedimiento          |
      | 8. Cierre                 |
      | 9. Recuperación           |
      | 10. Documentación         |

  Escenario: Manejo de abdomen agudo
    Dado que el paciente llega con abdomen agudo
    Cuando se evalúa
    Entonces el sistema guía:
      | Evaluación                 |
      | Historia y examen físico  |
      | Leucocitos, PCR           |
      | Ecografía abdominal       |
      | TAC abdomen               |
      | Rx tórax-abdomen          |
      | Valoración quirúrgica     |
    Y causas diferenciales:
      | Causa                      | Estudio clave |
      | Apendicitis               | Ecografía/TAC |
      | Colecistitis              | Ecografía      |
      | Obstrucción intestinal     | Rx/TAC         |
      | Perforación visceral      | Rx (aire libre)|
      | Pancreatitis              | Lipasa/amilasa |
