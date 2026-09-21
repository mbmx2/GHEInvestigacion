# language: es
# @id GHE-SAFETY-SCR-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s1
# @owner lab-director
# @status proposed
# @requirement REQ-SAFETY-SCR
# @risk-control CTRL-SAFETY-SCR
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s1 @status:proposed
Característica: Protocolo de Toma de Muestras
  Como personal de laboratorio del hospital
  Quiero protocolos estandarizados de toma de muestras
  Para que cada muestra sea válida y rastreable

  Regla: Toda muestra se identifica con 2 identificadores

    Escenario: Doble verificación de identidad
      Dado que se toma muestra
      Cuando se verifica identidad
      Entonces se comprueba:
        | Verificación              |
        | Nombre completo verbal   |
        | Fecha de nacimiento o CURP visual |
        | Coincidencia con etiqueta |

  Regla: La muestra se etiqueta inmediatamente

    Escenario: Etiquetado inmediato
      Dado que se toma muestra
      Cuando se etiqueta
      Entonces la etiqueta incluye:
        | Campo                      |
        | Nombre del paciente       |
        | CURP                      |
        | Fecha/hora de toma        |
        | Tipo de muestra           |
        | Nombre del que tomó       |
        | Número de lote (si aplica)|

  Regla: La cadena de frío se mantiene

    Escenario: Transporte con cadena de frío
      Dado que se transporta muestra
      Cuando se verifica
      Entonces:
        | Verificación              |
        | Transporte enneverada     |
        | Temperatura 2-8°C        |
        | Tiempo <30 min            |
        | Sin congelación           |

  Regla: Las muestras rechazadas se notifican

    Escenario: Muestra rechazada
      Dado que laboratorio rechaza una muestra
      Cuando se notifica
      Entonces:
        | Campo                      |
        | Motivo de rechazo         |
        | Nueva muestra necesaria   |
        | Tiempo de re-toma         |
        | Notificación al médico   |

  # @invariante INV-SCR-001: No se procesa muestra sin etiqueta válida
  Regla: Muestra sin etiqueta válida se rechaza

    Escenario: Muestra sin etiqueta
      Dado que se recibe muestra sin etiqueta válida
      Cuando se detecta
      Entonces se rechaza y se solicita nueva muestra
