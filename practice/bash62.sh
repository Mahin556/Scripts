#!/bin/bash
# Read lines from a file within a shell script?
file=file.txt

while read line;do
    echo $line
done < $file

# file=$(cat file.txt)
# for line in $file;do
#     echo $line
# done

if [ -e "$file" ];then
    while read -r line;do
        echo $line
    done < "$file"
else
    echo "File No Found!"
fi