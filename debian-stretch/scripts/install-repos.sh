#!/bin/bash

errorHandling() {
    echo "Unable to continue. Error on line $1"
}

alreadyInstalled() {
	echo 
	echo "	Installation aborted. I found previous backups;"
	echo "	repositories might be already installed."
	echo
	exit 1
}

noStoredConfigFound(){
	echo
	echo "Unable to find settings to deploy."
	echo "Please make sure you're running this script from"
	echo "its own directory and that a conf/ directory"
	echo "containing all the stored settings for apt exists"
	echo "at the same level of the scripts/ directory."
	echo
	exit 1
}

trap 'errorHandling $LINENO' ERR

mainSources="sources.list"
additionalSources="sources.list.d"
aptDir="/etc/apt"
renamedSuffix="original.disabled"
storedConf="../conf/apt"

# Running sanity checks / requirements
if ! [ -f $(pwd)/$(basename $0) ]; then
	echo "Please run this script from its own directory."
	exit 1
fi
[ -f $aptDir/$mainSources.$renamedSuffix ] && alreadyInstalled
[ -d $aptDir/$additionalSources.$renamedSuffix ] && alreadyInstalled
[ -f $storedConf/$mainSources ] || noStoredConfigFound
[ -d $storedConf/$additionalSources ] || noStoredConfigFound

# Backup current settings
mv $aptDir/$mainSources $aptDir/$mainSources.$renamedSuffix
mv $aptDir/$additionalSources $aptDir/$additionalSources.$renamedSuffix

cp $storedConf/$mainSources $aptDir/
cp -r $storedConf/$additionalSources $aptDir/

apt update

echo 
echo "Repos updated."
