#!/bin/bash

IP=$(ip a | grep -m 1 -A 3 "ens160" | awk 'NR==4 {print $2}')
HOSTNAME=$(hostname)
OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
DISK=$(df -h / | awk 'NR==2{print "Avail: "$4"("(( 100-$5))"%)" "\nUsed: "$3"("$5")"}')
echo
echo -e "\e[0;36m---------------SYSTEM_INFO---------------"
echo -e "\e[0;36mIP: $IP"
echo -e "\e[0;36mHOSTNAME: $HOSTNAME" 
echo -e "\e[0;36mOS: $OS"  
echo -e "\e[0;36mDISK: $DISK"
echo -e "\e[0;36m-----------------------------------------"
echo -e "\e[0;37m"
