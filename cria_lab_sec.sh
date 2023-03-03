# Criar a rede
docker network create wordpress-net

# Criar a máquina para o WordPress
docker run -d --name wordpress --network wordpress-net -p 8080:80 -v /path/to/wordpress:/var/www/html wordpress

# Criar a máquina para o OpenVAS
docker run -d --name openvas --network wordpress-net -p 443:443 -p 9390:9390 mikesplain/openvas

# Criar a máquina para o Metasploit
docker run -d --name metasploit --network wordpress-net -p 4444:4444 -e POSTGRES_PASSWORD=password metasploitframework/metasploit

# Criar a máquina para o Nessus
docker run -d --name nessus --network wordpress-net -p 8834:8834 nessus/nessus

# Criar a máquina para o Nikto
docker run -d --name nikto --network wordpress-net sudokuh/dvwa
