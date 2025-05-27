#!/bin/bash

i=1
echo "Enter a number:"
read num

echo -e "\nThe number to the $num"

while [ $i -le 10 ]; do
	echo "$num * $i = $(( $num*$i ))"
	(( i += 1 ))
done
