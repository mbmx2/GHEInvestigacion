# Guía CAP Theorem para el Proyecto GHE

> *"En sistemas distribuidos, no puedes tener todo. GHE elige lo que salva vidas."*

---

## 1. ¿Qué es el Teorema CAP?

El **Teorema CAP** (Brewer, 2000) establece que un sistema distribuido solo puede garantizar **dos de tres propiedades** simultáneamente:

```
        Consistency (C)
            /\
           /  \
          /    \
         /  GHE \
        /  CP    \
       /__________\
Disponibilidad (A)  Partition Tolerance (P)
```

| Propiedad | Definición |
|---|---|
| **Consistency (C)** | Todos los nodos ven los mismos datos al mismo tiempo |
| **Availability (A)** | Cada petición recibe una respuesta (éxito o error) |
| **Partition Tolerance (P)** | El sistema funciona cuando hay separación de red |

---

## 2. ¿Qué eligió GHE?

### GHE es **CP** (Consistency + Partition Tolerance)

| Decisión | Razón |
|---|---|
| **Consistencia > Disponibilidad en sync** | Los datos clínicos deben ser correctos |
| **Disponibilidad local siempre** | El médico siempre puede trabajar |
| **Tolerancia a particiones** | Conectividad intermitente es la realidad |

### Por qué no CA (Consistency + Availability)

Un sistema CA requiere **conectividad perfecta**. GHE opera en 2G/EDGE intermitente. Un sistema CA fallaría constantemente en Altotonga.

### Por qué no AP (Availability + Partition Tolerance)

Un sistema AP sacrifice consistencia. En software médico, datos inconsistentes pueden **matar pacientes**. GHE no puede permitir que un médico vea datos incorrectos.

---

## 3. Implementación en GHE

### 3.1. Consistencia Local (siempre)

| Capa | Mecanismo |
|---|---|
| **SQLite** | ACID, WAL mode, foreign keys |
| **Domain** | Specs de clojure.spec |
| **API** | Validación triple (UI → API → Domain) |
| **UI** | Validación en tiempo real |

### 3.2. Disponibilidad Local (siempre)

| Componente | Disponible offline? |
|---|---|
| SQLite | ✅ 100% |
| UI (ClojureScript) | ✅ 100% |
| Domain logic | ✅ 100% |
| Vademécum local | ✅ 100% |
| Sync engine | ❌ Requiere internet |

### 3.3. Tolerancia a Particiones (siempre)

| Mecanismo | Función |
|---|---|
| **Outbox pattern** | Cola de operaciones pendientes |
| **Delta sync** | Solo enviar cambios |
| **Retry + backoff** | Reintentar con espera exponencial |
| **Conflict resolution** | Última escritura gana |
| **Connectivity detection** | Saber cuándo hay internet |

---

## 4. Trade-offs

| Lo que GHE sacrifica | Lo que GHE gana |
|---|---|
| Sync en tiempo real | Funcionamiento 100% offline |
| Consistencia global inmediata | Consistencia local always-on |
| Single source of truth global | Disponibilidad always-on |

---

## 5. Métricas

```yaml
cap_metrics:
  consistency:
    local_acid: true
    spec_validation: "100%"
    triple_validation: true
    post_sync_consistency: "verified"
  
  availability:
    local_uptime: "100%"
    total_uptime: "99.9%"
    response_time_local: "<500ms"
    emergency_response: "<200ms"
  
  partition_tolerance:
    outbox_pattern: true
    delta_sync: true
    retry_backoff: true
    conflict_resolution: "automatic + manual"
    operations_during_partition: "100%"
    data_loss_during_partition: "0%"
```

---

## 6. Referencias

- **"Time, Clocks, and the Ordering of Events"**: Lamport (1978)
- **"Brewer's CAP Theorem"**: Eric Brewer (2000)
- **"CAP Twelve Years Later"**: Eric Brewer (2012)
- **"Designing Data-Intensive Applications"**: Martin Kleppmann
- **"Distributed Systems"**: Maarten van Steen, Andrew Tanenbaum

---

*CAP Theorem en GHE: Consistencia + Disponibilidad + Tolerancia a Particiones = Vidas salvadas.*
