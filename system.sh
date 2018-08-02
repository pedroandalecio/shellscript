#!/bin/bash

# Este script traz informações do sistema

# Definição de variáveis
hora=`date | cut -d' ' -f4`
tempo=`uptime | awk -F" " '{print $3}' | sed -e s'|,||g'`
users=`uptime | awk -F " " '{print $4}'`

# LImpa a shell
clear

# Prompt de escolha - Menu
echo -e "\nEscolha a opcao desejada:\n"
echo 'Hora do sistema		[ 1 ]'
echo 'Tempo de sistema ligado	[ 2 ]'
echo 'Usuarios logados	[ 3 ]'
echo -e "Finalizar programa	[ 4 ]\n"

# Recebe o valor da variavel opt do usuario
read opcao

case $opcao in
    1)
	echo -e "\nHora do sistema: $hora\n"
    ;;
   
    2)
	echo -e "\nO sistema esta ligado a $tempo horas.\n"
    ;;
    
    3)
	echo -e "\nExistem $users usuarios logados\n"
    ;;

    4)
	echo -e "\nFim.\n"
    ;;

    *)
	echo -e "\nOpcao invalida!\n"
    ;;
esac
