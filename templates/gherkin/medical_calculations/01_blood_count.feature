# language: es
# @id GHE-MED-BHC-001
# @type clinical
# @domain laboratory
# @layer clinical
# @risk s2
# @owner medical-director
# @status proposed
@domain:laboratory @type:clinical @risk:s2 @status:proposed
Característica: Interpretación de Biometría Hemática
  Como médico del hospital
  Quiero interpretación automática de BHC
  Para detectar anemia, infecciones y trastornos hematológicos

  Contexto:
    Dado que el sistema tiene BHC en el catálogo

  Escenario Outline: Interpretación de leucocitos
    Dado que leucocitos = <valor>/µL
    Entonces interpretación = "<interpretación>"

    Ejemplos:
      | valor   | interpretación              |
      | 8,000   | Normal                      |
      | 3,500   | Leucopenia                  |
      | 15,000  | Leucocitosis (infección)    |
      | 35,000  | Leucocitosis severa (emergencia) |

  Escenario Outline: Interpretación de hemoglobina
    Dado que hemoglobina = <valor> g/dL en <sexo>
    Entonces interpretación = "<interpretación>"

    Ejemplos:
      | valor | sexo   | interpretación                    |
      | 15.0  | hombre | Normal                            |
      | 11.0  | hombre | Anemia leve                       |
      | 9.0   | hombre | Anemia moderada                   |
      | 6.0   | hombre | Anemia severa (emergencia)        |
      | 13.0  | mujer  | Normal                            |
      | 10.0  | mujer  | Anemia leve                       |
      | 8.0   | mujer  | Anemia moderada                   |

  Escenario Outline: Interpretación de plaquetas
    Dado que plaquetas = <valor>/µL
    Entonces interpretación = "<interpretación>"

    Ejemplos:
      | valor    | interpretación                     |
      | 250,000  | Normal                             |
      | 100,000  | Trombocitopenia leve              |
      | 50,000   | Trombocitopenia severa (alerta)   |
      | 25,000   | Trombocitopenia crítica (emergencia)|
      | 600,000  | Trombocitosis                      |

  Escenario Outline: Clasificación de anemia por VCM
    Dado que VCM = <valor> fL y Hb baja
    Entonces clasificación = "<clasificación>"

    Ejemplos:
      | valor | clasificación             |
      | 70    | Microcítica (hierro)      |
      | 90    | Normocítica (crónica)     |
      | 110   | Macrocítica (B12/ác. fólico) |
