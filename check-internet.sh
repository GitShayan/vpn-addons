#!/bin/bash
while true
do
checker=$(curl -s ipinfo.io | jq .country)
	if [ "$checker" == '"TR"' ];then
		echo ok!!!!
		sleep 3
	else
		iptables -F
		nordvpn connect turkey
		sleep 20
	fi
done
