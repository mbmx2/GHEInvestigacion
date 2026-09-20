# language: es
Característica: Control Prenatal
@status:proposed
@type:acceptance
@domain:maternity
  Como médico de la maternidad
  Quiero dar seguimiento a mujeres embarazadas
  Para detectar complicaciones a tiempo

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de médico
    Y que "María García" tiene embarazo activo

  Escenario: Primer control prenatal
    Dado que "María García" acude por primera vez en embarazo
    Cuando registra datos iniciales
      | Campo                    | Valor       |
      | Fecha última regla       | 01/06/2024  |
      | Presión arterial         | 110/70      |
      | Peso                     | 65 kg       |
      | Talla                    | 1.62 m      |
      | Edema                    | Ninguno     |
      | Proteinuria              | Negativa    |
    Entonces el sistema:
      | Acción                          | Resultado         |
      | Calcular FPP                   | 08/03/2025        |
      | Clasificar riesgo              | Bajo              |
      | Agendar próximo control         | 4 semanas         |
      | Generar lista de estudios       | Automática        |

  Escenario: Control de seguimiento
    Dado que paciente tiene 4 controles previos
    Cuando médico abre expediente para control 5
    Entonces el sistema muestra:
      | Información              | Fuente              |
      | Historial signos vitales | Controles previos   |
      | Curva de peso            | Gráfica automática  |
      | Evolución de PA          | Gráfica automática  |
      | Altura uterina esperada  | Tabla crecimiento   |

  Escenario: Detección de preeclampsia
    Dado que paciente tiene 32 semanas
    Cuando registra PA 145/95 + proteinuria ++ + edema moderado
    Entonces el sistema genera ALERTA de preeclampsia:
      | Acción                   | Prioridad |
      | Solicitar uricemia       | Urgente   |
      | Solicitar biometría      | Urgente   |
      | Considerar referencia    | Alta      |
    Y registra alerta en expediente y UI (rojo)

  Escenario: Detección de anemia
    Dado que Hb de paciente es 9.5 g/dL
    Entonces el sistema clasifica como "Anemia leve"
    Y sugiere suplementación de hierro
    Y agenda control de Hb en 4 semanas

  Escenario: Control prenatal rápido
    Dado que paciente acude a control rutinario
    Cuando registra signos vitales
      | Campo                    | Valor       |
      | Presión arterial         | 120/75      |
      | Peso                     | 70 kg       |
      | Altura uterina           | 28 cm       |
      | Frecuencia cardíaca fetal| 145 lpm     |
    Entonces el sistema:
      | Acción                          |
      | Registrar control (<2 min)      |
      | Actualizar edad gestacional     |
      | Agendar próximo control         |

  Escenario: Detección de CIUR
    Dado que paciente tiene 36 semanas con AU de 26 cm
    Entonces el sistema alerta sobre posible CIUR
    Y sugiere ultrasonido obstétrico
    Y clasifica riesgo como "Alto"

  Escenario: Resumen para referencia
    Dado que paciente requiere referencia
    Cuando médico genera nota
    Entonces el sistema exporta:
      | Sección                   |
      | Resumen clínico          |
      | Signos vitales históricos|
      | Diagnósticos CIE-10      |
      | Tratamientos previos     |
      | Estudios                 |
    Y genera PDF con membrete y firma
