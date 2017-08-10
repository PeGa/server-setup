#!/bin/bash -eu

# This script will attempt to install percona-server-server
# and percona-server-client on version 5.7. If this version
# is not desired, feel free to modify the perconaVersion 
# variable your needs.

pkgInstall="apt install -y"
aptUpdate="apt update"
sourceRepository='deb https://packages.sury.org/php/ stretch main'
pkgName="php5.6-cli php5.6-fpm"

errorHandling() {
    echo "Unable to continue. Error on line $1"
}
checkRequirements(){
	pkgRequirements="apt-transport-https curl software-properties-common"
	$aptUpdate
	$pkgInstall $pkgRequirements
	curl -fsSL https://packages.sury.org/php/apt.gpg | apt-key add -
}

trap 'errorHandling $LINENO' ERR


checkRequirements

add-apt-repository "${sourceRepository}"

$aptUpdate
$pkgInstall $pkgName
