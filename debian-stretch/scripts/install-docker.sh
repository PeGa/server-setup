#!/bin/bash -eu

# This script will attempt to install percona-server-server
# and percona-server-client on version 5.7. If this version
# is not desired, feel free to modify the perconaVersion 
# variable your needs.

pkgInstall="apt install -y"
aptUpdate="apt update"
dockerRepository='deb [arch=amd64] https://download.docker.com/linux/debian stretch stable'
$pkgName="docker-ce"

errorHandling() {
    echo "Unable to continue. Error on line $1"
}
checkRequirements(){
	dockerRequirements="apt-transport-https ca-certificates curl python-software-properties"
	$aptUpdate
	$pkgInstall $dockerRequirements
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
}

trap 'errorHandling $LINENO' ERR


checkRequirements

add-apt-repository $dockerRepository

$aptUpdate
$pkgInstall $pkgName
