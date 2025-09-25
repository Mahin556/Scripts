#!/bin/bash

file="$1"
echo $(pwd)

if [ ! -e $file ];then
    echo "$file not found"
    exit 1
fi

while read line;do
    echo $line
done < $1

while TFS= read -r line;do
    echo $line
done < $file

<<COMMENT
IFS= preserves leading/trailing whitespace.
-r prevents backslash interpretation.
COMMENT