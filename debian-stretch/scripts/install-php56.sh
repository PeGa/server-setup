#!/bin/bash -eu

# This script will attempt to install php5.6
# on Debian Stretch, which is not currently supported
# by the time of writing this script (08/2017). It uses a
# custom repository from a Debian Maintainer, Ondřej Surý.
# More info: https://deb.sury.org/
#

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
