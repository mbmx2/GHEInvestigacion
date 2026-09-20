# language: es
# Accesibilidad - Prácticas Específicas para Software Médico
@status:proposed
@type:acceptance
@domain:accessibility
# ACCESIBILIDAD CLÍNICA: Adaptaciones para entorno médico
Característica: Accesibilidad en Software Médico (GHE)
  Como desarrollador de GHE
  Quiero adaptar la accesibilidad al contexto médico
  Para que médicos, enfermeras y pacientes con discapacidad usen el sistema

  # ─────────────────────────────────────────────────────────────
  # 1. ACCESIBILIDAD PARA MÉDICOS CON DISCAPACIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Médico con discapacidad visual
    Dado que un médico tiene discapacidad visual
    Cuando usa el sistema
    Entonces:
      | Necesidad                   | Adaptación           |
      | No ver pantalla completa    | Screen reader funcional |
      | Dificultad para leer texto pequeño | Texto redimensionable |
      | No distinguir colores       | Iconos + texto + contraste |
      | Dificultad motora           | Navegación por teclado completa |

  Escenario: Médico con discapacidad motora
    Dado que un médico tiene limitaciones motoras
    Cuando usa el sistema
    Entonces:
      | Necesidad                   | Adaptación           |
      | No puede usar mouse         | 100% funcional con teclado |
      | Movimientos imprecisos      | Targets grandes (44x44px) |
      | Fatiga muscular             | Atajos de teclado disponibles |
      | Uso de dispositivo apuntador| Compatibilidad con switch |

  Escenario: Médico con discapacidad auditiva
    Dado que un médico tiene discapacidad auditiva
    Cuando usa el sistema
    Entonces:
      | Necesidad                   | Adaptación           |
      | No escuchar alertas sonoras | Alertas visuales     |
      | No escuchar notificaciones  | Toast con texto      |
      | Comunicación con pacientes  | Soporte de texto     |

  # ─────────────────────────────────────────────────────────────
  # 2. ACCESIBILIDAD PARA PACIENTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Paciente con baja alfabetización
    Dado que un paciente tiene baja alfabetización
    Cuando interactúa con el sistema (futuro: portal paciente)
    Entonces:
      | Necesidad                   | Adaptación           |
      | Dificultad para leer texto largo | Iconos + imágenes |
      | Confusión con términos      | Lenguaje simple      |
      | Dificultad con formularios  | Guias paso a paso    |
      | Necesita confirmación       | Resúmenes visuales   |

  Escenario: Paciente mayor de edad
    Dado que un paciente es adulto mayor
    Cuando interactúa con el sistema
    Entonces:
      | Necesidad                   | Adaptación           |
      | Visión reducida             | Texto grande (18px+) |
      | Audición reducida           | Alertas visuales     |
      | Motricidad reducida         | Targets grandes      |
      | Memoria reducida            | Confirmaciones       |

  # ─────────────────────────────────────────────────────────────
  # 3. ACCESIBILIDAD EN EMERGENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Emergencia con paciente inconsciente
    Dado que hay emergencia con paciente inconsciente
    Cuando el médico necesita acceder rápido
    Entonces:
      | Necesidad                   | Adaptación           |
      | Acceso rápido a expediente | Botón de emergencia  |
      | Información crítica visible | Alergias, medicamentos, antecedentes |
      | Sin multiples pasos         | Acceso directo       |
      | Sin login complejo          | Login rápido (PIN)   |

  Escenario: Emergencia con多语言 (múltiples idiomas)
    Dado que el paciente habla lengua indígena
    Cuando necesita atención
    Entonces:
      | Necesidad                   | Adaptación           |
      | No habla español            | Intérprete + sistema en español |
      | Dificultad para comunicar síntomas | Formulario con imágenes |
      | Información de alergias     | Iconos universales   |

  # ─────────────────────────────────────────────────────────────
  # 4. ACCESIBILIDAD EN CONTEXTO RURAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Computadora compartida
    Dado que la maternidad tiene pocas computadoras
    Cuando múltiples usuarios las usan
    Entonces:
      | Necesidad                   | Adaptación           |
      | Cambio rápido de usuario   | Logout rápido        |
      | Datos de otro usuario       | No se mezclan        |
      | Sesión automática           | Timeout corto (5 min)|

  Escenario: Pantalla pequeña
    Dado que se usa en pantalla pequeña
    Cuando se visualiza
    Entonces:
      | Necesidad                   | Adaptación           |
      | Espacio limitado            | Layout responsive    |
      | Texto grande necesario      | Zoom funcional       |
      | Navegación simple           | Menú colapsable      |

  # ─────────────────────────────────────────────────────────────
  # 5. HERRAMIENTAS DE VERIFICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Herramientas de testing de accesibilidad
    Dado que se ejecutan herramientas de testing
    Cuando se verifica
    Entonces:
      | Herramienta                | Qué verifica         |
      | axe-core                   | Violaciones WCAG     |
      | Lighthouse                 | Score de accesibilidad |
      | WAVE                       | Errores de accesibilidad |
      | NVDA                       | Compatibilidad SR    |
      | VoiceOver                  | Compatibilidad SR    |
      | Colour Contrast Analyser  | Ratio de contraste   |

  Escenario: Checklist de accesibilidad
    Dado que se completa checklist
    Cuando se verifica antes de release
    Entonces:
      | Criterio                   | Estado    |
      | HTML válido                | ✅         |
      | Contraste >=4.5:1          | ✅         |
      | Navegación por teclado     | ✅         |
      | Labels en todos los inputs | ✅         |
      | ARIA correcto              | ✅         |
      | Screen reader funcional   | ✅         |
      | Focus management           | ✅         |
      | Skip links                 | ✅         |
      | Sin traps de teclado       | ✅         |
      | Texto redimensionable 200% | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 6. MÉTRICAS DE ACCESIBILIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de accesibilidad
    Dado que se miden métricas
    Cuando se evalúa
    Entonces:
      | Métrica                    | Objetivo     |
      | Score Lighthouse           | >90          |
      | Violaciones axe-core       | 0 críticas  |
      | WCAG level                 | AA           |
      | Screen reader compatible   | 100%         |
      | Keyboard navigable         | 100%         |
      | Touch targets >=44px       | 100%         |
      | Text redimensionable 200%  | 100%         |
  