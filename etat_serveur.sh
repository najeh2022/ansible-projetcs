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

curl --ssl-reqd \
  --url "smtps://smtp.gmail.com:465" \
  --user "najehhattab66@gmail.com:nker dkfx pjad vzaa" \
  --mail-from "najehhattab66@gmail.com" \
  --mail-rcpt "najehhattab2020@gmail.com" \
  --upload-file - <<EOF
From: najehhattab66@gmail.com
To: najehhattab2020@gmail.com
Subject: Mon sujet

les info de serveur pour la date $date
Private IP ADDRESSE: $addresse_ip_prive
Public IP ADDRESSE: $addresse_ip
USED CPU: $USED_CPU
USED MEMORY: $USED_RAM
USED DISK: $USED_DISK


EOF

