bash
Copy code
## Descrição

Este repositório contém scripts e instruções para criar e configurar uma máquina vulnerável do WordPress para fins de teste de penetração. Além disso, o repositório também inclui scripts para instalar e configurar várias ferramentas de segurança, incluindo OpenVAS, Metasploit, Nessus, Nikto e OSSEC.

## Pré-requisitos

- Docker instalado na máquina local
- Docker-compose instalado na máquina local
- Nmap instalado na máquina local

## Como Usar

1. Clone este repositório em sua máquina local.

git clone https://github.com/seu-usuario/nome-do-repositorio.git

javascript
Copy code

2. Acesse o diretório do projeto.

cd nome-do-repositorio

python
Copy code

3. Crie as máquinas virtualbox para o WordPress e o OpenVAS.

docker-compose -f docker-compose-wordpress.yml up -d
docker-compose -f docker-compose-openvas.yml up -d

lua
Copy code

4. Verifique os endereços IP atribuídos às máquinas virtuais.

docker inspect wordpress_vm | grep IPAddress
docker inspect openvas_vm | grep IPAddress

javascript
Copy code

5. Faça o download do arquivo de instalação do Nessus.

wget https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/12597/download?i_agree_to_tenable_license_agreement=true -O Nessus.deb

markdown
Copy code

6. Instale o Nessus.

dpkg -i Nessus.deb

markdown
Copy code

7. Configure o Nessus.

/etc/init.d/nessusd start
nessuscli fetch --register seu_email@example.com
nessuscli update

java
Copy code

8. Acesse a interface web do Nessus em `https://<IP-da-máquina>:8834` e faça login com suas credenciais.

9. Faça o download do arquivo de instalação do Metasploit.

curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall

markdown
Copy code

10. Instale o Metasploit.

chmod +x msfinstall
./msfinstall

markdown
Copy code

11. Inicie o Metasploit.

msfconsole

javascript
Copy code

12. Faça o download do arquivo de instalação do OSSEC.

wget https://www.ossec.net/files/ossec-hids-3.6.0.tar.gz

markdown
Copy code

13. Extraia o arquivo e instale o OSSEC.

tar -xvf ossec-hids-3.6.0.tar.gz
cd ossec-hids-3.6.0
sudo ./install.sh

markdown
Copy code

14. Configure o OSSEC.

sudo /var/ossec/bin/ossec-control start

java
Copy code

15. Acesse a interface web do OSSEC em `http://<IP-da-máquina>:55000` e faça login com suas credenciais.

16. Faça o download do arquivo de instalação do Nikto.

wget https://github.com/sullo/nikto/archive/master.zip
