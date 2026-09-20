# language: es
Característica: DevSecOps y Seguridad Operativa
  Como ingeniero DevOps del hospital
  Quiero integrar seguridad en CI/CD y operaciones
  Para que cada despliegue sea seguro

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de DevOps

  Escenario: Seguridad en pipeline CI/CD
    Dado que se ejecuta pipeline
    Entonces cada etapa tiene control:
      | Etapa                      | Control             |
      | Pre-commit                | Linting de seguridad|
      | Build                     | SAST               |
      | Post-build                | Dependency check   |
      | Pre-deploy                | DAST (OWASP ZAP)  |
      | Post-deploy               | Monitoreo continuo |

  Escenario: Revisiones de código de seguridad
    Dado que se revisa código
    Entonces se verifica:
      | Criterio                   |
      | Sin SQL injection         |
      | Sin XSS                   |
      | Sin secrets hardcodeados  |
      | Input validado            |
      | Output codificado         |

  Escenario: Seguridad de dependencias
    Dado que se gestiona dependencias
    Entonces:
      | Medida                     | Frecuencia |
      | Escaneo vulnerabilidades  | Semanal    |
      | Actualización parches     | Inmediata si crítico |
      | Lockfile                  | Committeado |

  Escenario: Seguridad de backups
    Dado que se protegen backups
    Entonces:
      | Medida                     |
      | Cifrado AES-256          |
      | Almacenamiento offsite   |
      | Prueba de restauración   |

  Escenario: Capacitación en seguridad
    Dado que se capacita al equipo
    Entonces:
      | Tema                       | Frecuencia |
      | Concientización general   | Anual      |
      | Phishing                  | Trimestral  |
      | Contraseñas seguras       | Anual      |
      | Simulacros de respuesta   | Semestral  |
