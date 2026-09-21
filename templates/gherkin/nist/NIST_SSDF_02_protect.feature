# language: es
# @id GHE-NIST-SSDF-PS-001
# @type compliance
# @domain security
# @layer development
# @risk s1
# @owner security-lead
# @status proposed
# @requirement NIST-SSDF-PS
# @risk-control CTRL-NIST-SSDF-PS
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: NIST SSDF PS - Proteger el Software
  Como responsable de seguridad del proyecto GHE
  Quiero the software y sus componentes estén protegidos
  Para que no se introduzcan vulnerabilidades durante el desarrollo

  Regla: Las herramientas de desarrollo son seguras

    Escenario: Herramientas verificadas
      Dado que se usan herramientas de desarrollo
      Cuando se verifica
      Entonces: son versiones actualizadas, sin vulnerabilidades conocidas
      # @evidence EVID-NIST-SSDF-PS-001

  Regla: Los repositorios están protegidos

    Escenario: Repositorio seguro
      Dado que se accede al repositorio
      Cuando se verifica
      Entonces:
        | Medida                     |
        | Autenticación requerida   |
        | Branch protection (main)  |
        | Code review obligatorio   |
        | Historial no modificable  |

  Regla: Las dependencias se verifican

    Escenario: Dependencias seguras
      Dado que se usa una dependencia
      Cuando se verifica
      Entonces: sin CVEs conocidos, licencia compatible, mantenida
      # @evidence EVID-NIST-SSDF-PS-002

  Regla: Los datos sensibles se protegen en repositorio

    Escenario: Secrets no en código
      Dado que se revisa código fuente
      Cuando se busca secrets
      Entonces no se encuentra ningún secret hardcodeado
      # @evidence EVID-NIST-SSDF-PS-003

  # @invariante INV-SSDF-PS-001: Ningún secret en código fuente
  Regla: No hay secrets en código

    Escenario: Secret detectado
      Dado que se detecta secret en código fuente
      Cuando se audita
      Entonces se remueve inmediatamente y se rota el secret
      # @evidence EVID-NIST-SSDF-PS-004
