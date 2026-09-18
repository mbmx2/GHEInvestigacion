# language: es
Característica: Dispensación de Medicamentos
  Como personal de farmacia
  Quiero surtir medicamentos de forma segura y rastreable
  Para garantizar que el paciente reciba el tratamiento correcto

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de farmacia
    Y que existe inventario de medicamentos

  Escenario: Dispensación exitosa de medicamento
    Dado que el médico generó receta para "Paracetamol 500mg"
    Cuando el personal de farmacia busca la receta
    Entonces el sistema muestra:
      | Campo            | Valor                    |
      | Medicamento      | Paracetamol 500mg        |
      | Dosis            | 1 tableta cada 8 horas   |
      | Cantidad         | 20 tabletas              |
      | Instrucciones    | Tomar con alimentos      |
      | Diagnóstico      | Cefalea (R51)            |
      | Médico           | Dr. Juan Pérez           |
      | Cédula           | 12345678                 |
    Y el sistema verifica stock disponible: 50 tabletas
    Cuando el personal confirma dispensación
    Entonces el sistema descuenta 20 tabletas del inventario
    Y el sistema registra lote "LOT-2024-001"
    Y el sistema registra fecha de caducidad "12/2025"
    Y el sistema registra hora de dispensación
    Y el sistema cambia estado de receta a "Surtida"

  Escenario: Medicamento sin stock
    Dado que el médico generó receta para "Amoxicilina 250mg"
    Cuando el personal de farmacia verifica inventario
    Entonces el sistema muestra stock: 0 unidades
    Y el sistema muestra alerta "Sin existencia"
    Y el sistema sugiere alternativas:
      | Alternativa          | Disponible |
      | Amoxicilina 500mg    | Sí (30)    |
      | Azitromicina 250mg   | Sí (45)    |
    Cuando el personal selecciona alternativa
    Entonces el sistema notifica al médico para aprobación
    Y el sistema registra el cambio de medicamento

  Escenario: Verificación de caducidad
    Dado que un medicamento tiene fecha de caducidad próxima
    Cuando el personal intenta surtir un medicamento vencido
    Entonces el sistema bloquea la dispensación
    Y el sistema muestra "MEDICAMENTO VENCIDO - NO DISPENSAR"
    Y el sistema sugiere solicitar reposición
    Y el sistema registra el intento en auditoría

  Escenario: Alerta de interacción medicamentosa
    Dado que el paciente toma "Warfarina" regularmente
    Cuando el médico prescribe "Ibuprofeno 400mg"
    Entonces el sistema genera alerta de interacción
    Y la alerta indica:
      | Riesgo        | Detalle                              |
      | Tipo          | Interacción moderada                 |
      | Efecto        | Aumento de riesgo de sangrado        |
      | Alternativa   | Considerar paracetamol               |
    Y el sistema requiere decisión documentada del médico
    Y el sistema registra si se acepta o rechaza la alerta

  Escenario: Control de medicamentos controlados
    Dado que el médico prescribe "Tramadol 50mg" (controlado)
    Cuando el personal de farmacia intenta surtir
    Entonces el sistema requiere:
      | Requisito                    | Verificado |
      | Receta con firma electrónica | Sí         |
      | Cédula profesional válida    | Sí         |
      | Límite mensual no excedido   | Verificar  |
    Y el sistema registra en bitácora de controlados
    Y el sistema actualiza contador de dispensación controlada

  Escenario: Dispensación offline
    Dado que el sistema NO tiene conexión a internet
    Cuando el personal de farmacia surte un medicamento
    Entonces el sistema guarda la dispensación localmente
    Y el sistema descuenta del inventario local
    Y el sistema marca transacción como "Pendiente de sincronización"
    Y cuando se restaure la conexión, el sistema sincroniza

  Escenario: Reporte de inventario
    Dado que el administrador solicita reporte de inventario
    Cuando el sistema genera el reporte
    Entonces el reporte incluye:
      | Columna              |
      | Nombre del medicamento|
      | Stock actual          |
      | Stock mínimo          |
      | Estado (OK/BAJO/SIN) |
      | Último movimiento     |
      | Fecha caducidad       |
    Y el sistema puede exportar a PDF o CSV

  Escenario: Recepción de mercancía
    Dado que llega mercancía nueva a farmacia
    Cuando el personal registra la recepción:
      | Campo            | Valor              |
      | Medicamento      | Paracetamol 500mg  |
      | Cantidad         | 100 tabletas       |
      | Lote             | LOT-2024-002       |
      | Caducidad        | 06/2026            |
      | Proveedor        | Farmacias Best     |
    Entonces el sistema actualiza inventario
    Y el sistema registra movimiento de entrada
    Y el sistema verifica que cantidad coincide con orden de compra
