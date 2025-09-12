Perfect 👌 Arrays in **Bash** are a huge topic — Bash has both **indexed arrays** (numbered) and **associative arrays** (key-value). I’ll give you a **complete guide with all concepts, syntax, and examples** so nothing is left out.

---

# 📌 Arrays in Bash (Complete Guide)

---

## 1. **Types of Arrays**

* **Indexed Array** → Index starts at `0` (default).
* **Associative Array** → Uses string keys (requires `declare -A`).

---

## 2. **Declaring Arrays**

### Indexed Arrays

```bash
arr=(apple banana cherry)        # implicit index 0,1,2
arr[3]="date"                    # explicit index
declare -a myarray               # declare explicitly
```

### Associative Arrays

```bash
declare -A fruits
fruits[apple]="red"
fruits[banana]="yellow"
fruits[cherry]="dark red"
```

---

## 3. **Accessing Elements**

### Indexed

```bash
echo ${arr[0]}       # apple
echo ${arr[2]}       # cherry
```

### Associative

```bash
echo ${fruits[apple]}   # red
```

---

## 4. **Accessing All Elements**

```bash
echo ${arr[@]}    # all elements (word-split)
echo ${arr[*]}    # all elements (as one string)
```

* Difference between `@` and `*`:

```bash
for i in "${arr[@]}"; do echo $i; done   # each element separately
for i in "${arr[*]}"; do echo $i; done   # all elements as one
```

---

## 5. **Array Length**

```bash
echo ${#arr[@]}   # number of elements
echo ${#arr[*]}   # number of elements
echo ${#arr[1]}   # length of element at index 1
```

---

## 6. **Indices**

```bash
echo ${!arr[@]}     # list of indices (0 1 2 3)
echo ${!fruits[@]}  # keys of associative array
```

---

## 7. **Adding Elements**

```bash
arr+=(kiwi mango)       # append multiple
arr[10]="pear"          # add at specific index
fruits[grape]="purple"  # add to associative
```

---

## 8. **Updating Elements**

```bash
arr[1]="blueberry"   # replaces banana
fruits[apple]="green"
```

---

## 9. **Deleting Elements**

```bash
unset arr[2]        # removes element at index 2
unset fruits[banana] # remove key
unset arr           # delete entire array
```

---

## 10. **Slicing Arrays**

```bash
arr=(a b c d e f g)
echo ${arr[@]:1:3}   # b c d  (from index 1, 3 elements)
```

---

## 11. **Looping Through Arrays**

### Indexed

```bash
for i in "${arr[@]}"; do
  echo $i
done
```

### Associative

```bash
for key in "${!fruits[@]}"; do
  echo "$key → ${fruits[$key]}"
done
```

---

## 12. **Copying Arrays**

```bash
copy=("${arr[@]}")
declare -a newarr=("${arr[@]}")
```

---

## 13. **Concatenating Arrays**

```bash
arr1=(1 2 3)
arr2=(4 5 6)
arr3=("${arr1[@]}" "${arr2[@]}")
echo "${arr3[@]}"   # 1 2 3 4 5 6
```

---

## 14. **Default Values**

```bash
echo ${arr[99]:-default}   # prints "default" if unset
```

---

## 15. **Special Tricks**

* Reverse array:

```bash
arr=(1 2 3 4 5)
for ((i=${#arr[@]}-1; i>=0; i--)); do
  echo ${arr[i]}
done
```

* Sort array:

```bash
arr=(banana apple cherry)
sorted=($(for i in "${arr[@]}"; do echo $i; done | sort))
echo "${sorted[@]}"
```

---

## 16. **Associative Array Advanced**

* Check if a key exists:

```bash
if [[ -v fruits[apple] ]]; then
  echo "Apple exists"
fi
```

* Iterate with keys:

```bash
for k in "${!fruits[@]}"; do
  echo "$k = ${fruits[$k]}"
done
```

---

## 17. **Difference Between Arrays and Strings**

```bash
arr=("a b" "c d")
echo ${arr[0]}    # a b   (element contains space)
```

Without quotes:

```bash
arr=(a b c d)     # 4 elements
```

---

## 18. **Command Substitution into Array**

```bash
arr=($(ls))           # split on whitespace
mapfile -t arr < <(ls) # safer (preserves spaces)
```

---

## 19. **Passing Arrays to Functions**

```bash
print_array() {
  local arr=("$@")
  for i in "${arr[@]}"; do
    echo $i
  done
}

arr=(a b c)
print_array "${arr[@]}"
```

---

## 20. **Summary**

* `arr=(...)` → define array
* `${arr[i]}` → access element
* `${arr[@]}` → all elements
* `${#arr[@]}` → number of elements
* `unset arr[i]` → remove element
* `declare -A` → associative arrays
* Loops work with `for i in "${arr[@]}"`

---

⚡ This is literally **everything about arrays in Bash** (indexed + associative, with tricks).

Do you want me to make this into a **Markdown cheatsheet** (with categorized sections + ready-to-use examples), like I did for debugging and readonly variables?

```
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
