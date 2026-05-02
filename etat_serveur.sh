#! /bin/bash
host_name=$(hostname)
date=$(date)
addresse_ip_prive=$(nmcli connection show Livebox-6EE0 | grep "IP4.ADDRESS" | cut -d ":" -f2)
addresse_ip=$(curl -4 ifconfig.me)
USED_CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)"%"
USED_RAM=$(free -h | grep Mem | awk '{print $3}')
USED_DISK=$(df -h | grep sda2 | cut -d " " -f20)

echo "les info de serveur pour la date $date"

echo "Host Name:" $host_name

echo "Private IP ADDRESSE:" $addresse_ip_prive

echo "Public IP ADDRESSE:" $addresse_ip

echo "USED CPU:"$USED_CPU

echo "USED MEMORY:"$USED_RAM

echo "USED DISK:" $USED_DISK

