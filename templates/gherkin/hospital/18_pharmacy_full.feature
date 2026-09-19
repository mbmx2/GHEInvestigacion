# language: es
# Farmacia Completa del Hospital
Característica: Farmacia Hospitalaria (GHE Hospital)
  Como farmacéutico del hospital
  Quiero workflows completos de farmacia hospitalaria
  Para gestionar medicamentos de forma segura y eficiente

  # ─────────────────────────────────────────────────────────────
  # 1. RECEPCIÓN Y ALMACÉN
  # ─────────────────────────────────────────────────────────────

  Escenario: Recepción de medicamentos
    Dado que llegan medicamentos al hospital
    Cuando se reciben
    Entonces:
      | Paso                       |
      | Verificar contra orden de compra |
      | Verificar integridad de empaque |
      | Verificar caducidad (>6 meses) |
      | Verificar número de lote  |
      | Registrar en inventario   |
      | Almacenar según tipo      |

  # ─────────────────────────────────────────────────────────────
  # 2. DISPENSACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Dispensación a paciente hospitalizado
    Dado que se dispensa medicamento a paciente interno
    Cuando se procesa
    Entonces:
      | Paso                       |
      | Verificar orden médica    |
      | Verificar identidad paciente |
      | Verificar alergias        |
      | Verificar dosis           |
      | Descontar de inventario   |
      | Registrar dispensación    |
      | Entregar a enfermería     |

  Escenario: Dispensación ambulatoria
    Dado que se dispensa medicamento a paciente ambulatorio
    Cuando se procesa
    Entonces:
      | Paso                       |
      | Verificar receta          |
      | Verificar identidad       |
      | Verificar cobertura/seguro|
      | Calcular costo            |
      | Cobrar                    |
      | Entregar con instrucciones|
      | Registrar en expediente   |

  # ─────────────────────────────────────────────────────────────
  # 3. CONTROL DE MEDICAMENTOS CONTROLADOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Gestión de estupefacientes
    Dado que se manejan estupefacientes
    Cuando se verifica
    Entonces:
      | Control                    |
      | Bajo llave, doble llave   |
      | Registro por pieza        |
      | Firma al dispensar        |
      | Conciliación diaria       |
      | Reporte mensual a COFEPRIS|

  # ─────────────────────────────────────────────────────────────
  # 4. FARMACIA CLÍNICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Servicios de farmacia clínica
    Dado que se prestan servicios de farmacia clínica
    Cuando se documenta
    Entonces incluye:
      | Servicio                   |
      | Revisión de interacciones |
      | Ajuste de dosis renal     |
      | Educación al paciente     |
      | Seguimiento de terapia    |
      | Reporte de eventos adversos |
      | Formulario terapéutico   |

  # ─────────────────────────────────────────────────────────────
  # 5. CONTROL DE CALIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Indicadores de farmacia
    Dado que se monitorean indicadores
    Cuando se evalúa
    Entonces:
      | Indicador                  | Meta |
      | Errores de dispensación   | <0.1% |
      | Tiempo de dispensación    | <15 min |
      | Stock de emergencias      | 100%   |
      | Medicamentos caducados    | 0%     |
      | Satisfacción de usuarios  | >85%   |

  Escenario: Eventos adversos de medicamentos
    Dado que se reporta evento adverso
    Cuando se registra
    Entonces el sistema incluye:
      | Campo                     |
      | Paciente                 |
      | Medicamento              |
      | Tipo de reacción         |
      | Severidad                |
      | Tratamiento              |
      | Outcome                  |
      | Reporte a COFEPRIS       |
