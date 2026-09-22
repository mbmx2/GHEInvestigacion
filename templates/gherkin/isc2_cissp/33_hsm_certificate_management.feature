# language: es
# @id GHE-CISSP-033
# @type business-rule
# @domain security
# @layer crypto-hsm
# @risk s1
# @owner crypto-engineer
# @status proposed
# @requirement REQ-CISSP-033
# @risk-control CTRL-CISSP-033
# @regulation CISSP-D3 ISC2 NOM-151
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Módulos de Seguridad de Hardware (HSM) y Certificados
  como ingeniero de criptografía
  Quiero HSM y gestión de certificados conforme CISSP
  Para que las operaciones criptográficas más críticas estén protegidas por hardware

  Regla: HSM se usa para operaciones críticas

    Escenario: Operaciones que requieren HSM
      Dado que hospital tiene HSM
      Cuando se realizan operaciones críticas
      Entonces se verifica:
        | Operación                   | Uso del HSM              |
        | Generación de claves maestras| Clave nunca sale del HSM |
        | Firma de recetas médicas    | Firma con HSM            |
        | Cifrado de expedientes      | Clave maestra en HSM     |
        | Autenticación de servidores | Certificados en HSM      |
        | Timestamping               | Firma de timestamp       |

    Escenario: Acceso a HSM
      Dado que personal accede a HSM
      Cuando se autentica
      Entonces se verifica:
        | Elemento                    |
        | Autenticación multifactor   |
        | Split knowledge             |
        | Dual control                |
        | Registro de acceso          |
        | Monitoreo continuo          |

  Regla: Certificados digitales se gestionan

    Escenario: Ciclo de vida de certificados
      Dado que se gestionan certificados digitales
      Cuando se gestiona ciclo de vida
      Entonces se verificar:
        | Fase       | Acción                          |
        | Solicitud  | CSR generado en HSM             |
        | Emisión    | CA confiable                    |
        | Distribución| Instalación segura            |
        | Monitoreo  | Vigilancia de expiración       |
        | Renovación | Automatizada antes de expirar   |
        | Revocación | CRL/OCSP actualizado           |

    Escenario: Certificados por expirar
      Dado que certificado está próximo a expirar
      Cuando se detecta
      Entonces se verifica:
        | Elemento                    |
        | Alerta 30 días antes        |
        | Renovación automática       |
        | Prueba post-renovación      |
        | Comunicación si aplica      |

  Regla: PKI se gestiona

    Escenario: Infraestructura PKI
      Dado que hospital usa PKI
      Cuando se gestiona
      Entonces se verifica:
        | Elemento                    |
        | CA raíz offline             |
        | CA subordinada operativa    |
        | CRL actualizada             |
        | OCSP responder activo       |
        | Política de certificados    |
        | Auditoría de PKI            |

  Regla: Cadenas de confianza se verifican

    Escenario: Verificación de cadena
      Dado que se verifica certificado
      Cuando se valida cadena
      Entonces se verifica:
        | Elemento                    |
        | Certificado raíz confiable  |
        | Cadena completa             |
        | Sin certificados revocados  |
        | Firma válida en cada nodo   |
        | Nombre coincide            |
