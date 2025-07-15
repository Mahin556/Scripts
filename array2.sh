#!/bin/bash

array=(1 2 3 4 5 6 7 8 9 10)

sum=0

for num in ${array[@]};do
sum=$((sum+num))

done

echo "The sum of all element in the array is: $sum"
