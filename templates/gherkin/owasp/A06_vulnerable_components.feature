# language: es
# @id GHE-SEC-OWASP-A06-001
# @type security
# @domain security
# @layer infrastructure
# @risk s2
# @owner security-lead
# @status proposed
# @requirement OWASP-A06
# @risk-control CTRL-OWASP-A06
# @regulation NOM-024
@domain:security @type:security @risk:s2 @status:proposed
Característica: OWASP A06 - Componentes Vulnerables
  Como responsable de seguridad del hospital
  Quiero que las dependencias estén actualizadas
  Para que no se exploten vulnerabilidades conocidas

  Regla: Dependencias se escanean semanalmente

    Escenario: Escaneo de vulnerabilidades
      Dado que se ejecuta escaneo de dependencias
      Cuando se verifica
      Entonces no hay vulnerabilidades críticas
      Y lockfile está committeado
      # @evidence EVID-ASVS-A06-001

  Regla: Vulnerabilidades críticas se remedian en 24 horas

    Escenario: Parche urgente
      Dado que se detecta vulnerabilidad crítica
      Cuando se remedia
      Entonces:
        | Paso                       | Tiempo |
        | Evaluar impacto           | <1 hora |
        | Aplicar parche            | <24 horas |
        | Verificar que no rompe    | <1 hora |
      # @evidence EVID-ASVS-A06-002

  Regla: No se usan dependencias abandonadas

    Escenario: Verificación de mantenimiento
      Dado que se evalúa dependencia
      Cuando se verifica
      Entonces:
        | Verificación              | Estado |
        | Último commit <6 meses   | ✅      |
        | Maintainer activo        | ✅      |
        | Licencia compatible      | ✅      |
