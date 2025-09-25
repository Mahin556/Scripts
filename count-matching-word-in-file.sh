#!/bin/bash

echo "Enter a word to search:"
read word
echo "Enter a filename:"
read filename
count=$(grep -w -c $word $filename)
echo "The word '$word' occurred $count times in the file '$filename'."