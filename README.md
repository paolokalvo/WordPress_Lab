Laboratório de Teste de Vulnerabilidades
Este repositório contém todas as informações necessárias para configurar um ambiente de teste de vulnerabilidades em uma rede local usando Docker e ferramentas de segurança populares.

Pré-requisitos
Docker instalado na máquina host.
Configuração do Ambiente
Siga os seguintes passos para configurar o ambiente:

Clone este repositório para a sua máquina local:
bash
Copy code
git clone https://github.com/seu-usuario/nome-do-repositorio.git 
Configure a rede para o ambiente:
lua
Copy code
docker network create --subnet=192.168.201.0/24 security-lab-net
Crie uma máquina com Wordpress vulnerável:
Copy code
docker-compose -f wordpress-compose.yml up -d
Instale as ferramentas de segurança: OpenVAS, Metasploit, Nessus, Nikto e OSSEC:
Copy code
docker-compose -f security-tools-compose.yml up -d
Acesse o Wordpress vulnerável na rede local em um navegador:
javascript
Copy code
http://192.168.201.2
Ferramentas Disponíveis
OpenVAS
O OpenVAS é uma ferramenta de análise de vulnerabilidades que pode ajudar a identificar vulnerabilidades em redes e sistemas.

Acesso: https://localhost:9392
Credenciais: admin:admin
Metasploit
O Metasploit é uma das ferramentas de testes de penetração mais populares, com um conjunto completo de ferramentas de segurança, incluindo um scanner de vulnerabilidades e gerador de relatórios.

Acesso: docker exec -it security-tools_metasploit_1 bash
Comando: msfconsole
Nessus
O Nessus é um scanner de vulnerabilidades poderoso e amplamente utilizado que pode identificar vulnerabilidades em sistemas, redes e aplicativos.

Acesso: https://localhost:8834
Credenciais: nessus:nessus
Nikto
O Nikto é uma ferramenta de análise de vulnerabilidades especializada em testes de penetração de aplicativos da web.

Acesso: docker exec -it security-tools_nikto_1 bash
Comando: nikto -h http://192.168.201.2
OSSEC
O OSSEC é um sistema de detecção de intrusão e gerenciamento de logs que pode ajudar a identificar atividades suspeitas em um sistema ou rede.

Acesso: docker exec -it security-tools_ossec_1 bash
Comando: ossec-analysisd
Como contribuir
Se você deseja contribuir com este projeto, siga os passos abaixo:

Faça um fork deste repositório.
Crie uma nova branch com suas modificações: git checkout -b minha-branch
Realize as modificações necessárias.
Faça o commit das suas modificações: git commit -am 'Adicionando novas ferramentas de segurança'
Envie suas modificações para o seu repositório no GitHub: git push origin minha-branch
Abra uma pull request neste repositório.
Licença
Este projeto é licenciado sob a licença MIT - consulte o arquivo LICENSE para ob

