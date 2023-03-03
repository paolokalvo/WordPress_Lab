## Guia de Configuração do Ambiente

### Descrição do Projeto
Este guia tem como objetivo auxiliar na configuração de um ambiente para testes de segurança utilizando as ferramentas OpenVAS, Metasploit, Nessus, Nikto e OSSEC.

### Pré-requisitos
- Docker
- Docker Compose

### Instruções
1. Clonar o repositório para a máquina local:
    ```
    git clone https://github.com/seu-usuario/seu-repositorio.git
    ```

2. Acessar o diretório do repositório clonado:
    ```
    cd seu-repositorio
    ```

3. Configurar as variáveis de ambiente no arquivo .env:
    ```
    DB_NAME=wordpress
    DB_USER=wordpress
    DB_PASSWORD=senha_do_banco
    DB_ROOT_PASSWORD=senha_do_root_do_banco
    WP_ADMIN_USER=admin
    WP_ADMIN_PASSWORD=senha_do_admin
    ```

4. Criar as máquinas para testes de vulnerabilidade:
    - Para criar a máquina com o WordPress vulnerável:
        ```
        docker-compose up -d vulnerable-wp
        ```
    - Para criar a máquina com as ferramentas de testes de segurança:
        ```
        docker-compose up -d security-tools
        ```

5. Acessar a interface web do OpenVAS em http://localhost:8080 para realizar o cadastro do usuário administrador e configurações iniciais.

6. Utilizar as ferramentas de testes de segurança para avaliar a vulnerabilidade do WordPress:
    - OpenVAS: acessar a interface web em http://localhost:8080 e seguir as instruções da ferramenta.
    - Metasploit: utilizar o comando ```msfconsole``` para acessar a interface da ferramenta.
    - Nessus: acessar a interface web em http://localhost:8834 e seguir as instruções da ferramenta.
    - Nik
