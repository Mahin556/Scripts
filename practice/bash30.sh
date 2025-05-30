#!/bin/bash

n=6

for i in 1 2 3 4 5 6 7 8 9 10; do

	if [[ $i -eq $n ]]; then
		echo "$n found"
#		break
	fi
	echo "$i number"
done

