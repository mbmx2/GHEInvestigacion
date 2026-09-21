# language: es
# @id GHE-AGENDA-AI-001
# @type acceptance
# @domain agenda
# @layer domain
# @risk s1
# @owner architect
# @status proposed
@domain:agenda @type:acceptance @risk:s1 @status:proposed
Característica: Agentes de IA en la Agenda
  Como equipo médico del hospital
  Quiero agentes de IA que procesen la agenda
  Para automatizar tareas repetitivas y detectar problemas

  Contexto:
    Dado que la agenda tiene eventos en tiempo real
    Y que los agentes de IA monitorean la agenda

  Escenario: Agente de inventario monitorea stock
    Dado que una cirugía está programada
    Cuando el agente de inventario verifica
    Entonces检查:
      | Insumo requerido           | Stock actual | Estado |
      | Kit quirúrgico A           | 5            | ✅     |
      | Anestésico vial 4         | 2            | ⚠️ Bajo |
      | Gasas estériles           | 0            | ❌ Falta|
    Y si falta algo → alerta + solicitud de compra

  Escenario: Agente de facturación valida preautorización
    Dado que una cirugía requiere preautorización
    Cuando el agente verifica con la aseguradora
    Entonces:
      | Verificación               | Estado |
      | Preautorización aprobada   | ✅      |
      | Procedimiento cubierto     | ✅      |
      | Copago estimado            | $5,000  |

  Escenario: Agente de agenda reorganiza turnos
    Dado que un médico cancela 3 citas
    Cuando el agente optimiza la agenda
    Entonces:
      | Acción                    |
      | Busca huecos compatibles |
      | Reasigna pacientes        |
      | Notifica cambios          |
      | Actualiza estadísticas    |

  Escenario: Agente conversacional para recepción
    Dado que la recepcionista dice "Busca hueco para el Dr. Ríos el viernes"
    Cuando el agente procesa lenguaje natural
    Entonces:
      | Respuesta                  |
      | "El Dr. Ríos tiene hueco a las 10:00 y 14:00 el viernes" |
      | "¿Quiere agendar en alguno?" |
      | Si responde "sí, a las 10" → agenda automáticamente |
