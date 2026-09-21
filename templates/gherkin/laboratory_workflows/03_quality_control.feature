# language: es
# @id GHE-LAB-QC-001
# @type clinical
# @domain laboratory
# @layer infrastructure
# @risk s2
# @owner lab-director
# @status proposed
# @requirement REQ-LAB-QC
# @risk-control CTRL-LAB-QC
# @regulation NOM-024
@domain:laboratory @type:clinical @risk:s2 @status:proposed
Característica: Control de Calidad de Laboratorio
  Como director de laboratorio
  Quiero control de calidad completo
  Para que cada resultado sea preciso y confiable

  Regla: Control de calidad interno se ejecuta diariamente

    Escenario: QC diario
      Dado que se ejecuta QC diario
      Cuando se evalúa
      Entonces se verifica contra valores medios ±2 DS

  Regla: Control de calidad externo

    Escenario: Participación en ECA
      Dado que se participa en programa de ECA
      Cuando se evalúa
      Entonces resultados dentro de rango aceptable

  Regla: Calibración de equipos

    Escenario: Calibración verificada
      Dado que se calibra equipo
      Cuando se verifica
      Entonces: fecha de calibración vigente, certificado disponible

  Regla: Trazabilidad de muestras

    Escenario: Traza completa
      Dado que se sigue una muestra
      Cuando se consulta trazabilidad
      Entonces: quién la tomó, cuándo, cómo se procesó, quién liberó
