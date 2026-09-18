# language: es
Característica: Registro de Paciente
  Como recepcionista de la maternidad
  Quiero registrar pacientes de forma rápida y completa
  Para que tengan expediente clínico desde su primera consulta

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de recepcionista

  Escenario: Registro exitoso de paciente nuevo
    Dado que la paciente "María García López" acude por primera vez
    Cuando el recepcionista captura los datos obligatorios:
      | Campo                | Valor                    |
      | Nombre               | María                    |
      | Apellido paterno     | García                   |
      | Apellido materno     | López                    |
      | CURP                 | GALM850315MVZRRL04      |
      | Fecha de nacimiento  | 15/03/1985               |
      | Sexo                 | F                        |
      | Tipo de sangre       | O+                       |
      | Teléfono             | 7841234567               |
      | Direccion            | Calle Juárez 15, Centro  |
      | Contacto emergencia  | Juan García              |
      | Teléfono emergencia  | 7841234568               |
    Entonces el sistema crea el expediente con ID generado
    Y el sistema registra la fecha de creación
    Y el sistema muestra confirmación de registro
    Y el sistema asigna estado "Activo" al expediente

  Escenario: Registro con alergias conocidas
    Dado que la paciente "Ana López Torres" tiene alergias conocidas
    Cuando el recepcionista registra la alergia:
      | Alergia      | Severidad | Reacción       |
      | Penicilina   | Alta      | Anafilaxia     |
      | Sulfa        | Media     | Erupción cutánea|
    Entonces el sistema registra las alergias en el expediente
    Y el sistema marca alerta de alergia visible
    Y la alergia aparece en futuras prescripciones

  Escenario: Rechazo de registro sin datos obligatorios
    Dado que el recepcionista intenta registrar un paciente
    Cuando deja el campo "CURP" vacío
    Entonces el sistema muestra error de validación
    Y el sistema indica "CURP es obligatoria"
    Y el sistema no crea el expediente

  Escenario: Detección de CURP duplicada
    Dado que existe un paciente con CURP "GALM850315MVZRRL04"
    Cuando el recepcionista intenta registrar otro paciente con la misma CURP
    Entonces el sistema muestra alerta de duplicado
    Y el sistema sugiere verificar datos
    Y el sistema no crea un segundo expediente

  Escenario: Búsqueda de paciente existente
    Dado que existen pacientes registrados en el sistema
    Cuando el recepcionista busca por nombre "María García"
    Entonces el sistema muestra lista de coincidencias
    Y cada resultado incluye: nombre, CURP, fecha nacimiento
    Y el recepcionista puede seleccionar el expediente correcto

  Escenario: Registro offline
    Dado que el sistema NO tiene conexión a internet
    Cuando el recepcionista registra un paciente nuevo
    Entonces el sistema guarda localmente en SQLite
    Y el sistema asigna estado "Pendiente de sincronización"
    Y cuando se restaure la conexión, el sistema sincroniza automáticamente

  Escenario: Exportación de expediente
    Dado que un paciente tiene expediente completo
    Cuando el médico solicita exportar el expediente
    Entonces el sistema genera archivo PDF con:
      | Sección                    |
      | Ficha de identificación    |
      | Historia clínica           |
      | Consultas anteriores       |
      | Recetas                    |
      | Estudios                   |
      | Consentimientos            |
    Y el archivo incluye firma electrónica del médico
    Y el archivo incluye marca de tiempo
