# language: es
# @id GHE-CDS-DOSE-001
# @type clinical
# @domain clinical
# @layer domain
# @risk s1
# @owner medical-director
# @status proposed
# @requirement REQ-CDS-DOSE
# @risk-control CTRL-CDS-DOSE
# @regulation NOM-004
@domain:clinical @type:clinical @risk:s1 @status:proposed
Característica: CDS por Dosis y Ajuste Renal
  Como médico del hospital
  Quiero que el CDS ajuste dosis según peso, función renal y edad
  Para prevenir sobredosis y toxicidad

  Regla: Dosis se ajusta por peso

    Escenario: Dosis calculada correctamente
      Dado que paciente pesa 45 kg
      Cuando se prescribe ceftriaxona
      Entonces sistema calcula: 45 × 50mg = 2.25g/día
      Y muestra: "Dosis ajustada por peso: 2g/día"

    Escenario: Dosis excede máximo
      Dado que paciente pesa 35 kg
      Cuando se prescribe dosis para 70 kg
      Entonces sistema BLOQUEA
      Y muestra: "Dosis excede máximo seguro para este peso"

  Regla: Dosis se ajusta por función renal

    Escenario: Ajuste por clearence de creatinina
      Dado que paciente tiene CrCl de 30 mL/min
      Cuando se prescribe antibiótico renal
      Entonces sistema ajusta dosis
      Y muestra: "Dosis reducida por función renal (CrCl: 30)"

  Regla: Dosis se ajusta por edad gestacional

    Escenario: Dosis en neonato prematuro
      Dado que neonato tiene 32 semanas de gestación
      Cuando se prescribe medicamento
      Entonces sistema ajusta según edad gestacional
      Y muestra: "Dosis ajustada para prematuro de 32 sem"
