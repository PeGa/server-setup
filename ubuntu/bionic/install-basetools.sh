#!/bin/bash
packageList="
apt-file
apt-transport-https
apt-utils
aptitude
aria2
axel
bash-completion
bind9utils
build-essential
bwm-ng
checkrestart
cmake
colordiff
curl
dialog
dstat
htop
iftop
iptraf
less
locales
locate
logrotate
lsb-release
mailutils
man-db
mc
ncdu
nmap
openssh-client
openssh-server
pkg-config
psmisc
rsync
ssmtp
strace
tmux
vim
whois
"
apt install -y $packageList