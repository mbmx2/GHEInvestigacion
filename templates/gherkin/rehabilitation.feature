# language: es
Característica: Rehabilitación y Terapia Física
  Como fisioterapeuta
  Quiero evaluar y tratar pacientes con problemas musculoesqueléticos
  Para restaurar función y mejorar calidad de vida

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de fisioterapeuta

  Escenario: Evaluación inicial de rehabilitación
    Dado que el paciente acude por primera vez a rehabilitación
    Cuando el fisioterapeuta realiza evaluación
    Entonces el sistema registra:
      | Campo                     | Valor              |
      | Diagnóstico               | Fx de rodilla derecha post quirúrgica |
      | Cirugía realizada         | Artroscopia + osteosíntesis |
      | Tiempo post quirúrgico    | 4 semanas          |
      | Dolor (EVA)               | 6/10               |
      | Rango de movimiento       |                    |
      | Flexión                   | 60° (meta: 130°)   |
      | Extensión                 | -15° (meta: 0°)    |
      | Fuerza muscular           |                    |
      | Cuádriceps                | 3/5                |
      | Isquiotibiales            | 4/5                |
      | Marcha                    | Sin carga          |
      | Edema                     | Moderado           |
      | Función (Escala de Lysholm)| 45/100            |
    Y el sistema genera plan de tratamiento:
      | Fase                      | Duración           |
      | Fase 1: Control del dolor y edema | 2 semanas |
      | Fase 2: Rango de movimiento    | 4 semanas   |
      | Fase 3: Fortalecimiento        | 4 semanas   |
      | Fase 4: Retorno a actividad    | 4 semanas   |

  Escenario: Registro de sesión de terapia
    Dado que el paciente acude a sesión de terapia
    Cuando el fisioterapeuta registra la sesión
    Entonces el sistema captura:
      | Intervención              | Detalle            |
      | TENS                      | 20 min, zona anterior|
      | Ultrasonido               | 10 min, 1 MHz      |
      | Ejercicios pasivos        | Flexión/extensión 40 rep |
      | Ejercicios activos asistidos | Sentadillas parciales |
      | Hielo                     | 15 min post-ejercicio |
      | Masaje                    | 10 min, cuádriceps |
    Y el sistema registra respuesta del paciente:
      | Parámetro                  | Valor              |
      | Dolor post-tratamiento     | 4/10               |
      | Rango logrado              | Flexión 70°        |
      | Tolerancia                 | Buena              |
      | Observaciones              | Edema reducido     |

  Escenario: Evaluación de progreso
    Dado que el paciente tiene 6 sesiones de terapia
    Cuando el fisioterapeuta evalúa progreso
    Entonces el sistema muestra comparativa:
      | Parámetro                  | Inicial | Actual | Meta    |
      | Flexión rodilla            | 60°     | 95°    | 130°    |
      | Extensión rodilla          | -15°    | -5°    | 0°      |
      | Fuerza cuádriceps          | 3/5     | 4/5    | 5/5     |
      | Dolor (EVA)                | 6/10    | 3/10   | 0/10    |
      | Edema                      | Moderado| Leve   | Ninguno |
      | Marcha                     | Sin carga | Con bastón | Sin ayudas |
    Y el sistema muestra gráficas de progreso
    Y el sistema evalúa:
      | Criterio                   | Estado             |
      | Progreso adecuado          | Sí                 |
      | Ajuste de plan             | Avanzar a Fase 3   |

  Escenario: Terapia de lenguaje
    Dado que el paciente requiere terapia de lenguaje
    Cuando el terapeuta evalúa
    Entonces el sistema registra:
      | Evaluación                 | Resultado          |
      | Comprensión verbal         | Conservada         |
      | Expresión verbal           | Afasia expresiva   |
      | Articulación               | Disartria leve     |
      | Deglución                  | Alterada           |
      | Lectura                    | Conservada         |
      | Escritura                  | Alterada           |
    Y el sistema genera plan:
      | Objetivo                   | Intervención       |
      | Mejorar expresión verbal   | Ejercicios de denominación |
      | Mejorar articulación       | Ejercicios oromotores |
      | Seguridad en deglución     | Dieta modificada   |

  Escenario: Ergonomía laboral
    Dado que el paciente acude por dolor lumbar laboral
    Cuando el fisioterapeuta evalúa ergonomía
    Entonces el sistema registra:
      | Factor ergonómico          | Evaluación         |
      | Postura de trabajo         | Prolongada sentado |
      | Peso que levanta           | >20 kg frecuente   |
      | Movimientos repetitivos    | Sí                 |
      | Pausas activas             | No realiza         |
      | Altura del escritorio      | Inadecuada         |
      | Silla                      | Sin soporte lumbar |
    Y el sistema genera recomendaciones:
      | Recomendación              |
      | Ajustar altura de silla y escritorio |
      | Realizar pausas cada 45 min |
      | Ejercicios de fortalecimiento lumbar |
      | Técnicas de levantamiento de peso |

  Escenario: Plan de ejercicios domiciliarios
    Dado que el paciente necesita ejercicios en casa
    Cuando el fisioterapeuta genera plan
    Entonces el sistema crea plan detallado:
      | Ejercicio                  | Series | Repeticiones | Frecuencia |
      | Flexión activa de rodilla  | 3      | 15           | 3 veces/día|
      | Extensión de rodilla       | 3      | 15           | 3 veces/día|
      | Elevación de pierna recta  | 3      | 10           | 3 veces/día|
      | Sentadilla parcial         | 3      | 10           | 2 veces/día|
      | Caminata                   | 1      | 30 min       | Diario     |
    Y el sistema genera PDF con ilustraciones
    Y el sistema puede enviar por WhatsApp al paciente
    Y el sistema agenda seguimiento en 2 semanas

  Escenario: Registro de dispositivo de asistencia
    Dado que el paciente requiere dispositivo
    Cuando se prescribe dispositivo
    Entonces el sistema registra:
      | Dispositivo                | Especificación      |
      | Rodillera                  | Articulada, con refuerzo |
      | Bastón                     | Ajustable, 4 puntas |
      | Férula                     | De muñeca, neutral   |
    Y el sistema genera orden de dispositivo
    Y el sistema verifica cobertura
    Y el sistema agenda ajuste del dispositivo
