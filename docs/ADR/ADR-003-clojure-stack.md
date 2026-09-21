# ADR-003: Selección de Clojure como Lenguaje Principal

**Estado:** Aceptado
**Fecha:** 2026-09-21
**Decisor:** Director técnico

---

## Contexto

GHE necesita: inmutabilidad (datos clínicos inmutables), concurrencia (múltiples usuarios simultáneos), funcionalidad (procesamiento de datos), validación robusta (specs), y compatibilidad con el ecosistema JVM. Los agentes de IA requieren iteración rápida (REPL).

## Decisión

Clojure como lenguaje principal con ClojureScript para frontend.

## Criterios de decisión

| Requisito | Clojure | Java | Python | ClojureScript |
|---|---|---|---|---|
| Inmutabilidad | Nativa | Requiere effort | No nativa | Nativa |
| Concurrencia | STM nativa | Complejo | GIL | — |
| REPL | Nativo | No | IPython (limitado) | shadow-cljs |
| Spec validation | clojure.spec | Manual | Manual | clojure.spec |
| JVM ecosystem | Nativo | Nativo | No | — |
| Data-driven | Nativo | No | Parcial | Nativo |
| Community medical | Creciente | Grande | Grande | Creciente |

## Consecuencias

### Positivas
- Código más conciso (40-60% menos líneas que Java)
- Data-driven architecture (la agenda es un mapa de datos)
- REPL para debugging y experimentación con agentes IA
- clojure.spec para validación automática
- Software Transactional Memory para concurrencia
- Comunidad activa y filosofía funcional

### Negativas
- Curva de aprendizaje para equipo que conoce Java
- Menor ecosistema de herramientas que Java
- Menos herramientas de debugging visual
- Requiere familiaridad con Lisp

## Alternativas descartadas

| Alternativa | Por qué se descartó |
|---|---|
| Java puro | Más verboso, menos expresivo para datos |
| Kotlin | Mezcla OO+FP pero sin REPL nativo |
| Python | No tiene inmutabilidad nativa, GIL limita concurrencia |
| Haskell | Curva de aprendizaje excesiva, menor ecosistema |

## Referencias
- "Clojure for the Brave and True" - Daniel Higginbotham
- "The Joy of Clojure" - Fogus & Hauser
- "REPL-Driven Development" - Stuart Sierra
