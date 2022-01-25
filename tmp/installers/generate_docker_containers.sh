#!/bash/bin

# Docker Databases Network
sudo docker network create --subnet=172.18.0.0/16 databases-network --attachable

sudo docker run --name mysql-server --net databases-network --ip 172.18.0.10 -p 3306:3306 -v $HOME/Documents/Databases:/databases -v /databases/mysql:/var/lib/mysql --restart always -e MYSQL_ROOT_PASSWORD=mysql -d mysql:5.7

sudo docker run --name mongodb-server --network databases-network -p 27017:27017 -v $HOME/Documents/Databases:/databases --ip 172.18.0.20 --restart always -d mongo:latest

sudo docker run --name postgresql-server --network databases-network --ip 172.18.0.30 -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres

sudo docker run --name redis-server --network databases-network --ip 172.18.0.40 -p 6379:6379 --restart always -d redis
