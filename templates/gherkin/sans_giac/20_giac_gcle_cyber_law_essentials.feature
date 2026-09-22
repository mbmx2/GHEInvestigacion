# language: es
# @id GHE-GIAC-020
# @type business-rule
# @domain security
# @layer cyber-law
# @risk s2
# @owner legal-counsel
# @status proposed
# @requirement REQ-GIAC-020
# @risk-control CTRL-GIAC-020
# @regulation GIAC-GCLE SANS
@domain:sans_giac @type:business-rule @risk:s2 @status:proposed
Característica: GIAC GCLE — Esenciales de Ciberley
  Como asesor legal de TI certificado GCLE
  Quiero conocimiento GCLE de ciberley
  Para que las decisiones de seguridad tengan fundamento legal

  Regla: Marco legal se conoce

    Escenario: Legislación aplicable
      Dado que hospital opera en México
      Cuando se revisa marco legal
      Entonces se verifica:
        | Ley/Fuente                   | Aplicabilidad  |
        | LFPDPPP                      | Protección datos|
        | NOM-004                      | Expediente clínico|
        | NOM-024                      | Sistemas información|
        | Código Penal Federal         | Ciberdelitos   |
        | Ley General de Salud         | Datos de salud |

  Regla: Responsabilidades legales se definen

    Escenario: Responsabilidad de organizaciones
      Dado que se definen responsabilidades
      Cuando se documenta
      Entonces se verifica:
        | Elemento                    |
        | Responsabilidad civil       |
        | Responsabilidad penal       |
        | Responsabilidad administrativa|
        | Obligaciones de notificación|
        | Derechos de los titulares   |

  Regla: Investigación legal se realiza

    Escenario: Investigación de ciberdelitos
      Dado que ocurre ciberdelito
      Cuando se investiga legalmente
      Entonces se verifica:
        | Elemento                    |
        | Preservación de evidencia   |
        | Colaboración con autoridades|
        | Denuncia formal             |
        | Asesoría legal continua     |
        | Recuperación de daños       |
