# language: es
# @id GHE-SEC-ASVS-VERIFY-001
# @type compliance
# @domain security
# @layer governance
# @risk s1
# @owner security-lead
# @status proposed
# @requirement ASVS-VERIFY
# @risk-control CTRL-ASVS-VERIFY
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: Verificación Consolidada de OWASP ASVS
  Como responsable de seguridad del hospital
  Quiero un resumen verificable de cumplimiento ASVS
  Para saber exactamente qué está cubierto y qué falta

  Regla: Cada capítulo ASVS tiene estado verificable

    Escenario: Resumen de cumplimiento
      Dado que se evalúa cumplimiento ASVS
      Cuando se verifica
      Entonces:
        | Capítulo | Nombre | Reglas | Escenarios | Estado |
        | V1 | Arquitectura | 5 | 5 | Propuesto |
        | V2 | Autenticación | 4 | 4 | Propuesto |
        | V3 | Sesiones | 3 | 3 | Propuesto |
        | V4 | Control de Acceso | 5 | 5 | Propuesto |
        | V5 | Validación | 3 | 3 | Propuesto |
        | V6 | Criptografía | 4 | 4 | Propuesto |
        | V7 | Errores/Logging | 4 | 4 | Propuesto |
        | V8 | Datos | 5 | 5 | Propuesto |
        | V9 | Comunicación | 3 | 3 | Propuesto |
        | V10 | Archivos | 3 | 3 | Propuesto |
        | V11 | API | 6 | 6 | Propuesto |
        | V13 | Configuración | 5 | 5 | Propuesto |
        | V14 | Resiliencia | 5 | 5 | Propuesto |
      # @evidence EVID-ASVS-VERIFY-001

  Regla: Ninguna feature cambia a approved sin evidencia

    Escenario: Verificación de evidencia
      Dado que se evalúa una feature ASVS
      Cuando se verifica
      Entonces cada escenario tiene @evidence
      Y cada regla tiene @requirement
      Y no hay decisiones técnicas de implementación
      # @evidence EVID-ASVS-VERIFY-002

  Regla: El nivel de verificación es Nivel 2

    Escenario: Verificación de nivel
      Dado que se evalúa nivel ASVS
      Cuando se verifica
      Entonces GHE apunta a ASVS Nivel 2
      Y aplica a: autenticación, control acceso, cifrado, logging, datos, API
