#!/bin/bash

options=("nginx" "postgres" "redis" "exit")

PS3="Select service to restart:- "

select opt in "${options[@]}";do
    if [[ -z "$opt" ]]; then
        echo "Invalid option, try again!"
        continue
    fi
    case $opt in
    "exit")
        echo "Exiting..."
        break
        ;;
    *) 
        echo "Restarting a $opt..." 
        sudo systemctl restart "$opt"
        if [[ $? -eq 0 ]];then
            echo "Restart successfully"
        else
            echo "Restart unsuccessfull!"
        fi
        break
        ;;
    esac
done
