# language: es
# @id GHE-SEC-OWASP-A04-001
# @type security
# @domain security
# @layer governance
# @risk s2
# @owner security-lead
# @status proposed
# @requirement OWASP-A04
# @risk-control CTRL-OWASP-A04
# @regulation NOM-024
@domain:security @type:security @risk:s2 @status:proposed
Característica: OWASP A04 - Diseño Inseguro
  Como responsable de seguridad del hospital
  Quiero que el diseño sea seguro por defecto
  Para prevenir vulnerabilidades desde la concepción

  Regla: El diseño incluye amenazas y controles

    Escenario: Threat modeling documentado
      Dado que se diseña un componente
      Cuando se evalúa
      Entonces se documentan amenazas STRIDE y controles para cada una
      # @evidence EVID-ASVS-A04-001

  Regla: Principios de seguridad aplicados

    Escenario: Checklist de diseño seguro
      Dado que se revisa diseño
      Entonces:
        | Principio                  | Estado |
        | Seguridad por defecto     | ✅      |
        | Mínimo privilegio         | ✅      |
        | Defensa en profundidad    | ✅      |
        | Separación de responsabilidades | ✅ |
        | Fail securely             | ✅      |
      # @evidence EVID-ASVS-A04-002

  Regla: No se usan prácticas inseguras

    Escenario: Anti-patrones detectados
      Dado que se revisa diseño
      Entonces NO se permite:
        | Práctica insegura          |
        | Almacenar passwords en texto plano |
        | Sin validación de entrada |
        | Sin cifrado de datos sensibles |
        | Conexiones directas a BD desde UI |
