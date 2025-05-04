#!/bin/bash
LINUX=$(tar -cf /root/Linux/home.tar /home/)
printf "Backup done at $(date).\n" $LINUX >> /root/Linux/test.txt
