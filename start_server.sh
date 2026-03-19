#!/bin/bash
# Script para iniciar la farmacia localmente

echo "=========================================="
echo "Iniciando el servidor de la farmacia..."
echo "=========================================="
echo "Por favor, abre tu navegador web y entra a:"
echo "http://localhost:8000/diseño/index.html"
echo "=========================================="
echo "(Para apagar el servidor, presiona Ctrl+C en esta ventana)"

cd /home/rtf/Documentos/farmacia
php -S 0.0.0.0:8000
