#!/bin/bash
DG=$(ip route list table main default | awk '{print $3}' | head -1)
INET=$(ip route list table main default | awk '{print $5}' | head -1)
IP=$(ip -brief address show $INET | awk '{print $3}' | cut -d "/" -f 1 | head -1)
echo -e "Default Gateway is:" $DG
echo -e "Default Interface is:" $INET
echo -e "Your IP address is:" $IP
ip rule add table 200 from $IP
ip route add table 200 default via $DG
### to delete the rule run the below commands:
# ip rule delete table 200 from $IP
# ip route delete table 200 default via $DG


