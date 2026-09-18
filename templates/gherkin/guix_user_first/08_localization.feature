# language: es
# GUIX User First - Localización e Internacionalización
# i18n y l10n: Adaptar el sistema a locale del usuario
Característica: Localización e Internacionalización (GUIX User First - GHE)
  Como desarrollador de GHE
  Quiero que el sistema soporte múltiples idiomas y formatos
  Para funcionar en México y Latinoamérica

  # ─────────────────────────────────────────────────────────────
  # 1. INTERNACIONALIZACIÓN (i18n)
  # ─────────────────────────────────────────────────────────────

  Escenario: Separación de textos del código
    Dado que se usan archivos de traducción
    Cuando se desarrolla
    Entonces:
      | Criterio                   | Estado    |
      | Textos en archivos JSON/EDN | ✅        |
      | No hay strings hardcodeados| ✅         |
      | Claves de traducción       | Descriptivas |
      | Idioma por defecto         | Español (es-MX)     |

  Escenario: Archivos de traducción
    Dado que se estructuran traducciones
    Cuando se consulta
    Entonces:
      | Idioma                     | Archivo              |
      | Español (México)           | es_MX.json           |
      | Inglés (fallback)          | en_US.json           |
      | Portugués (Brasil)         | pt_BR.json (futuro)  |

  # ─────────────────────────────────────────────────────────────
  # 2. LOCALIZACIÓN (l10n)
  # ─────────────────────────────────────────────────────────────

  Escenario: Formato de fechas
    Dado que se localizan fechas
    Cuando se muestra fecha
    Entonces:
      | Locale                      | Formato             |
      | es-MX                       | DD/MM/AAAA          |
      | en-US                       | MM/DD/YYYY          |
      | ISO 8601                    | AAAA-MM-DD          |
    Y se usa locale del navegador por defecto

  Escenario: Formato de números
    Dado que se localizan números
    Cuando se muestra número
    Entonces:
      | Locale                      | Formato             |
      | es-MX                       | 1,234.56            |
      | es-ES                       | 1.234,56            |
      | Peso mexicano               | $1,234.56 MXN       |

  Escenario: Formato de hora
    Dado que se localiza hora
    Cuando se muestra hora
    Entonces:
      | Locale                      | Formato             |
      | es-MX                       | HH:MM (24h)         |
      | en-US                       | HH:MM AM/PM         |

  # ─────────────────────────────────────────────────────────────
  # 3. NORMATIVA MÉDICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Codificación de diagnósticos
    Dado que se muestran diagnósticos
    Cuando se localiza
    Entonces:
      | Criterio                   | Estado    |
      | CIE-10 en español          | ✅         |
      | CIE-10 en inglés           | ✅ (fallback) |
      | Código siempre visible     | ✅         |

  Escenario: Nombres de medicamentos
    Dado que se muestran medicamentos
    Cuando se localiza
    Entonces:
      | Criterio                   | Estado    |
      | Nombre genérico (español)  | ✅         |
      | Nombre comercial           | ✅         |
      | Nombre en inglés           | ✅ (fallback) |
  