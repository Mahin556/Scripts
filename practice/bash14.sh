#!/bin/bash

echo "Enter a Range"
echo "Enter Min number"; read num_min
echo "Enter Max number"; read num_max

for i in $(seq $num_min $num_max)
do
	echo "$i"
done
