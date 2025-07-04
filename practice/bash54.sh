#!/bin/bash

#!/bin/bash

read -p "please enter a number " number

# Example of a loop over a list (commented out)
for variableName in item1 item2 item3 item4 item6
do
    echo "${variableName}"
done

for variableName in "item1 item2" item3 "item4 item6"
do
    echo "${variableName}"
done

for variableName in {1..10}
do
  echo $((variableName * number))
done

for file in *
do 
    echo "File: $file"
done

for file in $(ls *.sh)
do 
    echo "File: $file"
done

# for loop read words from a list
# while loop read lines from a file
for file in $(cat /etc/passwd)
do
    echo "File: $file"
done


# $@ $*

for word in "$@"   # take command line argument as a list
do
    echo "Word: $word"
done

for word in "$*"  # take command line argument as a single string
do
    echo "Word: $word"  
done


i=1
while [[ $i -le 10 ]];do
    echo "$i"
    if [[ $i -eq 5 ]];then
        break;
    fi
    ((i++))
done


i=0
while [[ $i -lt 10 ]];do
    ((i++))
    if [[ $i -eq 5 ]];then
        continue;
    fi
    echo "$i"
done

i=1
while [[ $i -le 3 ]];do
    for item in item1 item2 item3;do
        if [[ $item == 'item2' ]];then
            break;
        fi
        echo "$i - $item"
    done
    ((i++))
done

echo "Continue output"

i=1
while [[ $i -le 3 ]];do
    for item in item1 item2 item3;do
        if [[ $item == 'item2' ]];then
            continue;
        fi
        echo "$i - $item"
    done
    ((i++))
done