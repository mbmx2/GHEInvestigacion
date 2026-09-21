# ADR-004: SQLite con SQLCipher para Persistencia Local

**Estado:** Aceptado
**Fecha:** 2026-09-21
**Decisor:** Director técnico

---

## Contexto

GHE necesita persistencia local que funcione offline, sea rápida, portátil y cifrada para cumplir LFPDPPP y NOM-024. El sistema debe poder copiarse de una computadora a otra sin configuración.

## Decisión

SQLite con SQLCipher (AES-256) como motor de persistencia.

## Criterios de decisión

| Criterio | SQLite+SQLCipher | PostgreSQL | Datomic | MongoDB |
|---|---|---|---|---|
| Offline nativo | ✅ | ❌ | ❌ | ❌ |
| Portabilidad (copiar archivo) | ✅ | ❌ | ❌ | ❌ |
| Cifrado AES-256 | ✅ SQLCipher | Extensión | Nativo | Extensión |
| Rendimiento local | Excepcional | N/A | N/A | N/A |
| Zero-config | ✅ | ❌ Instalación | ❌ Complejo | ❌ Instalación |
| Costo | Gratis | Gratis | $9,000+/año | Gratis |
| WAL mode | ✅ | ✅ | N/A | N/A |
| FTS5 | ✅ | ✅ (extensión) | ❌ | ✅ nativo |
| Tamaño máximo | 2GB (suficiente) | Sin límite | Sin límite | Sin límite |

## Consecuencias

### Positivas
- Zero-config: el sistema funciona inmediatamente
- Backup = copiar un archivo cifrado
- Rendimiento excepcional: consultas <50ms
- Portabilidad total: copiar a USB y funciona
- FTS5 para búsquedas de texto completo
- WAL mode para concurrencia de lectura

### Negativas
- Sin concurrencia multi-escritura nativa (solucionado con WAL)
- Sin replicación automática (solucionado con sync engine)
- Tamaño máximo 2GB (suficiente para hospital único, ~100K pacientes)

## Alternativas descartadas

| Alternativa | Por qué se descartó |
|---|---|
| PostgreSQL | Requiere servidor instalado, no offline |
| Datomic | Costo de licencia, curva de aprendizaje |
| MongoDB | No ACID nativo, no portable |

## Referencias
- ADR-002 (Offline-First)
- SQLCipher: https://www.zetetic.net/sqlcipher/
