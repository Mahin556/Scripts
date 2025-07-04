#!/bin/bash

while [[ ${answer,,} != 'yes' && ${answer,,} != 'y' ]];do
    read -p "Do you want to continue (Y/y/yes)? " answer
done

while true;do
    read -p "Do you want to continue (Y/y/yes)? " answer
    if [[ ${answer,,} == 'yes' || ${answer,,} == 'y' ]];then
        echo "you want it"
        break
    else
        echo "you don't want it."
    fi
done

# while true; do
#     echo "demo"
# done

a=1
read -p "Enter a number: " num

while [[ $a -le 10 ]]; do
    echo "$num * $a = $((a * $num))"
    ((a++))
done

echo -e "Mahin \n Raza" | while read line
do
    echo "Line: $line"
done

cat /etc/passwd | while read line
do 
    echo "Line: $line"
done

while read line
do 
    echo "Line: $line"
    sleep 0.2
done < /etc/passwd