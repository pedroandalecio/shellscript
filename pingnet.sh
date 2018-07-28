#!/bin/bash

# Este script usa o protocolo ICMP para se comunicar com todos os nodes
# da rede, use somente redes de classe C, não utilize subredes!

# Limpa a shell para execução do script
clear

# Cria uma variável com path para um arquivo temporário
spawn='/tmp/NET'
# Pede a inserção da rede a ser avaliada pelo usuario
echo -e "\nEntre com a rede: Ex.:192.168.1.0/24"
read addr


# Cria um arquivo temporários
> $spawn

# Envia a rede a ser avaliada para um arquivo temporário
echo $addr > $spawn

# Pega a rede informada
net=`awk -F. '{print $3}' $spawn`

# Pega a rota da rede informada
rota=`ip r | grep $(cat $spawn) | awk -F" " '{print $9}'`

echo $rot

# Codigo de teste de rede
if [ "$rota" == '' ]
    then
        echo -e "\nEste node nao possui uma rota para $addr\n"
	exit
    else
        echo -e "\nLista de hosts respondendo ao ICMP na rede:"
        for ip in `seq 1 254`
            do
               ping -c 192.168.$net.$ip | grep 'ttl=64' | cut -d' ' -f4 | sed -e s'|:||g'
        done
fi
     	      
