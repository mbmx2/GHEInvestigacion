# language: es
# Mantenimiento - Equipos Específicos
@status:proposed
@type:acceptance
@domain:hospital
Característica: Mantenimiento de Equipos (GHE Hospital)
  Como ingeniero de mantenimiento del hospital
  Quiero workflows para mantenimiento de equipos específicos
  Para que todos los equipos funcionen correctamente

  # ─────────────────────────────────────────────────────────────
  # 1. EQUIPO DE QUIRÓFANO
  # ─────────────────────────────────────────────────────────────

  Escenario: Mantenimiento de equipo de quirófano
    Dado que se mantiene equipo de quirófano
    Cuando se ejecuta
    Entonces:
      | Equipo                      | Frecuencia |
      | Mesa quirúrgica            | Semanal    |
      | Torre de laparoscopia      | Semanal    |
      |电刀 (electrobisturí)      | Diario     |
      | Cauterio                   | Diario     |
      | Iluminación quirúrgica     | Mensual    |
      | Sistemas de aspiración     | Semanal    |

  # ─────────────────────────────────────────────────────────────
  # 2. EQUIPO DE MONITOREO
  # ─────────────────────────────────────────────────────────────

  Escenario: Mantenimiento de monitores de signos vitales
    Dado que se mantiene monitores
    Cuando se verifica
    Entonces:
      | Verificación               | Frecuencia |
      | Calibración de SpO2        | Mensual    |
      | Calibración de PA          | Mensual    |
      | Funcionamiento de alarmas  | Semanal    |
      | Baterías                   | Mensual    |
      | Limpieza                   | Diaria     |

  # ─────────────────────────────────────────────────────────────
  # 3. EQUIPO DE ANESTESIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Mantenimiento de vaporizador
    Dado que se mantiene vaporizador de anestesia
    Cuando se verifica
    Entonces:
      | Verificación               | Frecuencia |
      | Concentración de vapor    | Mensual    |
      | Fugas                     | Mensual    |
      | Limpieza de circuito      | Entre pacientes |
      | Calibración               | Semestral   |

  # ─────────────────────────────────────────────────────────────
  # 4. EQUIPO DE LABORATORIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Mantenimiento de analizador
    Dado que se mantiene analizador automático
    Cuando se verifica
    Entonces:
      | Verificación               | Frecuencia |
      | Calibración               | Diaria     |
      | Control de calidad        | Diaria     |
      | Limpieza de sonda         | Semanal    |
      | Calibración completa      | Mensual    |
      | Mantenimiento preventivo  | Semestral  |

  # ─────────────────────────────────────────────────────────────
  # 5. SISTEMAS ELÉCTRICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Mantenimiento eléctrico
    Dado que se mantiene sistema eléctrico
    Cuando se verifica
    Entonces:
      | Verificación               | Frecuencia |
      | Generador de emergencia   | Mensual (prueba) |
      | UPS                       | Mensual    |
      | Tablero eléctrico         | Mensual    |
      | Tierra                    | Semestral  |
      | Iluminación de emergencia | Mensual    |

  Escenario: Prueba de generador
    Dado que se prueba generador de emergencia
    Cuando se ejecuta
    Entonces:
      | Paso                       |
      | Simular apagón            |
      | Verificar arranque automático |
      | Verificar carga           |
      | Mantener 30 minutos       |
      | Verificar estabilidad     |
      | Restablecer corriente normal |

  # ─────────────────────────────────────────────────────────────
  # 6. GAS MEDICINAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Mantenimiento de red de gas medicinal
    Dado que se mantiene red de gas
    Cuando se verifica
    Entonces:
      | Verificación               | Frecuencia |
      | Presión de oxígeno        | Diaria     |
      | Presión de nitrógeno      | Diaria     |
      | Presión de óxido nitroso  | Diaria     |
      | Fugas                     | Mensual    |
      | Válvulas                  | Mensual    |
      | Alarmas                   | Semanal    |

  # ─────────────────────────────────────────────────────────────
  # 7. SISTEMAS DE AGUA
  # ─────────────────────────────────────────────────────────────

  Escenario: Mantenimiento de agua
    Dado que se mantiene sistema de agua
    Cuando se verifica
    Entonces:
      | Verificación               | Frecuencia |
      | Calidad de agua potable   | Mensual    |
      | Temperatura agua caliente | Semanal    |
      | Tanques de almacenamiento | Trimestral  |
      | Calentadores              | Semestral   |
      | Tuberías                  | Anual       |

  # ─────────────────────────────────────────────────────────────
  # 8. SISTEMAS DE AIRE ACONDICIONADO
  # ─────────────────────────────────────────────────────────────

  Escenario: Mantenimiento de aire acondicionado
    Dado que se mantiene sistema de climatización
    Cuando se verifica
    Entonces:
      | Verificación               | Frecuencia |
      | Filtros                   | Mensual    |
      | Gas refrigerante          | Mensual    |
      | Temperatura               | Diaria     |
      | Mantenimiento preventivo  | Semestral  |
      | Limpieza de ductos        | Anual       |

  # ─────────────────────────────────────────────────────────────
  # 9. SISTEMAS DE SEGURIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Mantenimiento de seguridad
    Dado que se mantiene sistema de seguridad
    Cuando se verifica
    Entonces:
      | Verificación               | Frecuencia |
      | Cámaras de vigilancia     | Semanal    |
      | Extintores                | Semestral  |
      | Sistema de alarmas        | Mensual    |
      | Iluminación de emergencia | Mensual    |
      | Accesos controlados       | Mensual    |

  # ─────────────────────────────────────────────────────────────
  # 10. REPORTES DE MANTENIMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Reporte mensual de mantenimiento
    Dado que se genera reporte mensual
    Cuando se consulta
    Entonces incluye:
      | Métrica                    |
      | Mantenimientos preventivos ejecutados |
      | Mantenimientos correctivos ejecutados |
      | Tiempo promedio de respuesta |
      | Equipos fuera de servicio |
      | Costo del mes            |
      | Mantenimientos pendientes |
