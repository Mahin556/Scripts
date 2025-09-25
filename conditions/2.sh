#!/bin/bash
number=5
if [ $number -gt 10 ]; then
echo "$number is greater than 10"
else
echo "$number is not greater than 10"
fi
echo "--------"
if [ $number -gt 10 ]; then
echo "$number is greater than 10"
elif [ $number -eq 10 ]; then
echo "$number is equal to 10"
else
echo "$number is less than 10"
fi