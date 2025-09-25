#!/bin/bash
# Declare an array
array=(3 56 24 89 67)

# Initialize a variable to store the maximum value, starting with the first element

max=${array[0]}

# Iterate through the array

for num in "${array[@]}"; do

# Compare each element with the current maximum

    if ((num > max)); then
        max=$num
    fi
done

# Print the maximum value

echo "The maximum element in the array is: $max"