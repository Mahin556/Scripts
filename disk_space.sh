#!/bin/bash
set -x
DISK=/dev/nvme0n1p2
USED=$(df -H | grep -v -E 'tmpfs|efivarfs|Filesystem' | grep $DISK | awk '{print $(NF-1)}' | tr -d %)
TO=<your-email>

if [[ $USED -gt 80 ]];then
	echo -e "WARNING!!, DISK SPACE IS LOW\nSPACE LEFT: $(( 100-$USED ))%" | tee -a /var/log/disk-space.log | mail -s "DISK SPACE ALERT!!" $TO 
else
	echo "Disk space is file ---> $(( 100-$USED ))% left" | tee -a /var/log/disk-space.log &> /dev/null
fi


