#!/bash/bin

sh ./install_docker.sh
sh ./install_php.sh
sh ./install_nginx.sh
sh ./install_nodejs.sh
sh ./export_global_variables.sh
sh ./install_vallet.sh
sh ./yarn_packages.sh
sh ./make_directories.sh
sh ./generate_keys.sh
sh ./generate_docker_containers.sh

