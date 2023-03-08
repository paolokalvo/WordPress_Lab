#!/bin/bash

# Criação da rede
docker network create --subnet=192.168.201.0/24 lab_redesec

# Criação da máquina do WordPress vulnerável
docker run -d -p 192.168.201.50:8080:80 --name wp_vulneravel --network lab_redesec --ip 192.168.201.50 vulneravel/wordpress

# Criação da máquina do OpenVAS
docker run -d -p 192.168.201.51:443:443 -p 192.168.201.51:9390:9390 --name openvas --network lab_redesec --ip 192.168.201.51 mikesplain/openvas

# Criação da máquina do Metasploit
docker run -it -p 192.168.201.52:4444:4444 --name metasploit --network lab_redesec --ip 192.168.201.52 metasploitframework/metasploit-framework

# Criação da máquina do Nessus
docker run -d -p 192.168.201.53:8834:8834 --name nessus --network lab_redesec --ip 192.168.201.53 tenable/nessus

# Criação da máquina do OSSEC
docker run -d --name ossec --network lab_redesec --ip 192.168.201.54 -p 192.168.201.54:1514:1514/udp -p 192.168.201.54:1515:1515/udp -p 192.168.201.54:514:514/udp ossec/ossec-hids:latest
