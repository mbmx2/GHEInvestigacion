# language: es
# @id GHE-LAB-INTERP-001
# @type clinical
# @domain laboratory
# @layer clinical
# @risk s1
# @owner lab-director
# @status proposed
# @requirement REQ-LAB-INTERP
# @risk-control CTRL-LAB-INTERP
# @regulation NOM-024
@domain:laboratory @type:clinical @risk:s1 @status:proposed
Característica: Interpretación de Estudios de Laboratorio por Tipo
  Como médico del hospital
  Quiero interpretación automática por tipo de estudio
  Para que cada resultado tenga acción clínica asociada

  Regla: BHC se interpreta con fórmula leucocitaria

    Escenario: BHC completa interpretada
      Dado que se procesa BHC
      Cuando se interpreta
      Entonces:
        | Hallazgo                  | Interpretación |
        | Hb baja                   | Anemia → clasificar por VCM |
        | Leucocitos altos          | Infección → buscar foco |
        | Plaquetas bajas           | Trombocitopenia → evaluar HELLP en embarazada |

  Regenario: Perfil hepático interpretado
    Dado que se procesa perfil hepático
    Cuando se interpreta
    Entonces:
      | Hallazgo                  | Interpretación |
      | AST/ALT elevados          | Daño hepatocelular |
      | FA y GGT elevadas         | Colestasis |
      | Bilirrubina directa alta  | Obstructiva |

  Regla: Coagulación interpretada en contexto obstétrico
    Dado que se procesa coagulación en embarazada
    Cuando se interpreta
    Entonces usa valores corregidos por trimestre

  Regla: Resultados críticos notifican inmediatamente

    Escenario: Valor crítico
      Dado que se detecta valor crítico
      Cuando se notifica
      Entonces: notificación inmediata al médico + registro
