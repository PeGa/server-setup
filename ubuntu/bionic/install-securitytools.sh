#!/bin/bash
packageList="
rkhunter
lynis
auditd
sysstat
"
apt install -y $packageList
