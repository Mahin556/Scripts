#!/bin/bash

n=6

for i in 1 2 3 4 5 6 7 8 9 10; do

	let r=$i%2
	if [[ $r -ne 0 ]]; then
		continue
	fi
	echo "$i"
done

