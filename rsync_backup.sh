#!/bin/bash

MAIN_SERVER_SRC="/home/"    #/home/-->content of directory ##/home --> directory
BACKUP_SERVER_DEST="/root/home_backups" #this directory must be created a pulling system 

DATE=$(date "+%d-%m-%y")

rsync -az root@system1:${MAIN_SERVER_SRC} ${BACKUP_SERVER_DEST}/backup-${DATE}  #PUSH
rsync -az ${BACKUP_SERVER_DEST}/backup-${DATE} root@system2:${BACKUP_SERVER_DEST}   #PULL





