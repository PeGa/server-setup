#!/bin/bash
if [ $(id -u) -ne 0  ]; then
  echo Must be run as root.
  exit 0
fi
apt update
apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt install docker-ce docker-ce-cli containerd.io
