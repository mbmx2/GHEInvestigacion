# language: es
Característica: Registro de Paciente
@status:proposed
@type:acceptance
@domain:patient
  Como recepcionista de la maternidad
  Quiero registrar pacientes de forma rápida
  Para que tengan expediente desde su primera consulta

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de recepcionista

  Escenario: Registro exitoso de paciente nuevo
    Dado que "María García López" acude por primera vez
    Cuando captura datos básicos
      | Campo              | Valor                  |
      | Nombre             | María                  |
      | Apellido paterno   | García                 |
      | CURP               | GALM850315MVZRRL04    |
      | Fecha nacimiento   | 15/03/1985             |
      | Sexo               | F                      |
    Entonces el sistema:
      | Acción                          | Resultado         |
      | Crear expediente               | ID generado       |
      | Registrar timestamp            | Automático        |
      | Mostrar confirmación            | Toast visible     |
      | Asignar estado                 | "Activo"          |

  Escenario: Registro con alergias
    Dado que "Ana López" tiene alergias conocidas
    Cuando registra alergia
      | Alergia      | Severidad | Reacción      |
      | Penicilina   | Alta      | Anafilaxia    |
    Entonces el sistema:
      | Acción                          | Estado    |
      | Guardar alergia en expediente   | ✅        |
      | Mostrar alerta visible          | ✅        |
      | Alertar en futuras prescripciones| ✅        |

  Escenario: Rechazo por datos faltantes
    Dado que el recepcionista deja CURP vacía
    Cuando intenta guardar
    Entonces el sistema:
      | Acción                          |
      | Mostrar error de validación    |
      | Indicar "CURP es obligatoria"  |
      | NO crear expediente           |

  Escenario: Detección de CURP duplicada
    Dado que existe paciente con CURP "GALM850315MVZRRL04"
    Cuando se intenta registrar otro con misma CURP
    Entonces el sistema:
      | Acción                          |
      | Mostrar alerta de duplicado   |
      | Sugerir verificar datos       |
      | NO crear segundo expediente   |

  Escenario: Búsqueda de paciente existente
    Dado que hay pacientes registrados
    Cuando se busca por nombre "María García"
    Entonces el sistema muestra coincidencias con:
      | Campo              |
      | Nombre             |
      | CURP               |
      | Fecha nacimiento   |

  Escenario: Registro offline
    Dado que NO hay conexión a internet
    Cuando se registra paciente nuevo
    Entonces el sistema:
      | Acción                          |
      | Guardar localmente en SQLite  |
      | Asignar estado "Pendiente sync"|
      | Sincronizar al recuperar conexión |

  Escenario: Exportación de expediente
    Dado que paciente tiene expediente completo
    Cuando médico solicita exportar
    Entonces el sistema genera PDF con:
      | Sección                    |
      | Ficha de identificación    |
      | Historia clínica           |
      | Consultas y recetas        |
      | Estudios y consentimientos |
    Y PDF incluye firma electrónica y timestamp
