#!/bin/bash


# select os in linux windows mac;do
#     echo ${os}
# done


select os in linux windows mac;do
    case ${os} in 
        linux)
            echo "OS is Linux"
            break
            ;;
        windows)
            echo "OS is Windows"
            break
            ;;
        mac)
            echo "OS is Mac"
            break
            ;;
        *)
            echo "Invalid"
            ;;
    esac
done