# language: es
# @id GHE-SAFETY-IP-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s1
# @owner infection-control
# @status proposed
# @requirement REQ-SAFETY-IP
# @risk-control CTRL-SAFETY-IP
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s1 @status:proposed
Característica: Prevención de Infecciones Nosocomiales
  Como responsable de control de infecciones del hospital
  Quiero protocolos de prevención de infecciones
  Para que no se adquieran infecciones durante la hospitalización

  Regla: Higiene de manos se verifica

    Escenario: Cumplimiento de higiene de manos
      Dado que se verifica higiene de manos
      Cuando se audita
      Entonces se mide:
        | Punto                      | Meta de cumplimiento |
        | Antes de contacto directo  | >90%                 |
        | Antes de procedimiento aséptico | >95%         |
        | Después de contacto con fluidos | >90%        |
        | Después de contacto con paciente | >90%       |

  Regla: Infección de sitio quirúrgico se previene

    Escenario: Profilaxis antibiótica
      Dado que se realiza cirugía
      Cuando se administra profilaxis
      Entonces:
        | Verificación              |
        | Antibiótico antes de incisión (30-60 min) |
        | Antibiótico correcto para el procedimiento |
        | Dosis correcta según peso |
        | No prolongar profilaxis >24h |

  Regenario: Vigilancia de ISQ
    Dado que se vigila infección de sitio quirúrgico
    Cuando se registra
    Entonces incluye:
      | Campo                      |
      | Tipo de cirugía           |
      | Clasificación de herida   |
      | Profilaxis antibiótica    |
      | Tiempo quirúrgico         |
      | Infección post-op (Sí/No) |

  Regla: Catéteres se gestionan

    Escenario: Vigilancia de catéteres
      Dado que paciente tiene catéter urinario
      Cuando se monitorea
      Entonces:
        | Verificación              |
        | Necesidad de catéter      |
        | Retiro tan pronto sea posible |
        | Higiene del sitio        |
        | Vigilancia de infección  |

  Regla: Lavado de manos documentado

    Escenario: Cumplimiento documentado
      Dado que se audita lavado de manos
      Cuando se verifica
      Entonces se tiene tasa de cumplimiento y tendencia
