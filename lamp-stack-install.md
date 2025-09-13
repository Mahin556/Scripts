#!/bin/bash
# Goal: Script which automatically downloads the LAMP STACK

# Ensure script is run as root
if [[ "${UID}" -ne 0 ]]; then
    echo "You must execute with sudo or root"
    exit 1
fi

# Update system
sudo apt-get update -y

# Install Apache
sudo apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y

# Install PHP
sudo apt-get install php libapache2-mod-php php-mysql -y

# Install MySQL
sudo apt-get install mysql-server -y

# Install phpMyAdmin
sudo apt-get install phpmyadmin -y

# Configure phpMyAdmin
echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

systemctl restart apache2
