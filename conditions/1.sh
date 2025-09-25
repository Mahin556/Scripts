#!/bin/bash

file="test.txt"
if [ -e $file ];then
    echo "$file found"
else
    echo "$file not found"
fi 
