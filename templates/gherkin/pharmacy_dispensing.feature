# language: es
Característica: Dispensación de Medicamentos
  Como personal de farmacia
  Quiero surtir medicamentos de forma segura
  Para que el paciente reciba el tratamiento correcto

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de farmacia
    Y que existe inventario de medicamentos

  Escenario: Dispensación exitosa
    Dado que hay receta de "Paracetamol 500mg" con stock 50
    Cuando farmacia busca la receta
    Entonces el sistema muestra:
      | Campo            | Valor                    |
      | Medicamento      | Paracetamol 500mg        |
      | Dosis            | 1 tableta cada 8 horas   |
      | Cantidad         | 20 tabletas              |
      | Médico           | Dr. Juan Pérez           |
    Y al confirmar dispensación el sistema:
      | Acción                          |
      | Descuenta 20 del inventario   |
      | Registra lote y caducidad     |
      | Cambia estado a "Surtida"     |

  Escenario: Sin stock disponible
    Dado que hay receta de "Amoxicilina 250mg" con stock 0
    Cuando farmacia verifica inventario
    Entonces el sistema:
      | Acción                          |
      | Muestra alerta "Sin existencia"|
      | Sugiere alternativas         |
    Y al seleccionar alternativa notifica al médico

  Escenario: Medicamento vencido
    Dado que medicamento tiene caducidad vencida
    Cuando farmacia intenta surtir
    Entonces el sistema bloquea dispensación
    Y muestra "MEDICAMENTO VENCIDO"
    Y sugiere reposición

  Escenario: Interacción medicamentosa
    Dado que paciente toma "Warfarina"
    Cuando médico prescribe "Ibuprofeno"
    Entonces el sistema alerta:
      | Riesgo        | Detalle                    |
      | Tipo          | Interacción moderada       |
      | Efecto        | Mayor riesgo de sangrado   |
      | Alternativa   | Paracetamol                |
    Y requiere decisión documentada del médico

  Escenario: Medicamento controlado
    Dado que médico prescribe "Tramadol 50mg" (controlado)
    Cuando farmacia lo surte
    Entonces el sistema verifica:
      | Verificación               | Estado |
      | Receta con firma electrónica | ✅    |
      | Cédula profesional válida  | ✅      |
      | Límite mensual no excedido | Verificar |
    Y registra en bitácora de controlados

  Escenario: Dispensación offline
    Dado que NO hay conexión a internet
    Cuando farmacia surte medicamento
    Entonces el sistema:
      | Acción                          |
      | Guarda dispensación localmente |
      | Descuenta inventario local    |
      | Marca como "Pendiente sync"   |
      | Sincroniza al恢复 conexión    |

  Escenario: Recepción de mercancía
    Dado que llega mercancía nueva
    Cuando farmacia registra recepción
      | Campo            | Valor            |
      | Medicamento      | Paracetamol 500mg|
      | Cantidad         | 100 tabletas     |
      | Lote             | LOT-2024-002     |
      | Caducidad        | 06/2026          |
    Entonces el sistema:
      | Acción                          |
      | Actualiza inventario           |
      | Registra movimiento de entrada |
      | Verifica contra orden de compra|
