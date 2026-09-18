# Análisis Competitivo de GHE

---

## 1. Mapa Competitivo

```
                    ALTA CALIDAD / ALTO PRECIO
                            │
         Epic               │              athenahealth
         Cerner             │              NextGen
                            │
                            │
    HOSPITALARIO ───────────┼─────────── AMBULATORIO
                            │
         OpenMRS            │              SaludTotal
         Bahmni             │              Nimbo
         VistA              │              Luna Salud
                            │
                    BAJA CALIDAD / BAJO PRECIO
```

---

## 2. Competidores en México

### 2.1. Software Médico General

| Competidor | Tipo | Precio | Offline | NOM-024 | Uso |
|---|---|---|---|---|---|
| **SaludTotal** | ERP médico | Desde $183/mes | ❌ | ✅ DGIS | General |
| **Consultorio.mx** | EHR | ~$300/mes | ❌ | ❌ | General |
| **Medilink** | EHR | Desde $450/mes | ✅ | ❌ | General |
| **Nimbo** | EHR | Desde $420/mes | ❌ | ✅ DGIS | Farmacias |
| **Luna Salud** | EHR | Desde $800/mes | ❌ | ❌ | Farmacias |
| **PosPharm** | POS + EHR | Variable | ❌ | ❌ | Farmacias |

### 2.2. Software de Farmacia-Consultorio

| Competidor | Integración | Precio | Fortaleza |
|---|---|---|---|
| **Luna Salud** | Alta | $800/mes | Diseñado para walk-in |
| **PosPharm** | Alta | Variable | Inventario en tiempo real |
| **Nimbo** | Media | $420/mes | BI + reportes COFEPRIS |
| **Pharmacy Lite** | Media | Variable | PLM integrado |

### 2.3. EHR Internacionales (Open Source)

| Competidor | País | Precio | Fortaleza |
|---|---|---|---|
| **OpenMRS** | Global | Gratis | Archetypes, comunidad |
| **Bahmni** | India | Gratis | Workflow clínico completo |
| **VistA** | EE.UU. | Gratis | Battle-tested, 30+ años |
| **GNU Health** | Global | Gratis | Enfocado en países en desarrollo |

---

## 3. Posicionamiento de GHE

### 3.1. Diferenciadores Clave

| Diferenciador | GHE | Competidores |
|---|---|---|
| **Offline-first** | ✅ Nativo | ❌ La mayoría requiere internet |
| **IEC 62304** | 🔄 En proceso | ❌ Ninguno tiene |
| **Open source** | ✅ | ❌ Solo internacionales |
| **Específico para maternidad** | ✅ | ❌ Genéricos |
| **PEAEH (meta-testing)** | ✅ 5,573 tests | ❌ No documentado |
| **Certificación NOM-024** | 🔄 En proceso | ✅ Algunos (SaludTotal, Nimbo) |
| **Costo** | Gratis (implementación) | $183-800/mes |

### 3.2. Ventajas Competitivas

```
1. OFFLINE-FIRST
   - Funciona sin internet (crítico en zonas rurales)
   - Los competidores fallan en conectividad baja

2. ARQUITECTURA HEXAGONAL
   - Fácil de mantener y escalar
   - Los competidores tienen monolitos

3. TESTING DE CALIDAD
   - 5,573 tests con PEAEH
   - Ningún competidor mexicano documenta esto

4. IEC 62304
   - Estándar internacional para software médico
   - Ningún competidor mexicano tiene certificación

5. OPEN SOURCE
   - Transparente, auditable, comunitario
   - Los competidores son cerrados

6. DISEÑADO PARA OBSTETRICIA
   - No es un genérico adaptado
   - Flujos específicos para maternidad
```

### 3.3. Debilidades vs. Competidores

```
1. ADOPCIÓN
   - GHE: 1 implementación (maternidad)
   - SaludTotal: Miles de clientes
   - Nimbo: Redes de farmacias

2. ECOSISTEMA
   - GHE: Sin integraciones documentadas
   - SaludTotal: Medikit (8,000 farmacias)
   - Nimbo: BI, COFEPRIS, SUIVE

3. CERTIFICACIÓN NOM-024
   - GHE: En proceso
   - SaludTotal: ✅ DGIS-CER-P-013-2026-07
   - Nimbo: ✅ DGIS-CER-P-004-2025-04

4. SOPORTE
   - GHE: Comunidad (open source)
   - SaludTotal: Soporte presencial en Monterrey
   - Nimbo: Soporte remoto
```

---

## 4. Análisis FODA

### Fortalezas
- Arquitectura hexagonal moderna
- Offline-first nativo
- Testing de alta calidad (5,573 tests)
- Diseñado para obstetricia
- Open source
- Costo de implementación bajo

### Oportunidades
- Decreto 2026: Obligatoriedad de ECE
- Mercado de farmacias-consultorios (10,000+)
- Zonas rurales sin software médico
- Interoperabilidad con IMSS/ISSSTE
- Expansión a otros países LATAM

### Debilidades
- Una sola implementación actual
- Sin certificación NOM-024 aún
- Sin ecosistema de integraciones
- Equipo pequeño
- Sin soporte presencial

### Amenazas
- Competidores establecidos (SaludTotal, Nimbo)
- Cambios regulatorios
- Adopción lenta de tecnología en rural
- Dependencia de conectividad para sync
- Firmware de hardware médico

---

## 5. Estrategia Competitiva

### 5.1. Nicho Inicial

**No competir con SaludTotal/Nimbo en consultorios privados.**

Enfocarse en:
1. **Maternidades rurales** (donde GHE tiene ventaja offline)
2. **Centros de salud del sector público** (presupuesto limitado)
3. **Redes de farmacias en zonas rurales** (donde internet falla)

### 5.2. Diferenciación

```
NO competir en: precio, soporte presencial, ecosistema de integraciones
SÍ competir en: offline-first, calidad de código, estándares médicos, obstetricia
```

### 5.3. Roadmap Competitivo

| Fase | Objetivo | Competidor a superar |
|---|---|---|
| **Fase 1** | Offline-first + obstetricia | Ninguno (primeros) |
| **Fase 2** | Certificación NOM-024 | Nimbo, SaludTotal |
| **Fase 3** | Integración farmacia | Luna Salud, PosPharm |
| **Fase 4** | IEC 62304 | Ninguno (primero en México) |
| **Fase 5** | Expansión LATAM | OpenMRS, Bahmni |

---

## 6. Conclusión

GHE no necesita ser el EHR más grande de México. Necesita ser el **mejor para maternidades rurales con conectividad limitada**. En ese nicho, no tiene competencia directa.

La estrategia es:
1. Dominar el nicho de maternidad rural
2. Obtener certificaciones que otros no tienen
3. Expandir gradualmente a otros contextos
4. Construir comunidad open source

---

*Competencia GHE: No se trata de ser el más grande, sino el más necesario.*
