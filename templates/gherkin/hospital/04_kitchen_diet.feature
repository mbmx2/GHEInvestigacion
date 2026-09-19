# language: es
# Cocina y Dieta del Hospital
Característica: Gestión de Cocina y Dietas (GHE Hospital)
  Como nutriólogo/jefe de cocina del hospital
  Quiero workflows para gestión de dietas y cocina
  Para que los pacientes reciban nutrición adecuada y segura

  # ─────────────────────────────────────────────────────────────
  # 1. SOLICITUD DE DIETA
  # ─────────────────────────────────────────────────────────────

  Escenario: Solicitud de dieta por médico
    Dado que el médico indica dieta para paciente hospitalizado
    Cuando se genera orden
    Entonces el sistema incluye:
      | Campo                     |
      | Tipo de dieta            |
      | Calorías/día             |
      | Restricciones            |
      | Suplementos              |
      | Vía de administración    |
      | Duración                 |

  Escenario: Tipos de dieta disponibles
    Dado que se listan dietas disponibles
    Cuando se selecciona
    Entonces:
      | Dieta                      | Indicación |
      | Regular                    | Sin restricciones |
      | Blanda                     | Post-operatorio |
      | Líquida                    | Pre-operatorio |
      | Nada por vía oral (NPO)   | Pre-cirugía, emergencias |
      | Diabética                  | DM |
      | Renal                      | ERC |
      | Hiposódica                 | HTA, edema |
      | Hiperproteica             | Desnutrición, quemados |
      | Lactancia materna         | Puérpera |

  # ─────────────────────────────────────────────────────────────
  # 2. CONTROL DE CALIDAD EN COCINA
  # ─────────────────────────────────────────────────────────────

  Escenario: HACCP en cocina hospitalaria
    Dado que se implementa HACCP
    Cuando se verifica
    Entonces:
      | Punto Crítico de Control  | Monitoreo |
      | Temperatura de receiving  | Cada llegada |
      | Almacenamiento frío       | Cada 4h     |
      | Cocción                   | Temperatura interna |
      | Enfriamiento              | <2h para 4°C |
      | Recalentamiento           | >74°C interna |
      | Servicio                  | Temperatura al servir |

  Escenario: Control de temperatura de alimentos
    Dado que se monitorea temperatura
    Cuando se verifica
    Entonces:
      | Alimento                  | Temperatura aceptable |
      | Carnes crudas             | <4°C                     |
      | Lácteos                   | <4°C                     |
      | Comida cocida caliente    | >60°C                    |
      | Comida fría servida       | <4°C                     |
      | Recongelación             | Prohibida               |

  # ─────────────────────────────────────────────────────────────
  # 3. DIETAS ESPECIALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Dieta para paciente diabético
    Dado que el paciente tiene diabetes
    Cuando se prescribe dieta
    Entonces incluye:
      | Recomendación              |
      | 45-60g de carbohidratos por comida |
      | Horarios fijos de comida  |
      | Evitar azúcares simples  |
      | Incluir fibra            |
      | Porciones controladas    |

  Escenario: Dieta para paciente renal
    Dado que el paciente tiene ERC
    Cuando se prescribe dieta
    Entonces incluye:
      | Restricción              |
      | Sodio <2g/día           |
      | Potasio <2g/día (si hiperpotasemia) |
      | Fósforo <800mg/día      |
      | Proteínas 0.6-0.8 g/kg/día |
      | Líquidos según diuresis  |

  # ─────────────────────────────────────────────────────────────
  # 4. SERVICIO DE COMIDAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Horario de comidas hospitalarias
    Dado que se establece horario de comidas
    Cuando se planifica
    Entonces:
      | Comida                     | Hora      |
      | Desayuno                   | 7:00 AM   |
      | Colación mañana           | 10:00 AM  |
      | Comida                     | 1:00 PM   |
      | Colación tarde            | 4:00 PM   |
      | Cena                       | 7:00 PM   |

  Escenario: Registro de consumo de alimentos
    Dado que se registra consumo del paciente
    Cuando se evalúa
    Entonces:
      | Campo                     |
      | Comida servida           |
      | Porcentaje consumido     |
      | Observaciones (rechazo, náuseas) |
      | Sonda (si aplica)        |
      | Nutrición parenteral     |
