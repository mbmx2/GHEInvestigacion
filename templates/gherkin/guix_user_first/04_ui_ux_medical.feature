# language: es
# GUIX User First - UI/UX para Software Médico
# DISEÑO ESPECÍFICO PARA ENTORNO CLÍNICO
Característica: UI/UX para Software Médico (GUIX User First - GHE)
  Como diseñador de GHE
  Quiero interfaces optimizadas para el entorno clínico
  Para que médicos y enfermeras trabajen de forma eficiente y segura

  # ─────────────────────────────────────────────────────────────
  # 1. PANTALLAS PRINCIPALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Dashboard principal
    Dado que se diseña dashboard principal
    Cuando el médico inicia sesión
    Entonces ve:
      | Elemento                    | Información         |
      | Pacientes de hoy            | Lista con estado    |
      | Consultas pendientes        | Cola de espera      |
      | Alertas                     | Emergencias, stock bajo |
      | Accesos rápidos             | Nueva consulta, Buscar |
      | Estado de sync              | 🟢/🔴 Conectado     |
    Y puede llegar a cualquier función en <2 clicks

  Escenario: Pantalla de búsqueda de pacientes
    Dado que se diseña pantalla de búsqueda
    Cuando el médico busca paciente
    Entonces:
      | Elemento                    | Comportamiento      |
      | Barra de búsqueda          | Siempre visible arriba |
      | Búsqueda por nombre        | Autocompletado      |
      | Búsqueda por CURP          | Búsqueda exacta     |
      | Resultados                 | Lista con foto, nombre, CURP |
      | Filtrar por                | Fecha, estado, médico |
    Y los resultados aparecen en <500ms

  # ─────────────────────────────────────────────────────────────
  # 2. EXPEDIENTE DEL PACIENTE
  # ─────────────────────────────────────────────────────────────

  Escenario: Pantalla de expediente
    Dado que se diseña pantalla de expediente
    Cuando el médico abre expediente
    Entonces ve:
      | Sección                    | Contenido           |
      | Header                     | Foto, nombre, CURP, edad |
      | Tabs                       | Consultas, Recetas, Estudios, Embarazo |
      | Alertas                    | Alergias, interacciones |
      | Acciones                   | Nueva consulta, Prescribir |
    Y la información crítica es visible sin scroll

  Escenario: Nota SOAP
    Dado que se diseña formulario de nota SOAP
    Cuando el médico crea consulta
    Entonces:
      | Sección SOAP               | Diseño              |
      | Subjective                 | Textarea expansible |
      | Objective                  | Campos de signos vitales con auto-completado |
      | Assessment                 | Búsqueda CIE-10 con autocompletado |
      | Plan                       | Textarea + botón prescribir |
    Y cada sección se puede colapsar
  