# language: es
# @id GHE-ISO13485-002
# @type business-rule
# @domain quality
# @layer engineering
# @risk s1
# @owner quality-director
# @status proposed
# @requirement REQ-ISO13485-002
# @risk-control CTRL-ISO13485-002
# @regulation ISO-13485 IEC-62304
@domain:quality @type:business-rule @risk:s1 @status:proposed
Característica: Controles de Diseño — ISO 13485 / IEC 62304
  Como ingeniero de software médico
  Quiero controles de diseño documentados y trazables
  Para que cada decisión de diseño sea verificable y validada

  Regla: Entradas de diseño se documentan

    Escenario: Requisitos de diseño
      Dado que se inicia fase de diseño
      Cuando se definen entradas
      Entonces se documentan:
        | Campo                          |
        | Requisitos funcionales         |
        | Requisitos de desempeño        |
        | Requisitos de seguridad        |
        | Requisitos de interfaz         |
        | Requisitos de interoperabilidad|
        | Restricciones de diseño        |
      Y cada requisito tiene trazabilidad a fuente

  Regla: Salidas de diseño son verificables

    Escenario: Revisión de diseño
      Dado que diseño preliminar está completo
      Cuando se realiza revisión de diseño
      Entonces se verifica:
        | Criterio                       | Resultado |
        | Requisitos cubiertos           | 100%      |
        | Riesgos mitigados              | Según ISO 14971 |
        | Cumplimiento normativo         | NOM-024   |
        | Complejidad aceptable          | Sí        |
      Y se genera acta de revisión

  Regla: Verificación es sistemática

    Escenario: Verificación de diseño
      Dado que diseño está en revisión
      Cuando se ejecuta verificación
      Entonces se aplica método apropiado:
        | Método            | Cuándo usarlo         |
        | Revisión técnica  | Diseño estático       |
        | Inspección        | Código fuente          |
        | Prueba unitaria   | Componentes aislados   |
        | Análisis estático | Complejidad ciclomática|

    Escenario: Falla en verificación
      Dado que verificación detecta falla
      Cuando se documenta
      Entonces se clasifica por severidad
      Y se asigna acción correctiva con responsable
      Y no se avanza hasta resolución

  Regla: Validación confirma uso previsto

    Escenario: Validación con usuario
      Dado que prototipo está listo
      Cuando se realiza validación
      Entonces se verifica que cumple:
        | Criterio                       |
        | Necesidades del usuario        |
        | Uso previsto definido          |
        | Seguridad aceptable            |
        | Usabilidad medida              |
      Y se documenta evidencia de validación

  Regla: Transferencia de diseño a producción

    Escenario: Design transfer
      Dado que diseño está validado
      Cuando se transfiere a implementación
      Entonces se verifica que:
        | Elemento                        |
        | Especificaciones claras         |
        | Procedimientos documentados     |
        | Personal capacitado             |
        | Herramientas disponibles        |
      Y se registra transferencia formal

  Regla: Cambios de diseño se controlan

    Escenario: Solicitud de cambio de diseño
      Dado que se requiere modificar diseño
      Cuando se somete solicitud
      Entonces se evalúa impacto en:
        | Área                 |
        | Seguridad            |
        | Rendimiento          |
        | Cumplimiento normativo|
        | Documentación        |
      Y se aprueba antes de implementar
