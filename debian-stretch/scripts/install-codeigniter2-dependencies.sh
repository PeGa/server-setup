#!/bin/bash
packageList="
php-gettext
php-pear
php-redis
php5.6-curl
php5.6-dev
php5.6-fpm
php5.6-gd
php5.6-mcrypt
php5.6-memcache
php5.6-mysql
php5.6-xcache
php5.6-xmlrpc
php5.6-xsl
"
apt install -y $packageList
