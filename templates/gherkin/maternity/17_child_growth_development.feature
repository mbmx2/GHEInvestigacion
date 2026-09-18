# language: es
# Crecimiento y Desarrollo Infantil (0-5 años)
Característica: Pediatría de Desarrollo (GHE Maternidad)
  Como pediatra de la maternidad
  Quiero workflows de crecimiento y desarrollo infantil
  Para detectar retrasos y problemas a tiempo

  # ─────────────────────────────────────────────────────────────
  # 1. CURVAS DE CRECIMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Registro de peso y talla por edad
    Dado que el niño acude a control
    Cuando se registra peso y talla
    Entonces el sistema grafica contra curvas OMS:
      | Parámetro                  | Percentiles OMS  |
      | Peso/edad                  | 3, 15, 50, 85, 97 |
      | Talla/edad                 | 3, 15, 50, 85, 97 |
      | IMC/edad                   | 3, 15, 50, 85, 97 |
      | Perímetro cefálico/edad    | 3, 15, 50, 85, 97 |

  Escenario: Alerta de crecimiento anormal
    Dado que el niño tiene peso <3 percentil
    Cuando se evalúa
    Entonces el sistema alerta:
      | Alerta                      |
      | "Peso por debajo del 3% — retraso del crecimiento" |
      | "Evaluar: nutrición, enfermedad crónica, causas endocrinas" |
      | "Solicitar: BHC, glucosa, TSH, perfil hepático" |

  # ─────────────────────────────────────────────────────────────
  # 2. HITOS DEL DESARROLLO
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguimiento de hitos del desarrollo
    Dado que el niño acude a control de desarrollo
    Cuando se evalúa
    Entonces el sistema verifica hitos:
      | Edad     | Motor fino | Motor grueso | Lenguaje | Social |
      | 2 meses  | Sigue objetos | — | Sonidos | Sonrisa social |
      | 4 meses  | Agarra objetos | Voltea | Balbuceo | Juega |
      | 6 meses  | Se sienta | Rodillas | Dice "mamá/papá" | Reconoce padres |
      | 9 meses  | Se para con apoyo | Gatea | Dice "mamá/papá" | Separación |
      | 12 meses | Pincer grasp | Camina | 3 palabras | Juego simbólico |
      | 18 meses | Usa cuchara | Camina bien | 10+ palabras | Imita adultos |
      | 24 meses | Dibuja líneas | Corre | Frases 2 palabras | Juego paralelo |
      | 3 años   | Dibuja círculo | Salta | Frases completas | Juego cooperativo |
      | 4 años   | Dibuja persona | Salta con un pie | Cuenta a 10 | Juego de roles |
      | 5 años   | Escribe números | Salta con dos pies | Lee nombre | Reglas |

  Escenario: Detección de retraso del desarrollo
    Dado que el niño no alcanza hitos esperados
    Cuando se evalúa
    Entonces el sistema alerta:
      | Alerta                      |
      | "Retraso en [dominio] — evaluar" |
      | "Considerar: estimulación temprana, evaluación especializada" |
      | "Registrar en expediente para seguimiento" |

  # ─────────────────────────────────────────────────────────────
  # 3. VACUNACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Esquema de vacunación 0-6 años
    Dado que se verifica esquema vacunal
    Cuando se revisa
    Entonces el sistema muestra:
      | Edad     | Vacuna                    | Dosis |
      | Al nacer | BCG, Hepatitis B (1ra)    | 1ra   |
      | 2 meses  | Hexavalente, Rotavirus, Neumococo | 1ra |
      | 4 meses  | Hexavalente, Rotavirus, Neumococo | 2da |
      | 6 meses  | Hexavalente, Rotavirus, Neumococo, Influenza | 3ra |
      | 12 meses | Triple viral, Neumococo, Varicela | 1ra |
      | 18 meses | DPT, Polio, Hepatitis B | Refuerzo |
      | 4-6 años| DPT, Polio, SRP           | Refuerzo |

  Escenario: Alerta de vacunas pendientes
    Dado que el niño tiene vacunas pendientes
    Cuando se detecta
    Entonces el sistema alerta:
      | Alerta                      |
      | "Vacuna [nombre] pendiente desde [fecha]" |
      | "Programar aplicación"     |

  # ─────────────────────────────────────────────────────────────
  # 4. NUTRICIÓN INFANTIL
  # ─────────────────────────────────────────────────────────────

  Escenario: Guía de alimentación por edad
    Dado que se asesora sobre alimentación
    Cuando se evalúa edad
    Entonces el sistema muestra:
      | Edad     | Recomendación          |
      | 0-6 meses | Lactancia materna exclusiva |
      | 6 meses  | Introducir alimentos complementarios |
      | 7-12 meses| Variedad de alimentos, texturas |
      | 1-2 años | Dieta familiar, leche de vaca |
      | 2-5 años | Dieta equilibrada, 5 comidas |

  # ─────────────────────────────────────────────────────────────
  # 5. ENFERMEDADES COMUNES
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de IRA en niño
    Dado que el niño acude con IRA
    Cuando se evalúa
    Entonces el sistema guía:
      | Severidad | Señales            | Acción |
      | Leve      | Fiebre <38, flujo  | Sintomático |
      | Moderada  | Fiebre >38, tos    | Evaluar neumonía |
      | Severa    | Dificultad respiratoria | Emergencia |

  Escenario: Manejo de diarrea
    Dado que el niño acude con diarrea
    Cuando se evalúa
    Entonces el sistema guía:
      | Evaluación                  |
      | Deshidratación (escala de EMS) |
      | Si sin deshidratación: SRO en casa |
      | Si deshidratación leve: SRO supervisado |
      | Si deshidratación moderada/severa: IV |
