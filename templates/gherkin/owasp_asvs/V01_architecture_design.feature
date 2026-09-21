# language: es
# @id GHE-ASVS-V1-001
# @type compliance
# @domain security
# @layer governance
# @risk s1
# @owner security-lead
# @status proposed
# @requirement ASVS-V1
# @risk-control CTRL-ASVS-V1
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: V1 - Arquitectura, Diseño y Modelado de Amenazas
  Como responsable de seguridad del proyecto GHE
  Quiero que la arquitectura del sistema sea segura por diseño
  Para prevenir vulnerabilidades desde la concepción

  Regla: V1.1 - El software tiene un proceso de diseño de seguridad documentado

    Escenario: Documentación de diseño de seguridad
      Dado que se diseña un componente del sistema
      Cuando se documenta
      Entonces se incluye:
        | Elemento                    |
        | Principios de seguridad    |
        | Controles de seguridad     |
        | Decisiones de diseño       |
        | Alternativas evaluadas    |
      # @evidence EVID-ASVS-V1-001

  Regla: V1.2 - Se evalúan amenazas en cada componente

    Escenario: Threat modeling por componente
      Dado que se diseña un componente
      Cuando se evalúan amenazas
      Entonces se identifican:
        | Amenaza                     | Se evalúa |
        | Spoofing                   | Sí        |
        | Tampering                  | Sí        |
        | Repudiation                | Sí        |
        | Information Disclosure     | Sí        |
        | Denial of Service          | Sí        |
        | Elevation of Privilege     | Sí        |
      # @evidence EVID-ASVS-V1-002

  Regla: V1.3 - Se verifican controles de seguridad en diseño

    Escenario: Verificación de controles
      Dado que se diseña un componente
      Cuando se verifica
      Entonces se confirma que cada amenaza tiene un control
      # @evidence EVID-ASVS-V1-003

  Regla: V1.4 - Se separan componentes por confianza

    Escenario: Segregación por nivel de confianza
      Dado que se separan componentes
      Cuando se verifica
      Entonces:
        | Nivel de confianza         | Componentes |
        | Alto (dominio)             | Lógica de negocio, specs |
        | Medio (aplicación)         | APIs, validación |
        | Bajo (infraestructura)     | SQLite, sync, archivos |
      Y no hay dependencias de bajo a alto nivel

  Regla: V1.5 - Se evalúa seguridad del diseño

    Escenario: Checklist de diseño seguro
      Dado que se revisa diseño
      Cuando se verifica
      Entonces se confirma:
        | Criterio                   | Estado |
        | Principios de seguridad    | ✅      |
        | Separación de componentes  | ✅      |
        | Validación en todas las capas | ✅   |
        | Cifrado de datos sensibles | ✅      |
        | Auditoría                  | ✅      |
