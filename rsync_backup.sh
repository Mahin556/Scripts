#!/bin/bash

MAIN_SERVER_SRC="/home/"    #/home/-->content of directory ##/home --> directory
BACKUP_SERVER_DEST="/root/Downloads/" 

DATE=$(date "+%d-%m-%y")

rsync -az root@system1:${MAIN_SERVER_SRC} /root/Downloads/backup-${DATE}  #PUSH
rsync -az /root/Downloads/backup-${DATE} root@system2:${BACKUP_SERVER_DEST}   #PULL





