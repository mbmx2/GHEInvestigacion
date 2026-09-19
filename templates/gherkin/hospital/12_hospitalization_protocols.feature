# language: es
# Hospitalización - Protocolos por Patología
Característica: Protocolos de Hospitalización (GHE Hospital)
  Como médico internista del hospital
  Quiero protocolos específicos por patología para hospitalización
  Para estandarizar la atención de pacientes internados

  # ─────────────────────────────────────────────────────────────
  # 1. NEUMONÍA ADQUIRIDA EN LA COMUNIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de NAC
    Dado que se hospitaliza por neumonía adquirida en la comunidad
    Cuando se inicia protocolo
    Entonces el sistema guía:
      | Paso                       |
      | Clasificación CURB-65      |
      | Antibioticoterapia empírica|
      | Oxigenoterapia si SpO2<92% |
      | Muestras para cultivo      |
      | Monitoreo cada 4h          |
      | Reevaluación a las 48-72h  |
      | Critérios de alta          |

  # ─────────────────────────────────────────────────────────────
  # 2. INSUFICIENCIA CARDÍACA AGUDA
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de IC aguda
    Dado que se hospitaliza por IC aguda
    Cuando se inicia protocolo
    Entonces:
      | Paso                       |
      | Clasificación NYHA        |
      | Diagnóstico con BNP/NT-proBNP |
      | Diuréticos IV             |
      | Oxigenoterapia            |
      | Monitorización hemodinámica|
      | Restrictión hídrica       |
      | Manejo de comorbilidades  |

  # ─────────────────────────────────────────────────────────────
  # 3. DIABETES MELLITUS
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de cetoacidosis diabética
    Dado que se hospitaliza por CAD
    Cuando se inicia protocolo
    Entonces:
      | Paso                       |
      | Insulina IV en bolo       |
      | Solución salina           |
      | Reposición de potasio     |
      | Monitoreo horario glucosa |
      | Monitoreo horario electrolitos |
      | Continuar hasta anión gap normal |
      | Transición a SC cuando tolera |

  Escenario: Protocolo de estado hiperosmolar
    Dado que se hospitaliza por EHHN
    Cuando se inicia protocolo
    Entonces:
      | Paso                       |
      | Hidratación agresiva      |
      | Insulina IV               |
      | Monitoreo horario         |
      | Reevaluar 4-6 horas       |

  # ─────────────────────────────────────────────────────────────
  # 4. SEPSIS
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de sepsis
    Dado que se sospecha sepsis
    Cuando se activa protocolo
    Entonces:
      | Paso                       | Tiempo |
      | Sobrecarga hídrica 30 mL/kg | 1 hora |
      | Hemocultivos x2          | Antes de antibiótico |
      | Antibioticoterapia empírica | 1 hora |
      | Lactato sérico           | 1 hora |
      | Reevaluación hemodinámica| 6 horas |
      | Escalamiento si no responde | Inmediato |

  # ─────────────────────────────────────────────────────────────
  # 5. ICTERICIA DEL ADULTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de ictericia
    Dado que se evalúa ictericia en adulto
    Cuando se investiga causa
    Entonces:
      | Bilirrubina directa vs indirecta | Causa probable |
      | Directa elevada              | Colestasis, hepatitis |
      | Indirecta elevada           | Hemólisis, síndrome de Gilbert |
      | Ambas elevadas              | Hepatocelular |
    Y estudios:
      | Estudio                    |
      | Perfil hepático completo  |
      | Ecografía abdominal       |
      | Bilirrubina directa/indirecta |
      | Fosfatasa alcalina        |
      | GGT                       |
      | Pruebas de coagulación    |

  # ─────────────────────────────────────────────────────────────
  # 6. ANEMIA SEVERA
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de anemia severa
    Dado que se hospitaliza por anemia (Hb <7)
    Cuando se inicia protocolo
    Entonces:
      | Paso                       |
      | Valoración de estabilidad |
      | Transfusión si Hb <7 o inestable |
      | Investigar causa          |
      | Hierro IV si déficit      |
      | Monitoreo post-transfusión|
      | Criterios de alta         |

  # ─────────────────────────────────────────────────────────────
  # 7. EPF (EVENTO POTENCIALMENTE FATAL)
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de respuesta a deterioro
    Dado que se detecta deterioro del paciente
    Cuando se activa RRT
    Entonces:
      | Criterio de activación    |
      | PA <90 o >200             |
      | FC <50 o >130            |
      | FR >30 o <8              |
      | SpO2 <90%                |
      | Glasgow <12              |
      | Fiebre >40°C             |
      | Convulsiones             |
      | Dolor torácico           |
      | Sangrado activo          |
    Y tiempo de respuesta: <5 minutos
