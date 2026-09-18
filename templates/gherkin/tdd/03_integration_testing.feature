# language: es
# TDD - Integration Testing
# PRUEBAS DE INTEGRACIÓN: Tests de componentes trabajando juntos
Característica: Integration Testing con TDD (GHE)
  Como desarrollador del proyecto GHE
  Quiero escribir integration tests antes de conectar componentes
  Para garantizar que la integración funciona correctamente

  # ─────────────────────────────────────────────────────────────
  # 1. INTEGRACIÓN DOMINIO-REPOSITORIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Test de integración Patient + Repository
    Dado que se conecta Patient domain con PatientRepository
    Cuando se escribe integration test
    Entonces el test verifica:
      | Operación                  | Verificación         |
      | save + findById            | Datos correctos      |
      | save + findByCURP          | Búsqueda exacta      |
      | save + findAll             | Lista completa       |
      | save + update              | Modificación guardada|
      | save + delete              | Eliminación correcta |
    Y se usa base de datos de prueba (temporal)
  