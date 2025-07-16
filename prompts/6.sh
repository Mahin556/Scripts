#!/bin/bash

get_cpu() { top -bn1 | grep "Cpu(s)"; }
get_disk() { df -h | grep "^/dev"; }
get_mem() { free -m; }

PS3="Choose a system metric to view: "
select opt in "CPU Usage" "Disk Usage" "Memory Usage" "Exit";do
    case "$REPLY" in
        1) get_cpu ;;
        2) get_disk ;;
        3) get_mem ;;
        4) echo "Exiting..."; break ;;
        *) echo "Invalid choice.";;
    esac 
done