#!/bin/bash

while true;do
    read -p "Do you want to restart the service? (y/n): " choice
    case $choice in
    [yY]|[yYeEsE])
        echo "Restarting a service"; sudo systemctl restart docker
        if [[ $? -eq 0 ]];then
            echo "Restart successfully"
        else
            echo "Restart unsuccessfull!"
        fi
        break
        ;;
    [nN]|[nNoO])
        echo "Canceled."
        break 
        ;;
    *)
        echo "Please enter (y/yes) or (n/no)."
        ;;
    esac
done