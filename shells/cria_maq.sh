#!/bin/bash

# Define a função para tratar os logs de erros
function log_error {
    echo "[ERROR] $1"
    exit 1
}

# Verifica se o docker está instalado
if ! command -v docker &> /dev/null
then
    log_error "Docker não está instalado."
fi

# Cria a rede para as máquinas
docker network create --subnet=192.168.201.0/24 wpscan_network

# Cria a máquina com o Ansible e o Vagrant
docker run -d \
    --name wpscan_ansible \
    --network wpscan_network \
    --ip 192.168.201.2 \
    --mount type=bind,source="$(pwd)"/ansible,target=/ansible \
    ansible/centos7-ansible

# Verifica se a máquina com o Ansible e o Vagrant está rodando
if [ "$(docker inspect -f '{{.State.Running}}' wpscan_ansible)" != "true" ]; then
    log_error "A máquina com o Ansible e o Vagrant não está rodando."
fi

# Cria a máquina com o WPScan
docker run -d \
    --name wpscan \
    --network wpscan_network \
    --ip 192.168.201.3 \
    --mount type=bind,source="$(pwd)"/wpscan,target=/wpscan \
    wpscanteam/wpscan

# Verifica se a máquina com o WPScan está rodando
if [ "$(docker inspect -f '{{.State.Running}}' wpscan)" != "true" ]; then
    log_error "A máquina com o WPScan não está rodando."
fi

# Cria a máquina com o WPScan Heatmap
docker run -d \
    --name wpscan_heatmap \
    --network wpscan_network \
    --ip 192.168.201.4 \
    --mount type=bind,source="$(pwd)"/wpscan-heatmap,target=/wpscan-heatmap \
    wpscanteam/wpscan-heatmap

# Verifica se a máquina com o WPScan Heatmap está rodando
if [ "$(docker inspect -f '{{.State.Running}}' wpscan_heatmap)" != "true" ]; then
    log_error "A máquina com o WPScan Heatmap não está rodando."
fi

# Cria a máquina com o WPScanGUI
docker run -d \
    --name wpscan_gui \
    --network wpscan_network \
    --ip 192.168.201.5 \
    -p 8000:8000 \
    --mount type=bind,source="$(pwd)"/wpscan-gui,target=/wpscan-gui \
    madhuakula/wpscan-gui

# Verifica se a máquina com o WPScanGUI está rodando
if [ "$(docker inspect -f '{{.State.Running}}' wpscan_gui)" != "true" ]; then
    log_error "A máquina com o WPScanGUI não está rodando."
fi

# Cria a máquina com o WPScan Batch
docker run -d \
    --name wpscan_batch \
    --network wpscan_network \
    --ip 192.168.201.6 \
    --mount type
