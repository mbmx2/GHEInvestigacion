# language: es
# @id GHE-SECURITY-005
# @type acceptance
# @domain security
# @layer penetration
# @risk s1
# @owner security-team
# @status proposed
# @requirement REQ-SECURITY-005
# @risk-control CTRL-SECURITY-005
# @regulation NOM-024 OWASP
@domain:security @type:acceptance @risk:s1 @status:proposed
Característica: Pentesting Avanzado — Escenarios de Ataque Complejos
  Como tester de seguridad
  Quiero escenarios de ataque avanzados
  Para validar resistencia ante amenazas reales del sector salud

  Regla: Ataques a API médica

    Escenario: Inyección en endpoints FHIR
      Dado que se prueba inyección en parámetros FHIR
      Cuando se envían payloads en Patient.name, Condition.code
      Entonces el sistema resiste:
        | Payload                           | Resultado   |
        | {"resourceType":"Patient","name":[{"text":"<script>"}]} | Sanitizado |
        | {$where: "1==1"}                 | Rechazado   |
        | <?xml version="1.0"?><!DOCTYPE>   | Rechazado   |

    Escenario: BOLA en expedientes
      Dado que autenticado como médico general
      Cuando se intenta acceder a expediente de otro médico
      Entonces el sistema rechaza con 403
      Y registra intento de acceso no autorizado
      # @invariante INV-SECURITY-BOLA-001

    Escenario: Rate limiting en login
      Dado que se intenta fuerza bruta
      Cuando se envían >10 intentos en 1 minuto
      Entonces se bloquea cuenta 15 minutos
      Y se notifica al administrador

  Regla: Ataques a sincronización offline

    Escenario: Manipulación de cola de sincronización
      Dado que hay cola offline con datos pendientes
      Cuando se intenta modificar payload de sincronización
      Entonces sistema verifica firma del payload
      Y rechaza si integridad está comprometida

    Escenario: Replay attack en sincronización
      Dado que se captura paquete de sincronización válido
      Cuando se reintenta enviar el mismo paquete
      Entonces sistema detecta nonce duplicado
      Y rechaza la transacción

  Regla: Ataques a datos en reposo

    Escenario: Acceso directo a SQLite
      Dado que se obtiene acceso al archivo SQLite
      Cuando se intenta leer contenido
      Entonces los datos están encriptados con AES-256
      Y no son legibles sin clave

    Escenario: Extracción de memoria
      Dado que se intenta volcar memoria del proceso
      Cuando se ejecuta dump de memoria
      Entonces datos sensibles no aparecen en texto plano
      Y claves de encriptación no persisten en memoria después de uso

  Regla: Ataques a infraestructura

    Escenario: SSRF via webhook
      Dado que sistema acepta URLs para notificaciones
      Cuando se envía URL interna (169.254.169.254)
      Entonces sistema bloquea acceso a redes internas
      Y registra intento de SSRF

    Escenario: Deserialización insegura
      Dado que sistema recibe objetos serializados
      Cuando se envía payload malicioso
      Entonces sistema rechaza deserialización no validada
      Y genera alerta de seguridad

  Regla: Social engineering

    Escenario: Phishing a personal médico
      Dado que se envía email phishing simulado
      Cuando personal hace clic
      Entonces sistema de email bloquea enlaces maliciosos
      Y notifica al equipo de seguridad

    Escenario: Ingeniería social por teléfono
      Dado que se llama pidiendo acceso de emergencia
      Cuando operador verifica identidad
      Entonces requiere: nombre, matrícula, código de verificación
      Y no concede acceso sin verificación completa
