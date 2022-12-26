#!/bin/bash
if [[ $(/usr/bin/id -u) -ne 0 ]];then
	echo -e "you have to run this script with sudo or root user"
	exit 1
fi
COUNTRY_CODE=$(curl https://ifconfig.io/country_code -s)
IP=$(curl https://ifconfig.io/ip -s)
echo $COUNTRY_CODE
if [[ $COUNTRY_CODE == IR ]];then
	ufw allow in to 192.168.1.0/24
	ufw allow out to 192.168.1.0/24
	ufw default deny outgoing	
	ufw default deny incoming	
else
	echo foreign
	ufw default deny outgoing
	ufw default deny incoming
	ufw allow out to $IP
	ufw allow out on tun0 from any to any
	ufw allow in on tun0 from any to any
fi
