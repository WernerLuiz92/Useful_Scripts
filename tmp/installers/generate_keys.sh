#!/bash/bin

# Generate SSH Keys
cd $HOME/.ssh

ssh-keygen -o -t rsa -b 4096 -C "samueldesconsi@gmail.com"

ssh-keygen -o -t rsa -b 4096 -C "samuel.desconsi@melhorenvio.com"
