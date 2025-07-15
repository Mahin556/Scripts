#!/bin/bash

array=(1 2 3 4 5 6 7 8 9 10)

max=${array[0]}

for num in ${array[@]};do
	if ((num > max));then
	max=$num
fi
done

echo "The maximum element in the array is: $max"
