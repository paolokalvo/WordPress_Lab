##Criar uma rede no Docker:
#Para criar uma rede no Docker, você pode usar o seguinte comando:


docker network create nome_da_rede

##Sugestão de nome para a rede: lab_redesec

###Criar uma máquina para o WordPress vulnerável:
###Para criar uma máquina com WordPress vulnerável, você pode usar o seguinte comando:



docker run -d -p 8080:80 --name wp_vulneravel --network nome_da_rede vulneravel/wordpress
Sugestão de nome para a máquina: wp_vulneravel

##Configurar o OpenVAS:
###Para configurar o OpenVAS, você pode usar o seguinte comando:

docker run -d -p 443:443 -p 9390:9390 --name openvas --network nome_da_rede mikesplain/openvas

##Sugestão de nome para a máquina: openvas

##Configurar o Metasploit:
###Para configurar o Metasploit, você pode usar o seguinte comando:


docker run -it -p 4444:4444 --name metasploit --network nome_da_rede metasploitframework/metasploit-framework

###Sugestão de nome para a máquina: metasploit

###Configurar o Nessus:
###Para configurar o Nessus, você pode usar o seguinte comando:

docker run -d -p 8834:8834 --name nessus --network nome_da_rede tenable/nessus

###Sugestão de nome para a máquina: nessus

##Configurar o OSSEC:
###Para configurar o OSSEC, você pode usar o seguinte comando:

docker run -d --name ossec --network nome_da_rede -p 1514:1514/udp -p 1515:1515/udp -p 514:514/udp ossec/ossec-hids:latest

###Sugestão de nome para a máquina: ossec

##Para facilitar a criação das máquinas no Git, você pode criar um arquivo shell com os comandos acima. Por exemplo, você pode criar um arquivo chamado "criar_maquinas.sh" com o seguinte conteúdo:


#!/bin/bash

# Criação da rede
docker network create lab_redesec

# Criação da máquina do WordPress vulnerável
docker run -d -p 8080:80 --name wp_vulneravel --network lab_redesec vulneravel/wordpress

# Criação da máquina do OpenVAS
docker run -d -p 443:443 -p 9390:9390 --name openvas --network lab_redesec mikesplain/openvas

# Criação da máquina do Metasploit
docker run -it -p 4444:4444 --name metasploit --network lab_redesec metasploitframework/metasploit-framework

# Criação da máquina do Nessus
docker run -d -p 8834:8834 --name nessus --network lab_redesec tenable/nessus

# Criação da máquina do OSSEC
docker run -d --name ossec --network lab_redesec -p 1514:1514/udp -p 1515:1515/udp -p 514:514/udp ossec/os
