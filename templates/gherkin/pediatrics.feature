# language: es
Característica: Atención Pediátrica
@status:proposed
@type:acceptance
@domain:pediatrics
  Como pediatra
  Quiero seguimiento completo de crecimiento y desarrollo
  Para prevenir enfermedades y detectar problemas a tiempo

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de médico

  Escenario: Control a los 30 días
    Dado que bebé acude a control a los 30 días
    Cuando médico evalúa
    Entonces registra:
      | Campo              | Valor              |
      | Peso               | 4.2 kg             |
      | Talla              | 54 cm              |
      | Perímetro cefálico  | 37 cm              |
      | Alimentación       | Lactancia exclusiva |
    Y calcula percentiles: peso 50, talla 50, PC 50 → Normal
    Y agenda próximo control: 2 meses

  Escenario: Esquema de vacunación
    Dado que paciente tiene 6 meses
    Cuando médico revisa esquema vacunal
    Entonces sistema muestra vacunas aplicadas y pendientes
    Y genera orden para pendientes
    Y registra vacuna aplicada con lote, caducidad y sitio

  Escenario: Curva de crecimiento
    Dado que paciente tiene múltiples controles
    Cuando médico abre expediente
    Entonces muestra gráficas contra curvas OMS (percentiles 3-97)
    Y resalta valores fuera de rango

  Escenario: Retraso del desarrollo
    Dado que paciente de 18 meses no dice 3-5 palabras
    Cuando médico evalúa hitos
    Entonces alerta: "Retraso en lenguaje expresivo"
    Y sugiere: "Referencia a estimulación del desarrollo"

  Escenario: IRA en niño de 3 años
    Dado que paciente de 3 años acude con fiebre 38.5°C + tos productiva
    Cuando médico evalúa SpO2 95%, FR 28, sin sibilancias
    Entonces clasifica: "IRA sin neumonía"
    Y sugiere manejo sintomático: paracetamol 15mg/kg c/6h + ambroxol 7.5mg c/12h
    Y agenda seguimiento: 48-72 horas

  Escenario: Control nutricional (8 meses)
    Dado que paciente de 8 meses acude a control
    Cuando médico evalúa peso 8.2kg, talla 70cm, alimentación complementaria
    Entonces evalúa: peso/edad normal, talla/edad normal
    Y sugiere plan de alimentación según edad

  Escenario: Sospecha de maltrato infantil
    Dado que paciente acude con lesiones incompatibles con historia clínica
    Cuando médico explora
    Entonces:
      | Hallazgo                  |
      | Hematomas en diferentes etapas |
      | Miedo a los padres        |
    Y genera ALERTA de maltrato
    Y notifica a servicio social
    Y registra obligación de reporte a autoridades

  Escenario: Emergencia respiratoria (4 meses)
    Dado que bebé de 4 meses llega con SpO2 88%, FR 60, aleteo nasal
    Cuando médico evalúa
    Entonces clasifica: "Emergencia respiratoria"
    Y genera orden inmediata: oxígeno, nebulización salbutamol, monitoreo, labs urgentes
    Y alerta al pediatra de guardia
  