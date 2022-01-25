#!/bin/bash

# sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common -y

# sudo add-apt-repository ppa:ondrej/php

# sudo apt update

# sudo apt upgrade

# sudo apt-get -o Dpkg::Options::="--force-overwrite" install libpcre2-posix2

# sudo apt update

# sudo apt install -f

# sudo apt upgrade

# sudo apt install php8.0 -y
# sudo get install php7.4 -y
# sudo apt install php5.6 -y

# Install PHP 7.4
# sudo apt-get install libapache2-mod-php7.4 \
# php7.4-fpm \
# php7.4-mysql \
# php7.4-curl \
# php7.4-json \
# php-memcached \
# php7.4-dev \
# php7.4-sqlite3 \
# php7.4-mbstring \
# php7.4-imap \
# php7.4-soap \
# php7.4-xml \
# php7.4-gd \
# php7.4-bcmath \
# php7.4-zip -y

# MCrypt - php7.4-mcrypt doesnt exist anymore, the lib was been deprecated and moved to PECL
# sudo apt-get -y install gcc make autoconf libc-dev pkg-config
# sudo apt-get -y install libmcrypt-dev

sudo apt-get install -y libapache2-mod-php8.0 \
    php8.0-cli php8.0-dev \
    php8.0-pgsql php8.0-sqlite3 php8.0-gd \
    php8.0-fpm \
    php8.0-curl php8.0-memcached \
    php8.0-imap php8.0-mysql php8.0-mbstring \
    php8.0-xml php8.0-zip php8.0-bcmath php8.0-soap \
    php8.0-dba php8.0-intl php8.0-readline \
    php8.0-msgpack php8.0-igbinary php8.0-ldap \
    php8.0-redis php8.0-mongodb
