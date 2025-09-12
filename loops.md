
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
