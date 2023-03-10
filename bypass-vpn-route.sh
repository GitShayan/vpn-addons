#!/bin/bash
##ip rule add from x.x.x.x table 128
#
##ip route add table 128 to y.y.y.y/y dev ethX
#
##ip route add table 128 default via z.z.z.z
## Where x.x.x.x is your public IP, 
## y.y.y.y/y should be the subnet of your public IP address, ethX should be your public Ethernet interface,
## z.z.z.z should be the default gateway.
ip rule add from $(ip route get 1 | grep -Po '(?<=src )(\S+)') table 128
ip route add table 128 to $(ip route get 1 | grep -Po '(?<=src )(\S+)')/32 dev $(ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)')
ip route add table 128 default via $(ip -4 route ls | grep default | grep -Po '(?<=via )(\S+)')
