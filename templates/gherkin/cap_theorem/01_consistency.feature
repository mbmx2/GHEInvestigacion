# language: es
# CAP Theorem - Consistencia
@status:proposed
# @evidence:code
@type:acceptance
@domain:general
# CONSISTENCIA: Todos los nodos ven los mismos datos al mismo tiempo
Característica: Consistencia (CAP Theorem - GHE)
  Como arquitecto del proyecto GHE
  Quiero garantizar consistencia de datos en el sistema
  Para que médicos y farmacéuticos vean siempre datos correctos

  # ─────────────────────────────────────────────────────────────
  # 1. CONSISTENCIA EN SQLite LOCAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Consistencia ACID en SQLite
    Dado que se ejecuta operación en SQLite local
    Cuando se guarda dato
    Entonces:
      | Propiedad ACID             | Implementación       |
      | Atomicity                  | Transacciones SQLite |
      | Consistency                | Constraints + triggers |
      | Isolation                  | WAL mode             |
      | Durability                 | fsync after commit   |
    Y el dato es consistente inmediatamente después del commit

  Escenario: Consistencia de integridad referencial
    Dado que se definen foreign keys en SQLite
    Cuando se inserta registro hijo
    Entonces:
      | Verificación               | Estado    |
      | Foreign key existe en padre| ✅         |
      | ON DELETE CASCADE funciona | ✅         |
      | ON UPDATE CASCADE funciona | ✅         |
      | No hay huérfanos           | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 2. CONSISTENCIA ENTRE CAPAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Consistencia Domain → Storage
    Dado que el dominio procesa datos
    Cuando se persiste en SQLite
    Entonces:
      | Verificación               | Estado    |
      | Specs validan antes de guardar | ✅     |
      | Datos conformados correctamente | ✅    |
      | Timestamps consistentes    | ✅         |
      | IDs únicos generados       | ✅ (UUID)  |

  Escenario: Consistencia UI → Domain
    Dado que la UI envía datos
    Cuando el dominio los procesa
    Entonces:
      | Verificación               | Estado    |
      | Input validado en UI       | ✅         |
      | Input re-validado en API   | ✅         |
      | Input re-validado en Domain| ✅         |
      | Triple validación          | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 3. CONSISTENCIA EN CAMPOS MÉDICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Consistencia de signos vitales
    Dado que se registran signos vitales
    Cuando se guarda
    Entonces:
      | Campo                      | Consistencia verificada |
      | PA sistólica > diastólica  | ✅ (spec: fn) |
      | FC entre 30-250            | ✅ (spec: range) |
      | Temperatura 30-45°C        | ✅ (spec: range) |
      | SpO2 entre 0-100%          | ✅ (spec: range) |
      | Peso > 0                   | ✅ (spec: pos?) |

  Escenario: Consistencia de prescripciones
    Dado que se crea prescripción
    Cuando se valida
    Entonces:
      | Verificación               | Estado    |
      | Medicamento no vacío       | ✅         |
      | Cantidad > 0               | ✅         |
      | Vinculada a consulta       | ✅         |
      | Vinculada a paciente       | ✅         |
      | Firma del médico           | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 4. CONSISTENCIA POST-SYNC
  # ─────────────────────────────────────────────────────────────

  Escenario: Consistencia después de sincronización
    Dado que se sincronizan datos con cloud
    Cuando completa sync
    Entonces:
      | Verificación               | Estado    |
      | Datos locales = Datos cloud| ✅         |
      | Hash de integridad coincide| ✅         |
      | Timestamps preservados     | ✅         |
      | No hay duplicados          | ✅         |
      | No hay datos perdidos      | ✅         |

  Escenario: Consistencia durante conflicto
    Dado que hay conflicto de sync
    Cuando se resuelve
    Entonces:
      | Verificación               | Estado    |
      | Conflicto registrado       | ✅         |
      | Resolución determinista    | ✅         |
      | Ambas versiones preservadas| ✅         |
      | Resultado consistente      | ✅         |
  