#!/bin/bash
packageList="
subversion
subversion-tools
redis-server
php-redis
"
apt install -y $packageList
