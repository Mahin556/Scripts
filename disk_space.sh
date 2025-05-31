#!/bin/bash

DISK=/dev/nvme0n1p2
USED=$(df -H | grep -v -E 'tmpfs|efivarfs|Filesystem' | grep $DISK | awk '{print $(NF-1)}' | tr -d %)
TO=<email-address>

if [[ $USED -gt 80 ]];then
	echo -e "WARNING!!, DISK SPACE IS LOW\nSPACE LEFT: $(( 100-$USED ))%" | mail -s "DISK SPACE ALERT!!" $TO
else
	echo "ALL OKK"
fi


