# language: es
# @id GHE-FW-REQUIREMENTS-001
# @type contract
# @domain framework
# @layer process
# @risk s2
# @owner requirements-lead
# @status proposed
@domain:framework @type:contract @risk:s2 @status:proposed
Característica: Captura Estructurada de Requisitos
  Como requirements-lead del proyecto GHE
  Quiero que los requisitos se capturen de forma estandarizada
  Para que cada feature tenga un origen claro y verificable

  Contexto:
    Dado que se necesita definir requisitos para un componente

  Escenario: Requisito funcional completo
    Dado que se define un requisito funcional
    Cuando se captura
    Entonces incluye:
      | Campo                      |
      | ID único (FR-XXX)          |
      | Descripción clara          |
      | Prioridad (Must/Should/Could) |
      | Criterio de aceptación verificable |
      | Fuente (quién lo pidió)   |
      | Estado (Propuesto/Aprobado/Implementado/Verificado) |

  Escenario: Requisito no funcional
    Dado que se define un requisito no funcional
    Cuando se captura
    Entonces incluye:
      | Campo                      |
      | ID único (NFR-XXX)         |
      | Categoría (rendimiento/seguridad/usabilidad) |
      | Métrica medible            |
      | Umbral objetivo            |
      | Método de verificación    |

  Escenario: Trazabilidad de requisito
    Dado que se tiene un requisito
    Cuando se verifica trazabilidad
    Entonces se puede rastrear:
      | Cadena                     |
      | Requisito → Feature       |
      | Feature → Escenario       |
      | Escenario → Código        |
      | Código → Test             |
      | Test → Evidencia          |

  Escenario: Cambio de requisito
    Dado que un requisito aprobado necesita cambio
    Cuando se solicita modificación
    Entonces se sigue proceso:
      | Paso                       |
      | 1. Documentar cambio       |
      | 2. Evaluar impacto         |
      | 3. Aprobar                 |
      | 4. Actualizar features     |
      | 5. Actualizar trazabilidad |
