#!/bin/bash

i=1
echo "Enter a Max number:"
read num
echo -e "\nThe number to the $num"
while [ $i -le $num ]; do
	echo "$i"
	(( i += 1 ))
done
