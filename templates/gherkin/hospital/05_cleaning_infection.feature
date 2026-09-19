# language: es
# Limpieza y Desinfección Hospitalaria
Característica: Gestión de Limpieza (GHE Hospital)
  Como coordinador de limpieza del hospital
  Quiero workflows para limpieza y desinfección
  Para prevenir infecciones nosocomiales

  # ─────────────────────────────────────────────────────────────
  # 1. LIMPIEZA DE ÁREAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de áreas por riesgo
    Dado que se clasifican áreas del hospital
    Cuando se evalúa
    Entonces:
      | Área                      | Nivel riesgo | Frecuencia limpieza |
      | Quirófano                 | Crítico      | Entre cirugías + 2 veces/día |
      | Sala de procedures        | Alto         | Diaria + entre procedimientos |
      | Habitaciones pacientes    | Alto         | Diaria + al egreso |
      | Consultorios              | Medio        | Diaria |
      | Recepción                 | Bajo         | 2 veces/día |
      | Cocina                    | Alto         | Continua |
      | Baños públicos            | Alto         | Cada 4 horas |

  Escenario: Protocolo de limpieza de quirófano
    Dado que se limpia quirófano
    Cuando se ejecuta protocolo
    Entonces:
      | Paso                       |
      | 1. Retiro de material sucio |
      | 2. Limpieza con detergente  |
      | 3. Enjuague con agua        |
      | 4. Desinfección con amonio cuaternario |
      | 5. Tiempo de contacto       |
      | 6. Secado al aire           |
      | 7. Verificación visual      |

  # ─────────────────────────────────────────────────────────────
  # 2. DESINFECCIÓN DE EQUIPO
  # ─────────────────────────────────────────────────────────────

  Escenario: Niveles de desinfección
    Dado que se clasifican equipos
    Cuando se evalúa
    Entonces:
      | Nivel                     | Equipos |
      | Alto nivel (esterilización) | Instrumental quirúrgico, catéteres |
      | Nivel intermedio         | Termómetros, oxímetros, estetoscopios |
      | Nivel bajo               | Camas, mesas, sillas |
      | Limpieza simple          | Pisos, paredes, ventanas |

  Escenario: Registro de desinfección
    Dado que se realiza desinfección
    Cuando se registra
    Entonces incluye:
      | Campo                     |
      | Fecha y hora             |
      | Área/equipo              |
      | Nivel de desinfección    |
      | producto utilizado       |
      | Personal responsable    |
      | Verificación            |

  # ─────────────────────────────────────────────────────────────
  # 3. MANEJO DE RESIDUOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de residuos hospitalarios
    Dado que se clasifican residuos
    Cuando se evalúa
    Entonces:
      | Tipo                      | Color contenedor | Ejemplo |
      | Infecciosos               | Rojo             | Gasas, guantes |
      | Cortopunzantes            | Naranja          | Agujas, bisturí |
      | Quirúrgicos               | Amarillo         | Tejidos, órganos |
      | Farmacéuticos             | Gris             | Medicamentos vencidos |
      | Químicos                  | Verde            | Reactivos de lab |
      | Comunes                    | Negro            | Papel, cartón |

  Escenario: Registro de manejo de residuos
    Dado que se gestiona residuos
    Cuando se registra
    Entonces:
      | Campo                     |
      | Tipo de residuo          |
      | Cantidad                 |
      | Contenedor              |
      | Personal responsable    |
      | Hora de retiro          |
      | Empresa recolectora     |

  # ─────────────────────────────────────────────────────────────
  # 4. LAVANDERÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso de lavandería hospitalaria
    Dado que se gestiona ropa hospitalaria
    Cuando se procesa
    Entonces el sistema guía:
      | Paso                       |
      | 1. Recepción de ropa sucia |
      | 2. Clasificación por tipo  |
      | 3. Lavado con desinfección |
      | 4. Secado                   |
      | 5. Pliegue/empaque         |
      | 6. Almacenamiento limpio   |
      | 7. Distribución a unidades |

  Escenario: Tipos de ropa hospitalaria
    Dado que se clasifica ropa
    Cuando se evalúa
    Entonces:
      | Tipo                      | Frecuencia lavado |
      | Sabanitas de cama         | Cada cambio paciente |
      | Batas de pacientes        | Cada cambio paciente |
      | Uniformes de personal     | Diario             |
      | Campos quirúrgicos        | Entre cirugías     |
      | Ropa de quirófano         | Entre cirugías     |

  # ─────────────────────────────────────────────────────────────
  # 5. MANTENIMIENTO PREVENTIVO
  # ─────────────────────────────────────────────────────────────

  Escenario: Calendario de mantenimiento de limpieza
    Dado que se planifica mantenimiento
    Cuando se programa
    Entonces:
      | Actividad                  | Frecuencia  |
      | Limpieza profunda áreas críticas | Semanal |
      | Desinfección de tanques de agua | Mensual |
      | Calibración de desinfectantes | Mensual |
      | Capacitación de personal  | Trimestral  |
      | Auditoría de limpieza     | Mensual     |
