
# 🌀 Loops in Bash (Complete Guide)

---

## 🔹 1. `for` Loops

### **Basic form**

```bash
for var in item1 item2 item3; do
    echo "$var"
done
```

---

### **Over ranges**

```bash
for i in {1..5}; do
    echo "Number $i"
done
```

Output:

```
Number 1
Number 2
Number 3
Number 4
Number 5
```

---

### **With step**

```bash
for i in {0..20..5}; do
    echo "$i"
done
```

Output: `0 5 10 15 20`

---

### **C-style for loop**

```bash
for ((i=0; i<5; i++)); do
    echo "i = $i"
done
```

---

### **Loop over files**

```bash
for file in *.txt; do
    echo "Processing $file"
done
```

---

### **Loop over command output**

```bash
for user in $(cut -d: -f1 /etc/passwd); do
    echo "User: $user"
done
```

---

### **Nested for loops**

```bash
for i in {1..3}; do
    for j in {a..c}; do
        echo "$i$j"
    done
done
```

---

### **Infinite for loop**

```bash
for (( ; ; )); do
    echo "Infinite loop, press Ctrl+C to exit"
    sleep 1
done
```

---

### **Terminal one-liners**

```bash
for i in {1..5}; do echo "Hello $i"; done
```

---

## 🔹 2. `while` Loops

### **Basic**

```bash
count=1
while [[ $count -le 5 ]]; do
    echo "Count = $count"
    ((count++))
done
```

---

### **Reading a file line by line**

```bash
while read line; do
    echo "Line: $line"
done < file.txt
```

---

### **Until condition is met**

```bash
count=1
until [[ $count -gt 5 ]]; do
    echo "Count = $count"
    ((count++))
done
```

---

### **While true (infinite loop)**

```bash
while true; do
    echo "Running..."
    sleep 1
done
```

---

### **While with command output**

```bash
while read user; do
    echo "User: $user"
done < <(cut -d: -f1 /etc/passwd)
```

---

### **Interactive while loop**

```bash
while read -p "Enter something (or 'quit'): " input; do
    [[ $input == "quit" ]] && break
    echo "You typed: $input"
done
```

---

### **Terminal one-liners**

```bash
count=1; while [[ $count -le 3 ]]; do echo "Loop $count"; ((count++)); done
```

---

## 🔹 3. Control Statements (inside both `for` and `while`)

| Statement  | Meaning                    |
| ---------- | -------------------------- |
| `break`    | Exit the loop immediately  |
| `continue` | Skip current iteration     |
| `exit`     | Exit the script completely |

**Examples:**

```bash
for i in {1..5}; do
    if [[ $i -eq 3 ]]; then
        echo "Breaking at $i"
        break
    fi
    echo "$i"
done
```

```bash
for i in {1..5}; do
    if [[ $i -eq 3 ]]; then
        echo "Skipping $i"
        continue
    fi
    echo "$i"
done
```

---

## 🔹 4. Loop Tricks

* **Loop over arguments**

```bash
for arg in "$@"; do
    echo "Arg: $arg"
done
```

* **Parallel commands**

```bash
for site in google.com github.com; do
    ping -c1 $site &   # run in background
done
wait
```

* **Arithmetic loop with while**

```bash
i=0
while (( i < 5 )); do
    echo $i
    ((i++))
done
```

* **Colorized output in loops**

```bash
for i in {1..5}; do
    echo -e "\e[32mIteration $i\e[0m"
done
```

---

## 🔹 5. Advanced Loop Usage

* **Process substitution**

```bash
while read line; do
    echo ">> $line"
done < <(ls -1)
```

* **Loop with timeout**

```bash
end=$((SECONDS+5))
while [ $SECONDS -lt $end ]; do
    echo "Looping..."
    sleep 1
done
```

* **Nested while with file + counter**

```bash
count=1
while read line; do
    echo "$count: $line"
    ((count++))
done < /etc/passwd
```

---

## 🔹 6. Interactive Terminal Use

* **Simple loop**

```bash
for i in {1..5}; do echo "hello $i"; done
```

* **Infinite loop in terminal**

```bash
while true; do date; sleep 1; done
```

* **Loop until user presses Ctrl+C**

```bash
for (( ; ; )); do echo "Running"; sleep 2; done
```

---

✅ **Summary**:
In Bash, loops (`for`, `while`, `until`) let you:

* Iterate over numbers, files, strings, arguments
* Read input from files or commands
* Run infinitely (until stopped)
* Control flow with `break`, `continue`, `exit`
* Use both in **scripts** and **one-liners in terminal**

---

# 🎯 Bash `until` Loop

---

## 🔹 1. Basic Syntax

```bash
until [ condition ]
do
    commands
done
```

* Runs **until** the condition becomes **true**
* Opposite of `while` loop (which runs while condition is true)

---

## 🔹 2. Simple Example

```bash
count=1
until [ $count -gt 5 ]
do
    echo "Count = $count"
    ((count++))
done
```

👉 Output:

```
Count = 1
Count = 2
Count = 3
Count = 4
Count = 5
```

---

## 🔹 3. Infinite Until Loop

```bash
until false
do
    echo "This runs forever (press Ctrl+C to stop)"
done
```

---

## 🔹 4. Reverse Counting

```bash
n=5
until [ $n -eq 0 ]
do
    echo "Countdown: $n"
    ((n--))
done
echo "Blastoff!"
```

---

## 🔹 5. Wait for a File to Exist

```bash
file="/tmp/myfile.txt"

until [ -f "$file" ]
do
    echo "Waiting for $file ..."
    sleep 2
done

echo "$file is ready!"
```

---

## 🔹 6. With Break & Continue

```bash
x=0
until [ $x -ge 10 ]
do
    ((x++))
    if (( x == 5 )); then
        echo "Skipping 5"
        continue
    fi
    if (( x == 8 )); then
        echo "Stopping at 8"
        break
    fi
    echo "x = $x"
done
```

---

## 🔹 7. One-Liner in Terminal

```bash
until ping -c1 google.com &>/dev/null; do echo "No internet... retrying"; sleep 2; done
echo "Connected!"
```

---

## 🔹 8. Comparison with `while`

| Feature             | `while` loop                     | `until` loop                     |
| ------------------- | -------------------------------- | -------------------------------- |
| Condition           | Runs **while condition is true** | Runs **until condition is true** |
| Usage style         | "Do this as long as..."          | "Do this until..."               |
| Infinite by default | `while true; do ...; done`       | `until false; do ...; done`      |

---

✅ **Summary:**
Use **`while`** when you know what condition must stay true.
Use **`until`** when you want to wait for a condition to become true (e.g., file exists, process ends, internet available).
---


# 🔹 `break` and `continue` in Bash

---

## 🛑 1. `break` – Exit the Loop Immediately

* Ends the **current loop** entirely.
* Control moves to the next statement **after** the loop.

### Example: stop when number is 5

```bash
for i in {1..10}
do
    if [ $i -eq 5 ]; then
        echo "Breaking at $i"
        break
    fi
    echo "i = $i"
done
```

👉 Output:

```
i = 1
i = 2
i = 3
i = 4
Breaking at 5
```

---

## 🔄 2. `continue` – Skip Current Iteration

* Skips the **rest of the loop body** for the current iteration.
* Moves to the **next loop cycle**.

### Example: skip number 5

```bash
for i in {1..7}
do
    if [ $i -eq 5 ]; then
        echo "Skipping $i"
        continue
    fi
    echo "i = $i"
done
```

👉 Output:

```
i = 1
i = 2
i = 3
i = 4
Skipping 5
i = 6
i = 7
```

---

## 🔹 3. With `while` Loop

```bash
n=0
while [ $n -lt 7 ]
do
    ((n++))
    if [ $n -eq 3 ]; then
        echo "Continue at $n"
        continue
    fi
    if [ $n -eq 6 ]; then
        echo "Break at $n"
        break
    fi
    echo "n = $n"
done
```

---

## 🔹 4. With `until` Loop

```bash
x=0
until [ $x -ge 10 ]
do
    ((x++))
    if (( x == 4 )); then
        echo "Skipping $x"
        continue
    fi
    if (( x == 8 )); then
        echo "Breaking at $x"
        break
    fi
    echo "x = $x"
done
```

---

## 🔹 5. Nested Loops with `break n`

* You can specify a **numeric argument** to break out of **n levels** of loops.

```bash
for i in {1..3}; do
    for j in {1..3}; do
        if [ $j -eq 2 ]; then
            echo "Breaking both loops at i=$i, j=$j"
            break 2   # exit both loops
        fi
        echo "i=$i, j=$j"
    done
done
```

👉 Without `break 2`, only the inner loop would stop.

---

## 🔹 6. Real-Life Example (skip hidden files)

```bash
for file in *; do
    if [[ $file == .* ]]; then
        continue   # skip hidden files
    fi
    echo "Processing: $file"
done
```

---

✅ **Summary:**

* `break` → exit the loop completely
* `continue` → skip current iteration, go to next
* `break N` → exit multiple nested loops

```
init=0
while [[ $init -lt 10 ]];do
    ((init++))
    if [[ $init -eq 5 ]];then
        continue
    fi
    echo ${init}
done
```
```
init=0; while [[ $init -lt 10 ]]; do ((init++)); if [[ $init -eq 5 ]]; then continue; fi; echo $init; done
```
```
Here is the exact **Bash code** from the image provided:

```bash
#!/bin/bash
initNumber=1
while [[ ${initNumber} -lt 3 ]]
do
    for i in item1 item2 item3
    do
        echo "${initNumber} - ${i}"
        if [[ $i == item2 ]]
        then
            break 2
        fi
    done
    ((initNumber++))
done
```
```
#!/bin/bash
initNumber=1
while [[ ${initNumber} -lt 3 ]]
do
    for i in item1 item2 item3
    do
        echo "${initNumber} - ${i}"
        if [[ $i == item2 ]]
        then
            break 2
        fi
    done
    ((initNumber++))
done
```
