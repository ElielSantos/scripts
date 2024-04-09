#!/bin/bash
#sudo nano /etc/profile.d/atividades.sh
#sudo chmod +x /etc/profile.d/atividades.sh

# Obtém o nome do usuário atual do Linux
USUARIO=$(whoami)

# Obtém a data atual
DATA=$(date +"%A, %d de %B de %Y")

# Obtém a hora atual em formato de 24 horas
HORA=$(date +"%H")

# Mensagem de saudação com base na hora do dia
if [ $HORA -lt 12 ]; then
    SAUDACAO="Bom dia"
elif [ $HORA -lt 17 ]; then
    SAUDACAO="Boa tarde"
else
    SAUDACAO="Boa noite"
fi

# Imprime a saudação personalizada
echo "$SAUDACAO, $USUARIO."

# Exibir atividades cadastradas para o dia atual
echo "Aqui estão suas atividades para hoje ($DATA):"

# Ler as atividades agendadas do arquivo de cadastro
ARQUIVO_ATIVIDADES="atividades.txt"

# Verificar se o arquivo de atividades existe
if [ -f "$ARQUIVO_ATIVIDADES" ]; then
    # Filtrar atividades para o dia atual
    ATIVIDADES_HOJE=$(grep "$(date +"%Y-%m-%d")" "$ARQUIVO_ATIVIDADES" | cut -d " " -f 2-)

    # Verificar se existem atividades agendadas para hoje
    if [ -n "$ATIVIDADES_HOJE" ]; then
        echo "$ATIVIDADES_HOJE"
    else
        echo "Você não tem atividades agendadas para hoje."
    fi
else
    echo "Você não tem atividades agendadas."
fi

# Arrays associativos para representar as atividades em grupos
declare -A ATIVIDADES
ATIVIDADES[TODOLIST]=""

# Função para adicionar uma nova atividade
function adicionar_atividade() {
    echo "Nova atividade:"
    read NOVA_ATIVIDADE
    ATIVIDADES[TODOLIST]+="$NOVA_ATIVIDADE, "
    echo "Atividade adicionada!!"
}

# Função para exibir as atividades
function mostrar_atividades() {
    echo "****** Lista de Atividades ******"
    echo "${ATIVIDADES[TODOLIST]}"
    echo "*********************************"
}

# Função para sair do script
function sair() {
    exit 0
}

# Loop infinito para exibir o menu
while true; do
    echo "*-------------------------------*"
    echo "| 1 - Mostrar atividades        |"
    echo "| 2 - Adicionar nova atividade  |"
    echo "| 3 - Sair                      |"
    echo "*-------------------------------*"

    # Solicita ao usuário que escolha uma opção
    read -p "Digite a opção: " OPCAO

    # Verifica a opção selecionada
    case $OPCAO in
        1) mostrar_atividades ;;
        2) adicionar_atividade ;;
        3) sair ;;
        *) echo "Opção inválida!!" ;;
    esac
    echo
done
