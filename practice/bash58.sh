#!/bin/bash
#Create a shell script that checks if a file exists in the current directory.

read -p "Enter a file to find:- " file_name
if [[ -e "$file_name" ]];then
    echo "File exist!"
else
    echo "File not exits"
fi

