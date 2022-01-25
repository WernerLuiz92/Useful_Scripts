#!/bash/bin

# Packages
sudo apt-get install jq xsel libnss3-tools -y
composer global require laravel/installer
composer global require cpriego/valet-linux

valet install
