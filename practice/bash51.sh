#!/bin/bash

action=${1}

case ${action} in 
    start)
        echo "Starting the service..."
        ;;
    stop)
        echo "Stopping the service..."
        ;;
    restart)
        echo "Restarting the service..."
        ;;
    status)
        echo "Checking the service status..."
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac


# pattern matching within it

case ${action} in 
    start | START | Start)
        echo "Starting the service..."
        ;;
    stop | STOP | Stop)
        echo "Stopping the service..."
        ;;
    restart)
        echo "Restarting the service..."
        ;;
    status)
        echo "Checking the service status..."
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac

read -p "Do you want to continue (Y/y/yes)? " uservalue

case ${uservalue,,} in
    y | yes)
        echo "you want it"
        ;;
    n | no)
        echo "you don't want it."
        ;;
    *)
        echo "you don't want it."
        ;;
esac


case "${uservalue}" in
    [Yy] | [Yy][Ee][Ss])
        echo "you want it"
        ;;
    [Nn] | [Nn][Oo])
        echo "you don't want it."
        ;;
    *)
        echo "you don't want it."
        ;;
esac
