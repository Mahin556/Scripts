```bash
#!/usr/bin/env bash

set -e

myarray=(1 2 3 4 5)

echo "Array first item values is ${myarray[0]}"
echo "Array is ${myarray[@]}"
echo "Array length ${#myarray[@]}"
echo "name ${#myarray[*]}"
echo "name ${#myarray[1]}"

# each element separately
for i in "${myarray[@]}";do
    echo "$i"
done

# all elements as one
for i in "${myarray[*]}";do
    echo "$i"
done

for i in ${myarray[*]};do
    echo "$i"
done

for i in "${arr[@]}"; do echo $i; done   # each element separately
for i in "${arr[*]}"; do echo $i; done   # all elements as one

myarray+=(6 7 8 9 10)

echo "${myarray[@]}"
```
```bash
Array first item values is 1
Array is 1 2 3 4 5
Array length 5
name 5
name 1
1
2
3
4
5
1 2 3 4 5
1
2
3
4
5
1 2 3 4 5 6 7 8 9 10
```
---

#### Types of Arrays
**Indexed Array** → Index starts at `0` (default).
**Associative Array** → Uses string keys (requires `declare -A`).

```bash
## Declaring Arrays

# Indexed Arrays
arr=(apple banana cherry)        # implicit index 0,1,2
arr[3]="date"                    # explicit index
declare -a myarray               # declare explicitly

# Associative Arrays
declare -A fruits
fruits[apple]="red"
fruits[banana]="yellow"
fruits[cherry]="dark red"

# Access using Index
echo ${arr[0]}       # apple
echo ${arr[2]}       # cherry

# Access using associative
echo ${fruits[apple]}   # red
```
---

```bash
echo ${arr[@]}    # all elements (word-split)
echo ${arr[*]}    # all elements (as one string)
```

---

```bash
#!/usr/bin/env bash

set -e

declare -a arr=(1 2 3 4 5)
echo "Array: ${arr[@]}"
echo "Length: ${#arr[@]}"

declare -A arr2=( [Name]="Alice" [Age]=30 [City]="New York" )

echo "Keys: ${!arr2[@]}"
echo "Values: ${arr2[@]}"
echo "Name: ${arr2[Name]}"
echo "Age: ${arr2[Age]}"
echo "City: ${arr2[City]}"
```
```bash
Array: 1 2 3 4 5
Length: 5
Keys: Name City Age
Values: Alice New York 30
Name: Alice
Age: 30
City: New York
```
---
```bash
#!/usr/bin/env bash

set -e

arr=(apple banana cherry)        # implicit index 0,1,2
arr[3]="date"                    # explicit index

echo "Array elements: ${arr[@]}"
```
```bash
Array elements: apple banana cherry date
```
---

```bash
#!/usr/bin/env bash

set -e

arr=(1 2 3 4 5)

echo ${!arr[@]} # 0 1 2 3 4
```
```bash
0 1 2 3 4
```

---

```bash
unset arr[2]        # removes element at index 2
unset fruits[banana] # remove key
unset arr           # delete entire array
```
---
```bash
#!/usr/bin/env bash

set -e
arr=(a b c d e f g)
echo ${arr[@]:1:3}   # b c d  (from index 1, 3 elements)
```
```bash
b c d 
```
---

```bash
#!/bin/bash

declare -A fruits
fruits["apple"]="red"
fruits["banana"]="yellow"
fruits["grape"]="purple"

# Iterate over keys and values
for key in "${!fruits[@]}"; do
    echo "$key → ${fruits[$key]}"
done

# Iterate over values
for value in "${fruits[@]}"; do
    echo "$value"
done
```
```bash
grape → purple
apple → red
banana → yellow
purple → 
red → 
yellow → 
```

---

```bash
copy=("${arr[@]}")
declare -a newarr=("${arr[@]}")
```

---

```bash
#Concatenating Arrays
arr1=(1 2 3)
arr2=(4 5 6)
arr3=("${arr1[@]}" "${arr2[@]}")
echo "${arr3[@]}"   # 1 2 3 4 5 6
```

---

```bash
#Default Values
echo ${arr[99]:-default}   # prints "default" if unset
```

---

```bash
#!/bin/bash

#Reverse an array
arr=(1 2 3 4 5)
for ((i=${#arr[@]}-1; i>=0; i--)); do
    echo ${arr[i]}
done
```

---

```bash
#Sort array:
arr=(banana apple cherry)
sorted=($(for i in "${arr[@]}"; do echo $i; done | sort))
echo "${sorted[@]}"
```

---

```bash
#!/bin/bash

value3="World"
arr=("Hello" "there," "$value3")

# Print all elements
echo "${arr[@]}"

# Print number of elements
echo "${#arr[@]}"

# Access second element (index starts at 0)
echo "${arr[1]}"

# Access first element
echo "${arr[0]}"
```

---

```bash
#!/bin/bash

fruits=(  [apple]="red"   [banana]="yellow"   [grape]="purple" )

#Check if a key exists:
if [[ -v fruits[apple] ]]; then
    echo "Apple exists"
fi
```

---

```bash
#!/bin/bash

print_array() {
    local arr=("$@")
    for i in "${arr[@]}"; do
        echo $i
    done
    for i in "$@"; do
        echo $i
    done
}

arr=(a b c)
print_array "${arr[@]}"
```
```bash
a
b
c
a
b
c
```

---

```bash
#!/bin/bash

array=(1 2 3 4 5 6 7 8 9 10)

max=${array[0]}

for num in ${array[@]};do
	if ((num > max));then
	max=$num
fi
done

echo "The maximum element in the array is: $max"
```

---


```bash
#!/bin/bash

array=(1 2 3 4 5 6 7 8 9 10)

sum=0

for num in ${array[@]};do
sum=$((sum+num))

done

echo "The sum of all element in the array is: $sum"
```