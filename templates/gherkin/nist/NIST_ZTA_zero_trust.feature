# language: es
# @id GHE-NIST-ZTA-001
# @type compliance
# @domain security
# @layer architecture
# @risk s1
# @owner architect
# @status proposed
# @requirement NIST-ZTA
# @risk-control CTRL-NIST-ZTA
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: NIST SP 800-207 - Arquitectura Zero Trust
  Como arquitecto del proyecto GHE
  Quiero que la seguridad siga principios de Zero Trust
  Para que nunca se asuma confianza en ningún componente

  # ─────────────────────────────────────────────────────────────
  # PRINCIPIO 1: Nunca confiar, siempre verificar
  # ─────────────────────────────────────────────────────────────

  Regla: Toda petición se autentica

    Escenario: Autenticación obligatoria
      Dado que se recibe petición al sistema
      Cuando se procesa
      Entonces: token válido, no expirado, rol autorizado
      # @evidence EVID-NIST-ZTA-001

    Escenario: Petición sin autenticación
      Dado que se envía petición sin token
      Cuando se procesa
      Entonces: 401 Unauthorized + registro en audit log

  Regla: Toda petición se autoriza

    Escenario: Autorización verificada
      Dado que usuario autenticado accede a recurso
      Cuando se verifica autorización
      Entonces: rol tiene permiso para esa acción en ese recurso

    Escenario: Acceso denegado
      Dado que usuario no tiene permiso
      Cuando intenta acceder
      Entonces: 403 Forbidden + registro en audit log

  # ─────────────────────────────────────────────────────────────
  # PRINCIPIO 2: Asumir brecha
  # ─────────────────────────────────────────────────────────────

  Regla: El sistema asume que puede ser comprometido

    Escenario: Diseño asume brecha
      Dado que se diseña componente
      Cuando se verifica
      Entonces: defensa en profundidad, datos cifrados, auditoría completa

    Escenario: Datos protegidos incluso si hay brecha
      Dado que hay brecha de seguridad
      Cuando se verifica
      Entonces: datos cifrados, logs inmutables, no hay secrets expuestos

  # ─────────────────────────────────────────────────────────────
  # PRINCIPIO 3: Verificar explícitamente
  # ─────────────────────────────────────────────────────────────

  Regla: Cada acceso se verifica explícitamente

    Escenario: Verificación explícita
      Dado que se accede a recurso
      Cuando se verifica
      Entonces: se verifica identidad, autorización, contexto, integridad

  # ─────────────────────────────────────────────────────────────
  # PRINCIPIO 4: Acceso mínimo
  # ─────────────────────────────────────────────────────────────

  Regla: Acceso mínimo privilegiado

    Escenario: Mínimo privilegio
      Dado que se asigna acceso
      Cuando se verifica
      Entonces: solo lo necesario para la función, no más

  # ─────────────────────────────────────────────────────────────
  # PRINCIPIO 5: Microsegmentación
  # ─────────────────────────────────────────────────────────────

  Regla: Componentes segmentados

    Escenario: Microsegmentación
      Dado que se verifica segmentación
      Cuando se audita
      Entonces: cada componente aislado, comunicación solo por interfaces

  # @invariante INV-ZTA-001: No hay componente que confíe en otro sin verificar
  Regla: Verificación en cada capa

    Escenario: Sin confianza implícita
      Dado que se verifica arquitectura
      Cuando se audita
      Entonces: cada capa verifica a la siguiente, no asume confianza
