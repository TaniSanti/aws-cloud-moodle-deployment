#!/bin/bash
# Deploy Moodle on an Ubuntu EC2 instance (Apache + MySQL + PHP)
# Run as a user with sudo privileges. Review each section before running —
# some values (passwords, domain, server name) must be edited for your environment.

set -e

# ---------------------------------------------------------------------------
# 1. Install required packages
# ---------------------------------------------------------------------------
sudo apt update && sudo apt upgrade -y

sudo apt install -y \
  apache2 mysql-server php libapache2-mod-php php-mysql \
  php-xml php-intl php-zip php-gd php-curl php-mbstring git unzip php-soap \
  php-bcmath php-cli php-dev php-common php-opcache

# ---------------------------------------------------------------------------
# 2. Adjust PHP config for Moodle
# ---------------------------------------------------------------------------
# Check the installed PHP version first, then edit the matching php.ini path
php -v

# Example for PHP 8.3 — update the version number in the path to match `php -v`
# sudo nano /etc/php/8.3/apache2/php.ini
# Set (uncomment and update):
#   max_input_vars = 5000

sudo systemctl restart apache2

# ---------------------------------------------------------------------------
# 3. Set up the MySQL database
# ---------------------------------------------------------------------------
# CHANGE the placeholder password below before running in any real environment.
sudo mysql <<'SQL'
CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'moodleuser'@'localhost' IDENTIFIED BY 'CHANGE_ME_STRONG_PASSWORD';
GRANT ALL PRIVILEGES ON moodle.* TO 'moodleuser'@'localhost';
FLUSH PRIVILEGES;
SQL

# ---------------------------------------------------------------------------
# 4. Download and set up Moodle
# ---------------------------------------------------------------------------
cd /var/www/html
sudo git clone -b MOODLE_404_STABLE git://git.moodle.org/moodle.git

sudo mkdir -p /var/moodledata
sudo chown -R www-data:www-data /var/www/html/moodle /var/moodledata
sudo chmod -R 755 /var/www/html/moodle /var/moodledata

# ---------------------------------------------------------------------------
# 5. Configure Apache virtual host
# ---------------------------------------------------------------------------
# Create /etc/apache2/sites-available/moodle.conf with:
#
#   <VirtualHost *:80>
#       DocumentRoot /var/www/html/moodle
#       ServerName ec2-your-ip.compute.amazonaws.com
#       <Directory /var/www/html/moodle>
#           Options FollowSymLinks
#           AllowOverride All
#           Require all granted
#       </Directory>
#   </VirtualHost>

sudo a2ensite moodle
sudo a2enmod rewrite
sudo systemctl reload apache2

# ---------------------------------------------------------------------------
# 6. Complete installation via the browser
# ---------------------------------------------------------------------------
# Visit the instance's public IP/domain and follow the Moodle web installer.
# If it asks you to create config.php manually:
#
#   cd /var/www/html/moodle
#   sudo nano config.php        # paste the config code the installer shows you
#   sudo chown www-data:www-data config.php
#   sudo chmod 644 config.php

# ---------------------------------------------------------------------------
# 7. Secure with HTTPS (once a domain is pointed at the instance)
# ---------------------------------------------------------------------------
# sudo apt install -y certbot python3-certbot-apache
# sudo certbot --apache -d yourdomain.com -d www.yourdomain.com
#
# Then update config.php:
#   $CFG->wwwroot = 'https://yourdomain.com';
