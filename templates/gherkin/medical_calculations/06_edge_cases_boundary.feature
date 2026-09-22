# language: es
# @id GHE-MEDCALC-006
# @type business-rule
# @domain medical-calculations
# @layer clinical
# @risk s1
# @owner clinical-informatics
# @status proposed
# @requirement REQ-MEDCALC-006
# @risk-control CTRL-MEDCALC-006
# @regulation NOM-024
@domain:medical_calculations @type:business-rule @risk:s1 @status:proposed
Característica: Edge Cases y Valores Límite en Cálculos Médicos
  Como informático clínico
  Quiero manejar correctamente casos límite en cálculos
  Para evitar errores críticos en decisiones clínicas

  Regla: IMC con valores extremos

    Escenario: IMC con peso extremadamente bajo
      Dado que paciente tiene peso 30 kg y estatura 1.70 m
      Cuando se calcula IMC
      Entonces resultado = 10.38
      Y se clasifica como "delgadez severa"
      Y sistema sugiere evaluación nutricional urgente

    Escenario: IMC con peso extremadamente alto
      Dado que paciente tiene peso 250 kg y estatura 1.65 m
      Cuando se calcula IMC
      Entonces resultado = 91.83
      Y se clasifica como "obesidad mórbida"
      Y sistema sugiere cirugía bariátrica

    Escenario: Estatura cero o negativa
      Dado que se ingresa estatura 0 cm
      Cuando se intenta calcular IMC
      Entonces sistema rechaza el cálculo
      Y muestra error: "Estatura inválida"
      # @invariante INV-MEDCALC-IMC-001

  Regla: Tasa de filtrado glomerular

    Escenario: TFG con creatinina muy alta
      Dado que paciente tiene creatinina 12 mg/dL, edad 70, hombre
      Cuando se calcula TFG (CKD-EPI)
      Entonces resultado <15 mL/min
      Y se clasifica como "enfermedad renal etapa 5"
      Y sistema sugiere diálisis

    Escenario: TFG en paciente pediátrico
      Dado que paciente tiene 5 años, creatinina 0.3
      Cuando se calcula TFG con fórmula de adulto
      Entonces sistema advierte: "Usar fórmula pediátrica Schwartz"
      Y recalcula automáticamente

    Escenario: Fórmula de Cockcroft-Gault con peso ideal
      Dado que paciente obeso peso 150 kg, estatura 160 cm
      Cuando se calcula clearance de creatinina
      Entonces usa peso ajustado (no peso real)
      Y documenta fórmula utilizada

  Regla: Glasgow Coma Scale

    Escenario: GCS mínimo (3)
      Dado que paciente no abre ojos, no verbaliza, no motoriza
      Cuando se evalúa GCS
      Entonces resultado = 3
      Y sistema activa alerta de coma
      Y sugiere intubación orotraqueal

    Escenario: GCS máximo (15)
      Dado que paciente alerta, orientado, obedece órdenes
      Cuando se evalúa GCS
      Entonces resultado = 15
      Y sistema registra "neurológicamente intacto"

    Escenario: GCS incompleto
      Dado que paciente intubado (no puede evaluar verbal)
      Cuando se evalúa GCS
      Entonces sistema registra GCS con asterisco: "VT1"
      Y usa componente motor + ocular solamente

  Regla: Score de APACHE II

    Escenario: APACHE con laboratorios faltantes
      Dado que paciente ingresa a UCI sin gasometría
      Cuando se calcula APACHE II
      Entonces sistema marca campos faltantes
      Y calcula con disponibilidad parcial
      Y advierte: "Cálculo incompleto — resultados pueden subestimar"

  Regla: Cálculos con valores fuera de rango fisiológico

    Escenario: Temperatura incompatible con vida
      Dado que paciente tiene temperatura 25°C
      Cuando se evalúa
      Entonces sistema genera alerta crítica
      Y sugiere: "Verificar medición — valor incompatible con vida"

    Escenario: Frecuencia cardíaca negativa
      Dado que se ingresa FC -10 lpm
      Cuando se valida
      Entonces sistema rechaza el valor
      Y muestra: "Frecuencia cardíaca inválida"
