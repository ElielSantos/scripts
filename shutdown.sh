#!/bin/bash

mostrar_menu() {
  echo "Escolha uma opção:"
  echo "1. Desligar"
  echo "2. Suspender"
  echo "3. Reiniciar"
  echo "4. Sair"
}

executar_opcao() {
  case $1 in
    1) desligar ;;
    2) suspender ;;
    3) reiniciar ;;
    4) sair ;;
    *) echo "Opção inválida" ;;
  esac
}

desligar() {
  echo "Desligando..."
  sudo shutdown -h now
}

suspender() {
  echo "Suspender..."
  sudo systemctl suspend
}

reiniciar() {
  echo "Reiniciando..."
  sudo shutdown -r now
}

sair() {
  echo "Saindo..."
  exit 0
}

chmod +x "$0"

while true; do
  mostrar_menu
  read -p "Escolha a opção desejada: " opcao
  executar_opcao $opcao
done
