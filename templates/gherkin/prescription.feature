# language: es
Característica: Receta Electrónica
  Como médico de la maternidad
  Quiero generar recetas electrónicas seguras
  Para que los pacientes reciban el tratamiento correcto

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de médico
    Y que existe el paciente "María García" con expediente activo

  Escenario: Generación de receta exitosa
    Dado que el médico completó la consulta
    Cuando el médico prescribe:
      | Campo            | Valor                      |
      | Medicamento      | Ácido Fólico 5mg           |
      | Forma farmacéutica| Tableta                   |
      | Dosis            | 1 tableta diaria           |
      | Vía de administración| Oral                   |
      | Frecuencia       | Cada 24 horas              |
      | Duración         | Todo el embarazo           |
      | Cantidad         | 90 tabletas                |
      | Instrucciones    | Tomar en ayunas            |
    Entonces el sistema genera receta con:
      | Campo            | Valor                      |
      | ID receta        | Rx-2024-00001              |
      | Fecha emisión    | Automática                 |
      | Médico           | Dr. Juan Pérez             |
      | Cédula           | 12345678                   |
      | Firma            | Electrónica                |
    Y la receta se vincula al expediente del paciente
    Y la receta se envía a farmacia automáticamente

  Escenario: Alerta por alergia conocida
    Dado que el paciente tiene alergia a "Penicilina"
    Cuando el médico prescribe "Amoxicilina 250mg"
    Entonces el sistema genera alerta:
      | Tipo             | Detalle                    |
      | Alerta           | ALERGIA CONOCIDA           |
      | Sustancia        | Penicilina                 |
      | Reacción previa  | Anafilaxia                 |
      | Severidad        | Alta                       |
    Y el sistema requiere que el médico documente:
      | Campo            | Obligatorio |
      | Decisión         | Sí          |
      | Justificación    | Sí          |
    Y el sistema registra si se acepta o rechaza

  Escenario: Validación de dosis máxima
    Dado que el paciente pesa 60 kg
    Cuando el médico prescribe "Paracetamol 1000mg cada 4 horas"
    Entonces el sistema calcula dosis máxima diaria: 4000mg
    Y el sistema verifica que la dosis prescrita es segura
    Y el sistema muestra confirmación de dosis

  Escenario: Receta con múltiples medicamentos
    Dado que el paciente requiere tratamiento con 3 medicamentos
    Cuando el médico prescribe:
      | # | Medicamento      | Dosis          | Frecuencia      |
      | 1 | Ácido Fólico 5mg | 1 tableta      | Cada 24 horas   |
      | 2 | Sulfato Ferroso  | 1 tableta      | Cada 24 horas   |
      | 3 | Carbonato Calcio  | 1 tableta      | Cada 12 horas   |
    Entonces el sistema genera receta combinada
    Y el sistema verifica interacciones entre medicamentos
    Y el sistema muestra instrucciones de administración claras
    Y el sistema calcula cantidad total de cada medicamento

  Escenario: Rechazo de interacción medicamentosa
    Dado que el paciente toma "Warfarina"
    Cuando el médico prescribe "Ibuprofeno"
    Entonces el sistema muestra alerta de interacción:
      | Riesgo          | Detalle                          |
      | Tipo            | Interacción moderada             |
      | Mecanismo       | Aumento de efecto anticoagulante |
      | Riesgo          | Sangrado                         |
      | Alternativa     | Paracetamol                      |
    Cuando el médico rechaza la alternativa
    Entonces el sistema requiere justificación escrita
    Y el sistema registra la decisión en auditoría
    Y el sistema permite avanzar con la prescripción original

  Escenario: Receta para paciente de alto riesgo
    Dado que el paciente está clasificado como "Alto riesgo"
    Cuando el médico genera receta
    Entonces el sistema muestra recordatorio:
      | Recordatorio                           |
      | Paciente de alto riesgo - seguimiento estrecho |
      | Considerar referencia a especialista   |
      | Verificar estudios recientes           |
    Y la receta lleva sello de "ALTO RIESGO"

  Escenario: Impresión de receta
    Dado que el médico generó una receta
    Cuando solicita imprimir la receta
    Entonces el sistema genera PDF con:
      | Elemento                 |
      | Membrete de la maternidad|
      | Datos del paciente       |
      | Medicamentos prescritos  |
      | Instrucciones claras     |
      | Firma y cédula del médico|
      | Código QR de verificación |
      | Fecha y hora de emisión  |
    Y el PDF es listo para imprimir en menos de 3 segundos

  Escenario: Receta electrónica a farmacia
    Dado que el médico generó receta electrónica
    Cuando la receta se envía a farmacia
    Entonces el sistema de farmacia recibe:
      | Campo                | Valor                |
      | ID receta            | Rx-2024-00001        |
      | Paciente             | María García López   |
      | Medicamento          | Ácido Fólico 5mg     |
      | Cantidad             | 90 tabletas          |
      | Médico emisor        | Dr. Juan Pérez       |
      | Fecha emisión        | Automática           |
    Y farmacia puede surtir directamente desde la receta
    Y la dispensación se vincula a la receta automáticamente

  Escenario: Historial de prescripciones
    Dado que el paciente tiene múltiples recetas anteriores
    Cuando el médico abre el expediente
    Entonces el sistema muestra:
      | Columna              |
      | Fecha                |
      | Medicamento          |
      | Dosis                |
      | Estado (Activa/Surtida/Completada)|
    Y el sistema permite filtrar por fecha o medicamento
    Y el sistema muestra tendencias de prescripción
