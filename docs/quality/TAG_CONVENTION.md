# Convención de Tags para Features GHE

## Formato

```gherkin
@domain:<dominio> @layer:<capa> @type:<tipo> @risk:<nivel> @owner:<responsable> @status:<estado>
```

## Dominios

| Tag | Dominio |
|---|---|
| `@domain:patient` | Pacientes |
| `@domain:maternity` | Maternidad/Obstetricia |
| `@domain:obstetric` | Obstetricia específica |
| `@domain:neonatology` | Neonatología |
| `@domain:pediatrics` | Pediatría |
| `@domain:gynecology` | Ginecología |
| `@domain:surgery` | Cirugía |
| `@domain:anesthesia` | Anestesiología |
| `@domain:hospitalization` | Hospitalización |
| `@domain:emergency` | Urgencias |
| `@domain:pharmacy` | Farmacia |
| `@domain:laboratory` | Laboratorio |
| `@domain:imaging` | Imagenología |
| `@domain:nutrition` | Nutrición |
| `@domain:nursing` | Enfermería |
| `@domain:security` | Seguridad informática |
| `@domain:admin` | Administración |
| `@domain:hr` | Recursos humanos |
| `@domain:finance` | Finanzas |
| `@domain:operations` | Operaciones generales |
| `@domain:architecture` | Arquitectura de software |
| `@domain:quality` | Calidad de software |
| `@domain:clinical_safety` | Seguridad clínica |

## Capas

| Tag | Capa |
|---|---|
| `@layer:ui` | Interfaz de usuario |
| `@layer:api` | API REST |
| `@layer:domain` | Lógica de negocio |
| `@layer:database` | Persistencia |
| `@layer:sync` | Sincronización |
| `@layer:infrastructure` | Infraestructura |
| `@layer:clinical` | Flujos clínicos |
| `@layer:process` | Procesos administrativos |
| `@layer:security` | Seguridad transversal |

## Tipos

| Tag | Tipo |
|---|---|
| `@type:acceptance` | Criterio de aceptación |
| `@type:security` | Control de seguridad |
| `@type:clinical` | Protocolo clínico |
| `@type:audit` | Auditoría |
| `@type:performance` | Rendimiento |
| `@type:resilience` | Resiliencia |
| `@type:contract` | Contrato de interfaz |
| `@type:compliance` | Cumplimiento normativo |

## Riesgo

| Tag | Nivel | Significado |
|---|---|---|
| `@risk:s1` | Crítico | Puede causar muerte o lesión grave |
| `@risk:s2` | Alto | Puede causar daño significativo |
| `@risk:s3` | Medio | Impacto moderado |
| `@risk:s4` | Bajo | Impacto menor |

## Estado

| Tag | Estado |
|---|---|
| `@status:proposed` | Propuesto, sin implementar |
| `@status:partial` | Parcialmente implementado |
| `@status:verified` | Completamente verificado |
| `@status:obsolete` | Obsoleto |

## Owner

| Tag | Owner |
|---|---|
| `@owner:medical-director` | Director médico |
| `@owner:dev-lead` | Tech lead |
| `@owner:security-lead` | Líder de seguridad |
| `@owner:qa-lead` | Líder de QA |
| `@owner:admin` | Administración |
| `@owner:pharmacy` | Farmacia |
| `@owner:nursing` | Enfermería |
