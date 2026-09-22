# language: es
# @id GHE-IMAGING-003
# @type business-rule
# @domain imaging
# @layer quality
# @risk s2
# @owner radiology-director
# @status proposed
# @requirement REQ-IMAGING-003
# @risk-control CTRL-IMAGING-003
# @regulation NOM-024
@domain:imaging @type:business-rule @risk:s2 @status:proposed
Característica: Aseguramiento de Calidad en Imagenología
  Como técnico de imagenología
  Quiero protocolos de calidad para cada modalidad
  Para garantizar imágenes diagnósticas y seguridad del paciente

  Regla: Protocolos por modalidad

    Escenario: Protocolo de Rayos X
      Dado que se realiza estudio de RX
      Cuando se posiciona paciente
      Entonces se verifica:
        | Campo                   | Requisito            |
        | Proyección correcta     | Según solicitud      |
        | Centrado                | Área de interés      |
        | Respiración             | Apendicular/inspirar |
        | Protección gonadal      | Si aplica            |
        | Marca de lateralidad    | Siempre visible      |

    Escenario: Protocolo de Ultrasonido
      Dado que se realiza ecografía
      Cuando se inicia estudio
      Entonces se verifica:
        | Campo                   | Requisito            |
        | Sonda correcta          | Según región         |
        | Gel adecuado            | Sin burbujas         |
        | Mediciones              | Biometría fetal      |
        | Doppler                 | Flujo umbilical      |
        | BI-RADS/TRADS           | Según protocolo      |

    Escenario: Protocolo de Tomografía
      Dado que se realiza TAC
      Cuando se planifica estudio
      Entonces se verifica:
        | Campo                   | Requisito            |
        | Reconstrucción          | Thickness adecuado   |
        | Contraste               | Si indicado, ver alergia |
        | Fase de contraste       | Arterial/venosa mixta|
        | Dosis CTDI              | Dentro de diagnóstico|

  Regla: Reacción a contraste se gestiona

    Escenario: Reacción leve a contraste
      Dado que paciente presenta urticaria leve post-contraste
      Cuando se evalúa
      Entonces se administra: antihistamínico, hidratación
      Y se documenta reacción en expediente
      Y se marca alergia en perfil del paciente

    Escenario: Reacción anafiláctica
      Dado que paciente presenta broncoespasmo post-contraste
      Cuando se activa protocolo de emergencia
      Entonces se administra: adrenalina, oxígeno, monitorización
      Y se genera incidente de seguridad del paciente

  Regla: Imágenes se almacenan con estándares

    Escenario: Almacenamiento DICOM
      Dado que se completa estudio de imagen
      Cuando se archiva
      Entonces se almacena en formato DICOM
      Y se vincula con ID del paciente y estudio
      Y se verifica integridad del archivo

  Regla: Calidad se mide continuamente

    Escenario: Indicadores de imagenología
      Dado que se consulta dashboard de imagenología
      Entonces muestra:
        | Indicador                    | Meta       |
        | Estudios con hallazgos       | >70%       |
        | Tiempo de reporte            | <24 horas  |
        | Repeticiones por técnica     | <3%        |
        | Reacciones a contraste       | <0.5%      |
        | Estudios fuera de protocolo  | <5%        |
