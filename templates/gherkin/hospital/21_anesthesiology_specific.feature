# language: es
# Anestesiología - Técnicas Específicas
Característica: Técnicas Anestésicas (GHE Hospital)
  Como anestesiólogo del hospital
  Quiero workflows para técnicas anestésicas específicas
  Para realizar procedimientos de forma segura

  # ─────────────────────────────────────────────────────────────
  # 1. ANESTESIA GENERAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Inducción de anestesia general
    Dado que se inicia anestesia general
    Cuando se ejecuta
    Entonces:
      | Paso                       |
      | Pre oxigenación 3-5 min   |
      | Inducción (propofol/fentanilo) |
      | Intubación orotraqueal    |
      | Confirmación de tubo      |
      | Mantenimiento (sevoflurano)|
      | Monitorización continua   |

  # ─────────────────────────────────────────────────────────────
  # 2. ANESTESIA RAQUÍDEA
  # ─────────────────────────────────────────────────────────────

  Escenario: Anestesia raquídea para cesárea
    Dado que se programa cesárea con raquídea
    Cuando se ejecuta
    Entonces:
      | Paso                       |
      | Posición lateral o sentada |
      | Asepsia                   |
      | Punción L3-L4             |
      | Anestésico (bupivacaína)  |
      | Monitoreo                 |
      | Bloqueo sensorial         |
      | Incisión                   |

  # ─────────────────────────────────────────────────────────────
  # 3. BLOQUEOS REGIONALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Bloqueo del plexo braquial
    Dado que se programa bloqueo del plexo
    Cuando se ejecuta
    Entonces:
      | Técnica                    | Indicación |
      | Interscalénico            | Hombro      |
      | Supraclavicular           | Brazo/mano  |
      | Infraclavicular           | Brazo/mano  |
      | Axilar                    | Brazo/mano  |

  # ─────────────────────────────────────────────────────────────
  # 4. MONITOREO AVANZADO
  # ─────────────────────────────────────────────────────────────

  Escenario: Monitoreo hemodinámico invasivo
    Dado que se requiere monitoreo invasivo
    Cuando se instala
    Entonces:
      | Dispositivo               | Indicación |
      | Línea arterial            | Cirugía mayor, IC |
      | Catéter de Swan-Ganz      | IC severa    |
      | Monitorización de BIS     | Profundidad anestésica |
      | TEE (ecocardiografía transesofágica)| Cirugía cardíaca |

  # ─────────────────────────────────────────────────────────────
  # 5. MANEJO DEL DOLOR AGUDO
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo multimodal del dolor
    Dado que se maneja dolor postoperatorio
    Cuando se planifica analgesia
    Entonces:
      | Nivel                      | Estrategia |
      | Leve (EVA 1-3)           | Paracetamol + AINE |
      | Moderado (EVA 4-6)        | Multimodal: Paracetamol + AINE + Tramadol |
      | Severo (EVA 7-10)         | Opioides + Multimodal |
      | Dolor neuropático         | Gabapentina/pregabalina |

  # ─────────────────────────────────────────────────────────────
  # 6. COMPLICACIONES ANESTÉSICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de laringoespasmo
    Dado que se sospecha laringoespasmo
    Cuando se evalúa
    Entonces:
      | Paso                       |
      | 1. Ventilación con presión positiva |
      | 2. Succinilcolina 0.5 mg/kg si no responde |
      | 3. Reintubar si necesario |
      | 4. Manejar causa          |

  Escenario: Manejo de broncoespasmo
    Dado que se detecta broncoespasmo
    Cuando se trata
    Entonces:
      | Paso                       |
      | 1. Aumentar FiO2          |
      | 2. Salbutamol nebulizado  |
      | 3. Profundizar anestesia  |
      | 4. Epinefrina si severo   |
      | 5. Considerar laringoespasmo |
