#!/bin/bash

MAIN_SERVER_SRC="/home"    #/home/-->content of directory ##/home --> directory
BACKUP_SERVER_DEST="/root/Downloads" 

rsync -az root@system1:${MAIN_SERVER_SRC} /root/Downloads/  #PUSH
rsync -az /root/Downloads${MAIN_SERVER_SRC} root@system2:${BACKUP_SERVER_DEST}   #PULL



