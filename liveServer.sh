#!/bin/bash

# Verifica se Python está instalado
if command -v python3 &>/dev/null; then
    echo "Iniciando servidor com Python3 na porta 8000..."
    python3 -m http.server 8000
elif command -v python &>/dev/null; then
    echo "Iniciando servidor com Python2 na porta 8000..."
    python -m SimpleHTTPServer 8000
else
    echo "Python não encontrado. Instale o Python primeiro."
    exit 1
fi
