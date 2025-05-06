#!/bin/bash

time=$(date +%H)

if [ $time -lt 12 ] ; then
	message="Good Morning"
elif [ $time -lt 18 ]; then
	message="Good Afternoon"
else 
	message="Good Evening"
fi
echo "$message"

