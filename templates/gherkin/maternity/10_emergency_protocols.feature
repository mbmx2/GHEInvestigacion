# language: es
# Protocolos de Emergencia Detallados
Característica: Emergencias Obstétricas (GHE Maternidad)
  Como médico de emergencias de la maternidad
  Quiero protocolos detallados paso a paso para cada emergencia
  Para actuar rápido y correctamente cuando hay vidas en riesgo

  # ─────────────────────────────────────────────────────────────
  # 1. HEMORRAGIA POSPARTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de hemorragia posparto
    Dado que hay hemorragia >500ml después del parto
    Cuando se activa protocolo
    Entonces el sistema guía paso a paso:
      | Paso | Acción | Tiempo |
      | 1 | Masaje uterino bimanual | Inmediato |
      | 2 | Oxitocina 10-20U IV | 1 min |
      | 3 | Acceso venoso x2 (16G) | 2 min |
      | 4 | Tipaje y cruzar 2 unidades | 5 min |
      | 5 | Sonda vesical | 2 min |
      | 6 | Evaluar las 4 T's | 5 min |
      | 7 | Si no responde → Misoprostol 800mcg sublingual | 10 min |
      | 8 | Si no responde → Tranexámico 1g IV | 15 min |
      | 9 | Si no responde → Cirugía | 30 min |

  # ─────────────────────────────────────────────────────────────
  # 2. ECLAMPSIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de eclampsia
    Dado que la paciente tiene convulsiones
    Cuando se activa protocolo
    Entonces el sistema guía:
      | Paso | Acción | Tiempo |
      | 1 | Proteger vía aérea (posición lateral) | Inmediato |
      | 2 | Oxígeno al 100% | Inmediato |
      | 3 | Sulfato de magnesio 4-6g IV en 15-20 min | 5 min |
      | 4 | Mantenimiento 1-2g/h | Continuo |
      | 5 | Monitoreo de reflejos rotulianos | Cada h |
      | 6 | Respiración >12 rpm | Cada h |
      | 7 | Catéter vesical | Continuo |
      | 8 | Si recurre → Cesárea de emergencia | Inmediato |

  # ─────────────────────────────────────────────────────────────
  # 3. SUFRIMIENTO FETAL AGUDO
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de sufrimiento fetal
    Dado que se detecta FCF <110 o >160 persistente
    Cuando se activa protocolo
    Entonces:
      | Paso | Acción |
      | 1 | Posición lateral izquierda |
      | 2 | Oxígeno al 100% |
      | 3 | Hidratación IV |
      | 4 | Detener oxitocina si activa |
      | 5 | Evaluación fetal (ecografía) |
      | 6 | Si no mejora → parto inmediato |
      | 7 | Si no se puede parto vaginal → cesárea |

  # ─────────────────────────────────────────────────────────────
  # 4. PROLAPSO DE CORDÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de prolapso de cordón
    Dado que se detecta prolapso de cordón
    Cuando se activa protocolo
    Entonces:
      | Paso | Acción |
      | 1 | Maniobra de levantamiento de Presentación |
      | 2 | Posición de Trendelenburg |
      | 3 | Oxígeno al 100% |
      | 4 | Hidratación IV |
      | 5 | Notificar cirujano |
      | 6 | Cesárea de emergencia INMEDIATA |

  # ─────────────────────────────────────────────────────────────
  # 5. EMBOLIA DE LÍQUIDO AMNIÓTICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de embolia de LIA
    Dado que se sospecha embolia de LIA
    Cuando se activa protocolo
    Entonces:
      | Paso | Acción |
      | 1 | Oxígeno al 100% |
      | 2 | Acceso venoso x2 |
      | 3 | Soporte hemodinámico |
      | 4 | Notificar equipo de emergencia |
      | 5 | Considerar cesárea |
      | 6 | Soporte vital avanzado |

  # ─────────────────────────────────────────────────────────────
  # 6. RUPTURA UTERINA
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de ruptura uterina
    Dado que se sospecha ruptura uterina (cesárea previa + dolor)
    Cuando se activa protocolo
    Entonces:
      | Paso | Acción |
      | 1 | Detener oxitocina |
      | 2 | Acceso venoso x2 |
      | 3 | Tipaje y sangre |
      | 4 | Cesárea de emergencia |
      | 5 | Exploración uterina |
      | 6 | Reparación o histerectomía |

  # ─────────────────────────────────────────────────────────────
  # 7. CHECKLIST PRE-EMERGENCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de准备 de emergencia
    Dado que se verifica readiness para emergencias
    Cuando se revisa
    Entonces:
      | Recurso                    | Estado    |
      | Oxígeno disponible         | ✅         |
      | Sulfato de magnesio        | ✅         |
      | Oxitocina                  | ✅         |
      | Acceso venoso              | ✅         |
      | Sangre (tipaje)            | ✅         |
      | Equipo de reanimación      | ✅         |
      | Contacto de cirujano       | ✅         |
      | Ambulancia disponible      | ✅         |
