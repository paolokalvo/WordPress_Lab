#!/bin/bash

# Verifica se o container do MySQL já está em execução
if [ ! "$(docker ps -q -f name=mysql_db)" ]; then
    # Verifica se o container do MySQL existe, mas não está em execução
    if [ "$(docker ps -aq -f status=exited -f name=mysql_db)" ]; then
        docker rm mysql_db
    fi
    # Cria o container do MySQL com as configurações de root/password123 e criação do banco de dados wp_vuln
    docker run -d -p 3306:3306 --name mysql_db -e MYSQL_ROOT_PASSWORD=password123 -e MYSQL_DATABASE=wp_vuln mysql:latest
    # Aguarda alguns segundos para o container do MySQL iniciar completamente
    sleep 20
    # Importa o arquivo de banco de dados SQL com as vulnerabilidades do WordPress
    docker exec -i mysql_db mysql -uroot -ppassword123 wp_vuln < wp_vuln.sql
else
    echo "Container MySQL já está em execução."
fi
