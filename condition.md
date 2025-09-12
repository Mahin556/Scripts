# 📝 Bash Conditions – Complete Reference

---

## 🔹 1. Condition Structures

### **if / elif / else**

```bash
if [[ $a -gt 10 ]]; then
  echo "Greater than 10"
elif [[ $a -eq 10 ]]; then
  echo "Exactly 10"
else
  echo "Less than 10"
fi
```

### **case (pattern matching)**

```bash
case $fruit in
  apple) echo "It's an apple" ;;
  banana|mango) echo "Banana or mango" ;;
  *) echo "Unknown fruit" ;;
esac
```

### **Ternary (arithmetic context only)**

```bash
(( result = a > b ? 1 : 0 ))
```

---

## 🔹 2. Condition Syntax Variants

| Syntax       | Usage                                                               |
| ------------ | ------------------------------------------------------------------- |
| `[ expr ]`   | Classic test (POSIX, requires spaces)                               |
| `[[ expr ]]` | Extended test (Bash-only, safer, supports regex & pattern matching) |
| `(( expr ))` | Arithmetic evaluation                                               |
| `test expr`  | Same as `[ expr ]`                                                  |

---

## 🔹 3. Boolean Logic

| Operator | Meaning          | Example                |    |              |   |            |
| -------- | ---------------- | ---------------------- | -- | ------------ | - | ---------- |
| `!`      | NOT              | `[ ! -f file ]`        |    |              |   |            |
| `&&`     | AND              | `[[ -f f1 && -f f2 ]]` |    |              |   |            |
| \`       |                  | \`                     | OR | \`\[\[ -f f1 |   | -f f2 ]]\` |
| `-a`     | AND (deprecated) | `[ -r f1 -a -w f1 ]`   |    |              |   |            |
| `-o`     | OR (deprecated)  | `[ -r f1 -o -w f1 ]`   |    |              |   |            |

---

## 🔹 4. Integer Comparisons

| Operator | Meaning       | Example         |
| -------- | ------------- | --------------- |
| `-eq`    | Equal         | `[ $a -eq $b ]` |
| `-ne`    | Not equal     | `[ $a -ne $b ]` |
| `-gt`    | Greater       | `[ $a -gt $b ]` |
| `-lt`    | Less          | `[ $a -lt $b ]` |
| `-ge`    | Greater/equal | `[ $a -ge $b ]` |
| `-le`    | Less/equal    | `[ $a -le $b ]` |

Also valid in arithmetic:

```bash
(( a > b ))
(( a == b ))
(( a <= b ))
```

---

## 🔹 5. String Comparisons

| Operator    | Meaning         | Example             |
| ----------- | --------------- | ------------------- |
| `=` or `==` | Equal           | `[[ $s == "foo" ]]` |
| `!=`        | Not equal       | `[[ $s != "bar" ]]` |
| `<`         | Less (ASCII)    | `[[ $s1 < $s2 ]]`   |
| `>`         | Greater (ASCII) | `[[ $s1 > $s2 ]]`   |
| `-z str`    | Empty           | `[[ -z $s ]]`       |
| `-n str`    | Non-empty       | `[[ -n $s ]]`       |

---

## 🔹 6. File Test Conditions

| Operator          | Test                     |
| ----------------- | ------------------------ |
| `-e file`         | Exists                   |
| `-f file`         | Regular file             |
| `-d dir`          | Directory                |
| `-L file`         | Symlink                  |
| `-r file`         | Readable                 |
| `-w file`         | Writable                 |
| `-x file`         | Executable               |
| `-s file`         | Size > 0                 |
| `-O file`         | Owned by user            |
| `-G file`         | Owned by group           |
| `-b file`         | Block device             |
| `-c file`         | Char device              |
| `-p file`         | Named pipe               |
| `-S file`         | Socket                   |
| `-u file`         | Setuid bit               |
| `-g file`         | Setgid bit               |
| `-k file`         | Sticky bit               |
| `file1 -nt file2` | Newer                    |
| `file1 -ot file2` | Older                    |
| `file1 -ef file2` | Same file                |
| `-N file`         | Modified since last read |

---

## 🔹 7. Pattern Matching

### **Glob (wildcards)**

```bash
[[ $file == *.txt ]] && echo "Text file"
[[ $var == a* ]] && echo "Starts with a"
```

### **Regex**

```bash
[[ $str =~ ^[0-9]+$ ]] && echo "Number"
[[ $email =~ ^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$ ]] && echo "Valid email"
```

---

## 🔹 8. Arithmetic Conditions

Inside `(( ))`:

```bash
a=5; b=3

(( a > b )) && echo "a > b"
(( (a+b) % 2 == 0 )) && echo "Sum is even"
```

---

## 🔹 9. Command Exit Status Conditions

Every command has an exit status (`$?`).

```bash
ls /etc >/dev/null
if [ $? -eq 0 ]; then
  echo "ls succeeded"
else
  echo "ls failed"
fi
```

Shortcut:

```bash
if ls /etc >/dev/null; then
  echo "Success"
fi
```

---

## 🔹 10. Short-Circuit Conditions

```bash
[ -f /etc/passwd ] && echo "Exists"
[ -f /not/here ] || echo "Does not exist"
```

---

## 🔹 11. Advanced Tricks

* **Negation inside `[[ ]]`**

```bash
[[ ! -e file ]] && echo "File missing"
```

* **Combine multiple tests**

```bash
if [[ -n $user && $uid -gt 1000 ]]; then
  echo "Normal user"
fi
```

* **Using variables in regex**

```bash
re='^[0-9]{3}$'
[[ $id =~ $re ]] && echo "3-digit number"
```

* **Arithmetic + condition**

```bash
(( (count++ % 2) == 0 )) && echo "Even run"
```

---

✅ **Summary**:
Bash supports conditions using:

* `if/elif/else`, `case`, ternary
* `[ ]`, `[[ ]]`, `(( ))`, `test`
* Boolean operators (`!`, `&&`, `||`)
* Integer, string, file test operators
* Pattern (`*`, `?`) and regex (`=~`)
* Command exit codes & short-circuiting

# 📝 Bash `if` / `elif` / `fi`

---

## 🔹 1. Basic Syntax

```bash
if [ condition ]; then
    # commands to execute if condition is true
fi
```

* **`[ condition ]`** → Classic test (POSIX)
* **`[[ condition ]]`** → Extended Bash test (supports regex & pattern matching)
* **`(( condition ))`** → Arithmetic evaluation

`fi` closes the `if` block (it's `if` backward).

---

## 🔹 2. `if ... else` Syntax

```bash
if [ condition ]; then
    # if branch
else
    # else branch
fi
```

Example:

```bash
#!/bin/bash
a=5
if [ $a -gt 10 ]; then
    echo "Greater than 10"
else
    echo "10 or less"
fi
```

Output:

```
10 or less
```

---

## 🔹 3. `if ... elif ... else ... fi` Syntax

```bash
if [ condition1 ]; then
    # commands if condition1 is true
elif [ condition2 ]; then
    # commands if condition2 is true
else
    # commands if all above conditions are false
fi
```

Example:

```bash
#!/bin/bash
a=15
if [ $a -lt 10 ]; then
    echo "Less than 10"
elif [ $a -eq 15 ]; then
    echo "Equal to 15"
else
    echo "Greater than 10 but not 15"
fi
```

Output:

```
Equal to 15
```

---

## 🔹 4. Using `[[ ]]` for safer checks

```bash
if [[ $name == "Alice" ]]; then
    echo "Hello Alice"
elif [[ $name == "Bob" ]]; then
    echo "Hello Bob"
else
    echo "Who are you?"
fi
```

* Supports **string pattern matching** (`==`, `!=`)
* Supports **regex** (`=~`)

---

## 🔹 5. Using `(( ))` for arithmetic conditions

```bash
x=7
if (( x > 10 )); then
    echo "x > 10"
elif (( x == 7 )); then
    echo "x is 7"
else
    echo "x < 10 and not 7"
fi
```

---

## 🔹 6. Combining conditions with logical operators

```bash
a=5; b=8

if [[ $a -lt 10 && $b -gt 5 ]]; then
    echo "Both conditions true"
elif [[ $a -eq 5 || $b -eq 10 ]]; then
    echo "At least one true"
else
    echo "None true"
fi
```

---

## 🔹 7. Nesting `if` statements

```bash
if [ -f "/etc/passwd" ]; then
    if [ -r "/etc/passwd" ]; then
        echo "File exists and is readable"
    fi
fi
```

---

## 🔹 8. One-liner `if` statements

```bash
[ -f "/etc/passwd" ] && echo "File exists" || echo "File missing"
```

---

✅ **Key points**:

* Always close `if` with `fi`.
* Use `[ ]` for POSIX tests, `[[ ]]` for Bash extended tests, `(( ))` for arithmetic.
* Combine multiple `elif` branches for multiple conditions.
* Logical operators (`&&`, `||`) can simplify simple checks.


