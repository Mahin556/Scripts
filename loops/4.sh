# Declare an array

array=(1 65 22 19 94)

# Initialize a variable to store the sum

sum=0

# Iterate through the array and add each element to the sum

for num in "${array[@]}"; do
    sum=$((sum + num))
done

# Print the sum

echo "The sum of elements in the array is: $sum"