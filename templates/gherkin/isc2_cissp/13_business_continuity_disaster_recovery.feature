# language: es
# @id GHE-CISSP-013
# @type business-rule
# @domain security
# @layer dr-bc
# @risk s1
# @owner bc-dr-manager
# @status proposed
# @requirement REQ-CISSP-013
# @risk-control CTRL-CISSP-013
# @regulation CISSP-D7 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Continuidad del Negocio y Recuperación ante Desastres
  Como gerente de continuidad
  Quiero BC/DR conforme CISSP Domain 7
  Para que el hospital opere incluso ante desastres

  Regla: BIA se realiza

    Escenario: Business Impact Analysis
      Dado que se realiza BIA
      Cuando se evalúa impacto
      Entonces se verifica:
        | Elemento                    |
        | Procesos críticos identificados|
        | RTO y RPO definidos         |
        | Dependencias mapeadas       |
        | Impacto financiero          |
        | Impacto en pacientes        |
        | Recursos alternativos       |

    Escenario: Clasificación de procesos
      Dado que se clasifican procesos por criticidad
      Cuando se evalúa
      Entonces se establece:
        | Crítico (RTO <1h)           | Prescripción, farmacia   |
        | Esencial (RTO <4h)          | Expedientes, laboratorio |
        | Importante (RTO <24h)       | Reportes, facturación    |
        | Soporte (RTO <72h)          | Investigación, capacitación|

  Regla: Plan de continuidad se crea

    Escenario: Documento BCP
      Dado que se crea Plan de Continuidad del Negocio
      Cuando se documenta
      Entonces incluye:
        | Sección                    |
        | Activación del plan        |
        | Roles y responsabilidades  |
        | Procedimientos de recuperación|
        | Recursos necesarios        |
        | Comunicación de crisis     |
        | Proveedores alternativos   |

  Regla: Plan de recuperación se prueba

    Escenario: Prueba de recuperación
      Dado que plan DR está documentado
      Cuando se ejecuta prueba
      Entonces se verifica:
        | Elemento                    |
        | Backup restaurado           |
        | RTO alcanzado               |
        | Datos íntegros              |
        | Personal ejecuta correctamente|
        | Lecciones documentadas      |

    Escenario: Simulacro de desastre
      Dado que se simula escenario completo
      Cuando se ejecuta simulacro
      Entonces se verifica:
        | Elemento                    |
        | Activación del plan         |
        | Comunicación efectiva       |
        | Recuperación exitosa        |
        | Tiempo real vs RTO          |
        | Áreas de mejora identificadas|

  Regla: Sitio alternativo se mantiene

    Escenario: Sitio de recuperación
      Dado que hospital tiene sitio alternativo
      Cuando se verifica
      Entonces se verifica:
        | Elemento                    |
        | Acceso disponible           |
        | Equipos listos              |
        | Datos sincronizados         |
        | Personal capacitado         |
        | Prueba trimestral           |
