# language: es
Característica: Receta Electrónica
  Como médico de la maternidad
  Quiero generar recetas seguras
  Para que el paciente reciba tratamiento correcto

  Contexto:
    Dado que el sistema está activo
    Y que "María García" tiene expediente activo

  Escenario: Generación de receta exitosa
    Dado que médico completó consulta
    Cuando prescribe ácido fólico 5mg diario por todo el embarazo
    Entonces el sistema:
      | Acción                          |
      | Generar receta con ID y firma  |
      | Vincular al expediente        |
      | Enviar a farmacia automáticamente |

  Escenario: Alerta por alergia conocida
    Dado que paciente tiene alergia a "Penicilina" (anafilaxia)
    Cuando médico prescribe "Amoxicilina 250mg"
    Entonces alerta:
      | Campo                     |
      | ❌ ALERGIA CONOCIDA       |
      | Sustancia: Penicilina     |
      | Reacción: Anafilaxia      |
    Y requiere documentar decisión del médico

  Escenario: Verificación de dosis máxima
    Dado que paciente pesa 60 kg
    Cuando médico prescribe paracetamol 1000mg cada 4h
    Entonces dosis diaria 6000mg > máxima 4000mg → Bloqueo

  Escenario: Múltiples medicamentos
    Dado que paciente requiere 3 medicamentos
    Cuando prescribe ácido fólico + sulfato ferroso + carbonato calcio
    Entonces el sistema:
      | Acción                          |
      | Generar receta combinada       |
      | Verificar interacciones       |
      | Calcular cantidad total       |

  Escenario: Interacción medicamentosa
    Dado que paciente toma warfarina
    Cuando médico prescribe ibuprofeno
    Entonces alerta de interacción → sangrado severo
    Y si médico rechaza alternativa → justificación escrita

  Escenario: Paciente de alto riesgo
    Dado que paciente es "Alto riesgo"
    Cuando médico genera receta
    Entonces sistema muestra recordatorios:
      | Recordatorio                     |
      | Seguimiento estrecho             |
      | Considerar referencia especialista|
      | Verificar estudios recientes     |

  Escenario: Impresión de receta
    Dado que médico generó receta
    Cuando solicita imprimir
    Entonces genera PDF con:
      | Elemento                     |
      | Membrete + datos paciente   |
      | Medicamentos + instrucciones|
      | Firma + cédula + QR         |
    Y PDF listo en <3 segundos

  Escenario: Receta a farmacia
    Dado que médico generó receta electrónica
    Cuando se envía a farmacia
    Entonces farmacia recibe:
      | Campo                     |
      | ID receta + paciente     |
      | Medicamento + cantidad   |
      | Médico emisor + fecha    |
    Y puede surtir directamente

  Escenario: Historial de prescripciones
    Dado que paciente tiene recetas anteriores
    Cuando médico abre expediente
    Entonces sistema muestra historial filtrable por fecha y medicamento
