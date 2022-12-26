#!/bin/bash
##ip rule add from x.x.x.x table 128
#
##ip route add table 128 to y.y.y.y/y dev ethX
#
##ip route add table 128 default via z.z.z.z
## Where x.x.x.x is your public IP, 
## y.y.y.y/y should be the subnet of your public IP address, ethX should be your public Ethernet interface,
## z.z.z.z should be the default gateway.

#sudo ip route add 192.168.100.0/24 via 192.168.100.146 dev vpn
sudo ip route add 192.168.100.0/24 dev vpn
sudo ip route delete default dev vpn scope link
sudo ip route add 10.0.8.167/32 dev vpn
#sudo ip route add 10.0.8.167/32 via 192.168.100.146 dev vpn
