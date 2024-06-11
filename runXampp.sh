#!/bin/bash
############################################################# 
# Copyright (c) 2024, Eliel Santos <santoscyberx@gmail.com> #
#                                                           #
# Este script é de código aberto e seu uso é liberado       #
# All rights reserved.                                      #
#############################################################

# Versão 64 bits do Linux Mint 21

iniciar() {
    echo "Servidor Xampp Inicializando..."
    sudo /opt/lampp/manager-linux-x64.run
}

# Chama a função iniciar
iniciar


#Salvar como arquivo runXampp.sh
#Dar permissões de execução [chmod+x runXampp.sh]
#O arquivo pode ser rodado clicando nele, ou [./runXampp.sh]
