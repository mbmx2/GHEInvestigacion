# ADR-001: Adopción de Arquitectura Hexagonal

**Estado:** Aceptado
**Fecha:** 2026-09-21
**Decisor:** Director técnico
**Revisado por:** Director médico, Director de TI

---

## Contexto

GHE debe ser mantenible, testeable y extensible. El hospital tiene múltiples áreas (clínica, administrativa, farmacia, laboratorio) que necesitan integrarse pero evolucionar independientemente. El sistema debe cumplir IEC 62304 Clase C, lo que exige trazabilidad completa de requisitos a código.

## Decisión

Adoptar Arquitectura Hexagonal (Ports & Adapters) con bounded contexts por dominio.

## Criterios de decisión evaluados

| Criterio | Peso | Hexagonal | Capas | Microservicios | Monolito |
|---|---|---|---|---|---|
| Testabilidad | 25% | 10 | 6 | 8 | 3 |
| Mantenibilidad | 25% | 9 | 5 | 7 | 4 |
| Trazabilidad (IEC 62304) | 25% | 9 | 6 | 5 | 3 |
| Extensibilidad | 15% | 9 | 5 | 9 | 3 |
| Complejidad inicial | 10% | 5 | 8 | 3 | 9 |
| **Total ponderado** | | **8.7** | **5.8** | **6.8** | **4.0** |

## Consecuencias

### Positivas
- Cada bounded context es independiente y testeable
- Fácil de cambiar infraestructura (SQLite → PostgreSQL sin modificar dominio)
- Trazabilidad natural de requisitos a código
- Facilita trabajo paralelo entre equipos
- Compatible con IEC 62304 Clase C

### Negativas
- Más archivos iniciales (~30% más que monolito)
- Curva de aprendizaje para el equipo
- Complejidad de composición en el raíz
- Requiere disciplina para mantener separación de capas

## Alternativas descartadas

| Alternativa | Por qué se descartó |
|---|---|
| Arquitectura en capas tradicional | Acoplamiento vertical excesivo. Cambiar SQLite requiere modificar 3 capas |
| Microservicios | Complejidad desproporcionada para hospital único. Requiere orquestación, red confiable |
| Monolito simple | Inmantenible. IEC 62304 requiere separación clara de componentes |

## Requisitos de diseño

1. Domain layer sin dependencias de infraestructura
2. Ports como protocols de Clojure
3. Adapters para cada tecnología externa
4. Composition root para ensamblaje
5. Bounded contexts por dominio: Patient, Clinical, Obstetric, Pharmacy, Prescription, Reporting

## Referencias
- "Hexagonal Architecture" - Alistair Cockburn
- IEC 62304:2006+AMD1:2015 §5.3
- ISO/IEC 12207:2017 §6.4
