# language: es
# @id GHE-SURGERY-004
# @type business-rule
# @domain surgery
# @layer safety
# @risk s1
# @owner surgery-director
# @status proposed
# @requirement REQ-SURGERY-004
# @risk-control CTRL-SURGERY-004
# @regulation NOM-024
@domain:surgery @type:business-rule @risk:s1 @status:proposed
Característica: Checklist Quirúrgico por Tipo de Cirugía
  Como cirujano
  Quiero checklists específicas por tipo de procedimiento
  Para prevenir errores específicos de cada cirugía

  Regla: Cirugía general tiene checklist base

    Escenario: Laparotomía exploratoria
      Dado que se programa laparotomía exploratoria
      Cuando se ejecuta checklist preoperatoria
      Entonces se verifica:
        | Item                           | Requisito          |
        | Ayuno mínimo 8 horas           | Confirmado         |
        | Consentimiento quirúrgico      | Firmado            |
        | Tipo de sangre disponible      | Cruzado y reservado|
        | Profilaxis antibiótica         | 60 min pre-incisión|
        | Vía venosa de calibre adecuado | 18G o mayor        |
        | Sonda vesical                  | Colocada           |
        | Compresión neumática           | Activada           |

  Regla: Cirugía obstétrica requiere checklist dual

    Escenario: Cesárea de urgencia
      Dado que se programa cesárea de urgencia
      Cuando se ejecuta checklist
      Entonces se verifica additionally:
        | Item                           | Requisito          |
        | Neonatólogo presente           | Sí                 |
        | Incubadora preparada           | Sí                 |
        | Medicamentos neonatales        | Listos             |
        | Tipo de anestesia definido     | Regional/general   |
        | Sangre materna disponible      | Mínimo 2 unidades  |
      Y se notifica a terapia intensiva neonatal

    Escenario: Cirugía ginecológica mayor
      Dado que se programa histerectomía
      Cuando se ejecuta checklist
      Entonces se verifica additionally:
        | Item                           | Requisito          |
        | Posología de anticoagulante    | Definida           |
        | Preparación intestinal         | Si aplica          |
        | Marcación del sitio            | Confirmada         |

  Regla: Cirugía de alto riesgo tiene protocolo extendido

    Escenario: Cirugía cardíaca
      Dado que se programa cirugía cardíaca
      Cuando se ejecuta checklist
      Entonces se verifica additionally:
        | Item                           | Requisito          |
        | Circulación extracorpórea      | Preparada          |
        | Desfibrilador externo          | Disponible         |
        | Hemoderivados                  | 4 unidades PRBC    |
        | Perfusionista confirmado       | Sí                 |
        | Cuido intensivo post-op        | Camilla disponible |
        | Equipo de reanimación          | En quirófano       |

  Regla: Verificación de quirófano post-cirugía

    Escenario: Count quirúrgico verificado
      Dado que cirugía está por finalizar
      Cuando se realiza count
      Entonces se verifica:
        | Elemento             | Estado   |
        | Compresas            | Contadas |
        | Agujas               | Contadas |
        | Instrumentos         | Contados |
        | Mallas/implantes     | Contados |
      Y coincide con count pre-operatorio
      # @invariante INV-SURGERY-COUNT-001

    Escenario: Discrepancia en count quirúrgico
      Dado que count post-operatorio no coincide
      Cuando se detecta discrepancia
      Entonces se detiene el cierre
      Y se realiza radiografía de localización
      Y se documenta como evento de seguridad

  Regla: Negativos por protocolo

    Escenario: Cirugía sin consentimiento
      Dado que paciente no firmó consentimiento
      Cuando se intenta programar cirugía
      Entonces sistema bloquea la programación
      Y requiere consentimiento antes de continuar

    Escenario: Profilaxis fuera de ventana
      Dado que profilaxis antibiótica se administra >60 min pre-incisión
      Cuando se detecta retraso
      Entonces sistema genera alerta
      Y documenta desviación del protocolo
