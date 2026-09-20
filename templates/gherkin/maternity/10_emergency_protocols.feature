# language: es
Característica: Emergencias Obstétricas
@status:proposed
@type:acceptance
@domain:maternity
  Como médico de emergencias
  Quiero protocolos paso a paso para cada emergencia
  Para actuar rápido cuando hay vidas en riesgo

  Contexto:
    Dado que el sistema está activo
    Y que hay emergencia obstétrica

  Escenario: Hemorragia posparto
    Dado que hay hemorragia >500ml postparto
    Cuando se activa protocolo
    Entonces el sistema guía:
      | Paso | Acción                              | Tiempo   |
      | 1    | Masaje uterino bimanual            | Inmediato|
      | 2    | Oxitocina 10-20U IV                | 1 min    |
      | 3    | Acceso venoso x2 (16G)             | 2 min    |
      | 4    | Tipaje + 2 unidades sangre         | 5 min    |
      | 5    | Evaluar las 4 T's                   | 5 min    |
      | 6    | Si no responde: Misoprostol 800mcg  | 10 min   |
      | 7    | Si no responde: Tranexámico 1g IV   | 15 min   |
      | 8    | Si no responde: Cirugía             | 30 min   |

  Escenario: Eclampsia
    Dado que paciente tiene convulsiones
    Cuando se activa protocolo
    Entonces el sistema guía:
      | Paso | Acción                              | Tiempo   |
      | 1    | Proteger vía aérea (lateral)       | Inmediato|
      | 2    | Oxígeno al 100%                     | Inmediato|
      | 3    | Sulfato Mg 4-6g IV (15-20 min)     | 5 min    |
      | 4    | Mantenimiento 1-2g/h               | Continuo |
      | 5    | Monitoreo reflejos rotulianos       | Cada h   |
      | 6    | Si recurre → Cesárea emergencia     | Inmediato|

  Escenario: Sufrimiento fetal agudo
    Dado que FCF <110 o >160 persistente
    Cuando se activa protocolo
    Entonces el sistema guía:
      | Paso | Acción                              |
      | 1    | Posición lateral izquierda          |
      | 2    | Oxígeno al 100%                     |
      | 3    | Hidratación IV                      |
      | 4    | Detener oxitocina si activa          |
      | 5    | Evaluación fetal (ecografía)        |
      | 6    | Si no mejora → parto inmediato      |

  Escenario: Prolapso de cordón
    Dado que se detecta prolapso de cordón
    Cuando se activa protocolo
    Entonces el sistema guía:
      | Paso | Acción                              |
      | 1    | Maniobra de levantamiento           |
      | 2    | Trendelenburg                       |
      | 3    | Oxígeno al 100%                     |
      | 4    | Notificar cirujano                  |
      | 5    | Cesárea de emergencia INMEDIATA     |

  Escenario: Embolia de líquido amniótico
    Dado que se sospecha embolia de LIA
    Cuando se activa protocolo
    Entonces el sistema guía:
      | Paso | Acción                              |
      | 1    | Oxígeno al 100%                     |
      | 2    | Acceso venoso x2                    |
      | 3    | Soporte hemodinámico                |
      | 4    | Notificar equipo emergencia         |
      | 5    | Considerar cesárea                  |

  Escenario: Ruptura uterina
    Dado que se sospecha ruptura uterina
    Cuando se activa protocolo
    Entonces el sistema guía:
      | Paso | Acción                              |
      | 1    | Detener oxitocina                   |
      | 2    | Acceso venoso x2 + tipaje           |
      | 3    | Cesárea de emergencia               |
      | 4    | Exploración + reparación/histerectomía|

  Escenario: Checklist pre-emergencia
    Dado que se verifica readiness
    Cuando se revisa
    Entonces debe haber:
      | Recurso                    | Estado |
      | Oxígeno                    | ✅     |
      | Sulfato de magnesio        | ✅     |
      | Oxitocina                  | ✅     |
      | Sangre (tipaje)            | ✅     |
      | Contacto cirujano         | ✅     |
      | Ambulancia                | ✅     |
