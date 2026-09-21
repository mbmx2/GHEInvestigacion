# language: es
# @id GHE-SEC-OWASP-A10-001
# @type security
# @domain security
# @layer infrastructure
# @risk s2
# @owner security-lead
# @status proposed
# @requirement OWASP-A10
# @risk-control CTRL-OWASP-A10
# @regulation NOM-024
@domain:security @type:security @risk:s2 @status:proposed
Característica: OWASP A10 - SSRF (Falsificación de Peticiones del Lado del Servidor)
  Como responsable de seguridad del hospital
  Quiero prevenir SSRF
  Para que el sistema no acceda a recursos internos no deseados

  Regla: URLs internas están bloqueadas

    Escenario: Bloqueo de URLs internas
      Dado que se procesa URL proporcionada por usuario
      Cuando se valida
      Entonces se bloquea:
        | URL bloqueada             |
        | localhost                 |
        | 127.0.0.1                |
        | 10.x.x.x                |
        | 192.168.x.x             |
        | 169.254.169.254 (metadata)|
        | file://                  |
        | gopher://                |
      # @evidence EVID-ASVS-A10-001

  Regla: Solo dominios permitidos en peticiones externas

    Escenario: Allowlist de dominios
      Dado que se envía petición externa
      Cuando se verifica dominio
      Entonces solo se permiten dominios en allowlist
      Y se rechazan todos los demás

  Regla: Network segmentation

    Escenario: Segmentación de red
      Dado que se configura red
      Entonces:
        | Segmento                   | Acceso |
        | Aplicación (GHE)          | Solo DB local |
        | Base de datos             | Solo desde app |
        | Internet                  | Solo HTTPS saliente |
