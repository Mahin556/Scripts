#!/bin/bash

host=$1

if [ -z $host ];then
echo "Usage $0 <host>"
exit 1
fi

ping -c 2 $host > /etc/null &>1

if [ $? -eq 0 ];then
echo "$host is reachable."
else
echo "$host is Not reachable."
fi



