
# 📝 Bash `if / elif / else / fi` Examples

---

## 🔹 1. Number Comparison

```bash
#!/bin/bash
num=42

if (( num < 10 )); then
    echo "Single digit"
elif (( num < 100 )); then
    echo "Two digits"
else
    echo "Three or more digits"
fi
```

**Output:**

```
Two digits
```

---

## 🔹 2. String Comparison

```bash
#!/bin/bash
name="Alice"

if [[ $name == "Bob" ]]; then
    echo "Hello Bob!"
elif [[ $name == "Alice" ]]; then
    echo "Hi Alice!"
else
    echo "I don't know you."
fi
```

**Output:**

```
Hi Alice!
```

---

## 🔹 3. File Check

```bash
#!/bin/bash
file="/etc/passwd"

if [[ -f $file ]]; then
    echo "$file is a regular file"
elif [[ -d $file ]]; then
    echo "$file is a directory"
else
    echo "$file does not exist"
fi
```

**Output (on Linux):**

```
/etc/passwd is a regular file
```

---

## 🔹 4. Command Success/Failure

```bash
#!/bin/bash

if ping -c1 -W1 google.com >/dev/null 2>&1; then
    echo "Internet is available"
elif ping -c1 -W1 8.8.8.8 >/dev/null 2>&1; then
    echo "Only IP ping works, maybe DNS issue"
else
    echo "No internet connection"
fi
```

---

## 🔹 5. Combining Conditions

```bash
#!/bin/bash
age=20
citizen="yes"

if [[ $age -ge 18 && $citizen == "yes" ]]; then
    echo "You can vote"
elif [[ $age -lt 18 ]]; then
    echo "Too young to vote"
else
    echo "You must be a citizen to vote"
fi
```

**Output:**

```
You can vote
```

---

## 🔹 6. Nested `if` Example

```bash
#!/bin/bash
file="script.sh"

if [[ -e $file ]]; then
    if [[ -x $file ]]; then
        echo "$file exists and is executable"
    else
        echo "$file exists but is not executable"
    fi
else
    echo "$file does not exist"
fi
```
```bash
#!/bin/bash
number=9

if [[ $number -gt 10 ]]
then
    if [[ $number -gt 50 ]]
    then
        if [[ $number -gt 100 ]]
        then
            echo "number is greater than 100"
        fi
    else
        echo "number is in between 11 to 50"
    fi
else
    echo "number is less than or equal to 10"
fi
```

---

## 🔹 7. One-liner `if`

```bash
[ -d "/etc" ] && echo "Directory exists" || echo "Directory missing"
```
```bash
ping -c 4 8.8.8.8 > /dev/null && echo "Internet is working"
```
```bash
ping -c 4 8.8.8.8 > /dev/null || echo "Internet is Not Working"
```

```bash
#!/bin/bash
name="Alice"

if grep -i localhost /etc/hosts; then
    echo "grep done"
else
    grep fail
fi
```
```bash
#!/bin/bash
name1="Alice"
#name2="Alice"
name2="Mahin"

if [[ ! $name1 == $name2 ]]; then
    echo "both are not equal"
else
    echo "both are equal"
fi
```
```bash
#!/bin/bash
OS_TYPE=$(uname)
if [[  ${OS_TYPE} == "Linux" && ${UID} -eq 0 ]]
then
  echo "user is root user and os is linux"
fi
```
```bash
#!/bin/bash

read -p "Do you want to continue (Y/y/yes) " uservalue

if [[ ${uservalue,,} == 'y' || ${uservalue,,} == 'yes' ]]
then
  echo "You want it."
else
  echo "You don't want it."
fi
```


