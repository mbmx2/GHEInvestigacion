# Template: Validación Automatizada

```bash
#!/bin/bash
# validate_change.sh - Validación de un cambio específico
# Uso: bash validate_change.sh [ID_DEL_CAMBIO]

set -e

CHANGE_ID="${1:-unknown}"
echo "========================================"
echo "  VALIDACIÓN DE CAMBIO: $CHANGE_ID"
echo "========================================"
echo ""

ERRORS=0
WARNINGS=0

# 1. Verificar que los archivos existen
echo "1. VERIFICACIÓN DE ARCHIVOS"
if [ -f "changes/$CHANGE_ID/files.txt" ]; then
    while IFS= read -r file; do
        if [ ! -f "$file" ]; then
            echo "  ERROR: $file no existe"
            ERRORS=$((ERRORS + 1))
        fi
    done < "changes/$CHANGE_ID/files.txt"
else
    echo "  ERROR: No se encontró changes/$CHANGE_ID/files.txt"
    ERRORS=$((ERRORS + 1))
fi
echo ""

# 2. Verificar formato de features
echo "2. VERIFICACIÓN DE FORMATO"
for f in $(find templates/gherkin -name "*.feature" -newer "changes/$CHANGE_ID/files.txt" 2>/dev/null); do
    if ! head -1 "$f" | grep -q "# language: es"; then
        echo "  ERROR: $f - Falta '# language: es'"
        ERRORS=$((ERRORS + 1))
    fi
    if ! grep -q "@domain:" "$f"; then
        echo "  WARNING: $f - Sin tag @domain"
        WARNINGS=$((WARNINGS + 1))
    fi
done
echo ""

# 3. Verificar que los tests pasan
echo "3. VERIFICACIÓN DE TESTS"
if command -v lein &> /dev/null; then
    if lein test 2>/dev/null; then
        echo "  OK: Todos los tests pasan"
    else
        echo "  ERROR: Tests fallidos"
        ERRORS=$((ERRORS + 1))
    fi
else
    echo "  SKIP: lein no disponible"
fi
echo ""

# 4. Verificar linting
echo "4. VERIFICACIÓN DE LINTING"
if command -v clj-kondo &> /dev/null; then
    if clj-kondo --lint src/ 2>/dev/null; then
        echo "  OK: Sin warnings de linting"
    else
        echo "  WARNING: Warnings de linting detectados"
        WARNINGS=$((WARNINGS + 1))
    fi
else
    echo "  SKIP: clj-kondo no disponible"
fi
echo ""

# 5. Verificar build
echo "5. VERIFICACIÓN DE BUILD"
if command -v lein &> /dev/null; then
    if lein uberjar 2>/dev/null; then
        echo "  OK: Build exitoso"
    else
        echo "  ERROR: Build fallido"
        ERRORS=$((ERRORS + 1))
    fi
else
    echo "  SKIP: lein no disponible"
fi
echo ""

# Resumen
echo "========================================"
echo "  RESUMEN: $CHANGE_ID"
echo "========================================"
echo "  Errores: $ERRORS"
echo "  Warnings: $WARNINGS"
if [ "$ERRORS" -eq 0 ]; then
    echo "  ESTADO: APROBADO"
else
    echo "  ESTADO: REQUIERE CORRECCIÓN"
fi
echo "========================================"
```
