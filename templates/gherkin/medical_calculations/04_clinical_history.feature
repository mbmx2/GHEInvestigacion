# language: es
# Cálculos Médicos - Historia Clínica
@status:proposed
@type:acceptance
@domain:general
# HISTORIA CLÍNICA: Template completo de historia clínica SOAP
Característica: Historia Clínica Completa (GHE)
  Como médico del proyecto GHE
  Quiero un template de historia clínica completo
  Para documentar consultas de forma estandarizada

  # ─────────────────────────────────────────────────────────────
  # 1. FICHA DE IDENTIFICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Ficha de identificación del paciente
    Dado que se llena ficha de identificación
    Cuando se registra
    Entonces incluye:
      | Campo                      | Obligatorio |
      | Nombre completo            | Sí          |
      | CURP                       | Sí          |
      | Fecha de nacimiento        | Sí          |
      | Edad                       | Calculada   |
      | Sexo                       | Sí          |
      | Estado civil               | No          |
      | Escolaridad                | No          |
      | Ocupación                  | No          |
      | Domicilio                  | Sí          |
      | Teléfono                   | No          |
      | Contacto de emergencia     | Sí          |
      | Grupo étnico               | No          |
      | Religión                   | No          |

  # ─────────────────────────────────────────────────────────────
  # 2. ANTECEDENTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Antecedentes heredofamiliares
    Dado que se registran antecedentes heredofamiliares
    Cuando se llena sección
    Entonces para cada familiar:
      | Campo                      |
      | Parentesco                 |
      | Enfermedad                 |
      | Edad de inicio             |
      | Estado (vivo/fallecido)    |
      | Causa de muerte (si aplica)|

  Escenario: Antecedentes personales patológicos
    Dado que se registran APP
    Cuando se llena sección
    Entonces:
      | Categoría                  |
      | Enfermedades crónicas (HTA, DM, asma) |
      | Enfermedades infecciosas (TBC, VIH)   |
      | Enfermedades quirúrgicas   |
      | Traumatismos               |
      | Transfusiones              |
      | Alergias a medicamentos    |
      | Alergias a alimentos       |
      | Enfermedades de la infancia|
      | Antecedentes ginecológicos (mujeres) |

  Escenario: Antecedentes personales no patológicos
    Dado que se registran APNP
    Cuando se llena sección
    Entonces:
      | Categoría                  |
      | Hábitos tóxicos (tabaco, alcohol, drogas) |
      | Actividad física           |
      | Alimentación               |
      | Sueño                      |
      | Sexualidad                 |
      | Viajes recientes           |
      | Mascotas                   |

  # ─────────────────────────────────────────────────────────────
  # 3. PADRECIMIENTO ACTUAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Padecimiento actual cronológico
    Dado que se documenta padecimiento actual
    Cuando se redacta
    Entonces sigue esquema:
      | Elemento                   | Contenido          |
      | Inicio                     | Desde cuándo       |
      | Localización               | Dónde duele        |
      | Qualidad                   | Cómo duele (punzante, opresivo) |
      | Intensidad                 | 1-10               |
      | Tiempo                     | Constante/intermitente |
      | Modificadores              | Empeora/mejora con... |
      | Síntomas asociados         | Fiebre, náuseas, etc. |
      | Síntomas negativos         | Lo que NO tiene    |

  # ─────────────────────────────────────────────────────────────
  # 4. EXPLORACIÓN FÍSICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Exploración física completa
    Dado que se realiza exploración física
    Cuando se documenta
    Entonces:
      | Sección                   | Parámetros         |
      | Signos vitales            | PA, FC, T, FR, SpO2, Peso, Talla |
      | Habitus exterior          | Estado general, facies, marcha |
      | Piel                      | Coloración, lesiones, turgencia |
      | Cabeza                    | Cabello, cráneo, ojos, oídos, nariz, boca |
      | Cuello                    | Ganglios, tiroides, yugular |
      | Tórax                     | Inspección, palpación, percusión, auscultación |
      | Abdomen                   | Inspección, palpación, ruidos, ascitis |
      | Extremidades              | Edema, pulsos, movilidad |
      | Neurológico               | Glasgow, pupilas, reflejos, fuerza |

  # ─────────────────────────────────────────────────────────────
  # 5. IMPRESIÓN DIAGNÓSTICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Impresión diagnóstica con CIE-10
    Dado que se genera impresión diagnóstica
    Cuando se documenta
    Entonces incluye:
      | Campo                      |
      | Diagnóstico principal (CIE-10) |
      | Diagnósticos secundarios   |
      | Diagnósticos diferenciales|
      | Certeza diagnóstica (presuntivo/definitivo) |

  # ─────────────────────────────────────────────────────────────
  # 6. PLAN DE TRATAMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Plan de tratamiento
    Dado que se documenta plan de tratamiento
    Cuando se genera
    Entonces incluye:
      | Sección                   |
      | Estudios solicitados      |
      | Tratamiento farmacológico |
      | Tratamiento no farmacológico |
      | Educación al paciente     |
      | Criterios de alarma       |
      | Próxima consulta          |
      | Referencia (si aplica)    |
  