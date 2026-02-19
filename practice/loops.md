```bash
#!/bin/bash
for i in {1..5}
do
	echo "$i"
done
```

---

```bash
#!/bin/bash

echo "Enter a Range"
echo "Enter Min number"; read num_min
echo "Enter Max number"; read num_max

for i in $(seq $num_min $num_max)
do
	echo "$i"
done
```

---

```bash
#!/bin/bash

fruits=("apple" "banana" "cherry")

for fruit in ${fruits[@]};do
    echo "I like $fruit"
done
```

---

```bash
#!/bin/bash

echo "Enter a number(N):"
read N
sum=0
for ((i=1;i<=N;i++));do
    sum=$(( sum + i ))
done
echo "Sum of first $N natural numbers is: $sum"
```

---

```bash
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
```

---

```bash
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
```

---

```bash
#!/bin/bash
directory="$1"
if [ -z "$directory" ]; then
	echo "Usage: $0 <directory>"
	exit 1
fi


if [ ! -d "$directory" ]; then
	echo "Error: '$directory' is not a valid directory."
	exit 1
fi

cd "$directory" || exit 1

for file in *; do
	if [ -f "$file" ]; then
		newname=$(echo "$file" | tr 'A-Z' 'a-z')
		[ "$file" != "$newname" ] && mv "$file" "$newname"
	fi
done

```

---

```bash
#!/bin/bash

file="$1"
echo $(pwd)

if [ ! -e $file ];then
    echo "$file not found"
    exit 1
fi

while read line;do
    echo $line
done < $1

while IFS= read -r line;do
    echo $line
done < $file

for line in $(cat $file);do
    echo $line
done

<<COMMENT
IFS= preserves leading/trailing whitespace.
-r prevents backslash interpretation.
COMMENT
```