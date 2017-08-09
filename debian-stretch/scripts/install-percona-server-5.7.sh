#!/bin/bash -eu

# This script will attempt to install percona-server-server
# and percona-server-client on version 5.7. If this version
# is not desired, feel free to modify the perconaVersion 
# variable your needs.

perconaVersion="5.7"
aptUpdate="apt update"
pkgInstall="apt install -y"

errorHandling() {
    echo "Unable to continue. Error on line $1"
}
checkRequirements(){
	$aptUpdate
	$pkgInstall wget
	$pkgInstall lsb-release
}

trap 'errorHandling $LINENO' ERR

installPath=$(mktemp -d)
perconaHelperPackage="percona-release_0.1-4.$(lsb_release -sc)_all.deb"
perconaHelperURL="https://repo.percona.com/apt/$perconaHelperPackage"

checkRequirements

wget -O $installPath/$perconaHelperPackage $perconaHelperURL
dpkg -i $installPath/$perconaHelperPackage

$aptUpdate
$pkgInstall percona-server-server-$perconaVersion percona-server-client-$perconaVersion
$pkgInstall percona-xtrabackup percona-toolkit

rm -rf $installPath
