#!/bin/bash

read -p "Enter a file name:- " file_name
read -p "Enter a word to find in file($file_name):-" word

count=$(grep -o -w ${word} ${file_name}|wc -l)
echo "$word word found $count times in the file $file_name"
