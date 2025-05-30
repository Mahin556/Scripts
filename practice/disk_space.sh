#!/bin/bash

FU=$(df -H | grep -v -E 'Filesystem|tmpfs|efivarfs' | grep -e boot | awk '{print $5}' | tr -d % | awk 'NR==1 {print $1}')

if [[ $FU -gt 20 ]]
then
	echo "WARNING, disk space is low"
else
	echo "Disk space is under limit"
fi


