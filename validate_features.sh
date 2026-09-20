#!/bin/bash
# Validador de features GHE
# Ejecutar: bash validate_features.sh
# Requiere: grep, find, wc

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "========================================"
echo "  VALIDADOR DE FEATURES GHE"
echo "========================================"
echo ""

ERRORS=0
WARNINGS=0

# 1. Verificar que todos los features tienen tags
echo "1. VERIFICACIÓN DE TAGS"
for f in $(find templates/gherkin -name "*.feature" -type f); do
    if ! grep -q "@domain:" "$f"; then
        echo -e "  ${RED}ERROR: $f - Sin tag @domain${NC}"
        ERRORS=$((ERRORS + 1))
    fi
    if ! grep -q "@type:" "$f"; then
        echo -e "  ${RED}ERROR: $f - Sin tag @type${NC}"
        ERRORS=$((ERRORS + 1))
    fi
    if ! grep -q "@status:" "$f"; then
        echo -e "  ${YELLOW}WARNING: $f - Sin tag @status${NC}"
        WARNINGS=$((WARNINGS + 1))
    fi
done
echo ""

# 2. Verificar formato de features
echo "2. VERIFICACIÓN DE FORMATO"
for f in $(find templates/gherkin -name "*.feature" -type f); do
    if ! head -1 "$f" | grep -q "# language: es"; then
        echo -e "  ${RED}ERROR: $f - Falta '# language: es'${NC}"
        ERRORS=$((ERRORS + 1))
    fi
    if ! grep -q "Característica:" "$f"; then
        echo -e "  ${RED}ERROR: $f - Falta 'Característica:'${NC}"
        ERRORS=$((ERRORS + 1))
    fi
    if ! grep -q "Escenario" "$f"; then
        echo -e "  ${RED}ERROR: $f - Sin escenarios${NC}"
        ERRORS=$((ERRORS + 1))
    fi
done
echo ""

# 3. Verificar features vacíos
echo "3. VERIFICACIÓN DE FEATURES VACÍOS"
for f in $(find templates/gherkin -name "*.feature" -type f); do
    lines=$(wc -l < "$f")
    if [ "$lines" -lt 10 ]; then
        echo -e "  ${RED}ERROR: $f - Solo $lines líneas (muy corto)${NC}"
        ERRORS=$((ERRORS + 1))
    fi
done
echo ""

# 4. Verificar duplicados de contenido
echo "4. VERIFICACIÓN DE DUPLICADOS"
dup_count=$(find templates/gherkin -name "*.feature" -exec md5sum {} \; | sort | awk '{print $1}' | uniq -d | wc -l)
if [ "$dup_count" -gt 0 ]; then
    echo -e "  ${YELLOW}WARNING: $dup_count features con contenido idéntico${NC}"
    WARNINGS=$((WARNINGS + 1))
else
    echo -e "  ${GREEN}OK: Sin duplicados exactos${NC}"
fi
echo ""

# 5. Verificar IDs únicos
echo "5. VERIFICACIÓN DE IDs"
ids=$(grep -r "^# @id " templates/gherkin/ 2>/dev/null | sed 's/.*@id //' | sort)
dup_ids=$(echo "$ids" | uniq -d | wc -l)
if [ "$dup_ids" -gt 0 ]; then
    echo -e "  ${RED}ERROR: $dup_ids IDs duplicados${NC}"
    ERRORS=$((ERRORS + 1))
else
    id_count=$(echo "$ids" | grep -c "GHE-" 2>/dev/null || echo 0)
    echo -e "  ${GREEN}OK: $id_count IDs únicos${NC}"
fi
echo ""

# Resumen
echo "========================================"
echo "  RESUMEN DE VALIDACIÓN"
echo "========================================"
echo "  Errores: $ERRORS"
echo "  Warnings: $WARNINGS"
if [ "$ERRORS" -eq 0 ]; then
    echo -e "  ${GREEN}ESTADO: APROBADO${NC}"
else
    echo -e "  ${RED}ESTADO: REQUIERE CORRECCIÓN${NC}"
fi
echo "========================================"
