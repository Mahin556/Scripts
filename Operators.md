
# 🔹 1. Arithmetic Operators

Used in `(( ))` or with `let`, `expr`, or `$(( ))`.

| Operator | Meaning              |
| -------- | -------------------- |
| `+`      | Addition             |
| `-`      | Subtraction          |
| `*`      | Multiplication       |
| `/`      | Division             |
| `%`      | Modulus (remainder)  |
| `**`     | Exponentiation       |
| `++`     | Increment (pre/post) |
| `--`     | Decrement (pre/post) |

```
a=10; b=3

echo $((a + b))   # 13
echo $((a - b))   # 7
echo $((a * b))   # 30
echo $((a / b))   # 3
echo $((a % b))   # 1
echo $((a ** b))  # 1000

((a++))           # post-increment
echo $a           # 11
```

---

# 🔹 2. Relational (Integer Comparison) Operators

Used inside `[[ ]]` or `(( ))`.

| Operator | Meaning                  |
| -------- | ------------------------ |
| `-eq`    | Equal to                 |
| `-ne`    | Not equal to             |
| `-gt`    | Greater than             |
| `-lt`    | Less than                |
| `-ge`    | Greater than or equal to |
| `-le`    | Less than or equal to    |

Example:

```bash
if [ "$a" -eq "$b" ]; then
  echo "Equal"
fi

x=5; y=8

[ $x -eq $y ] && echo "Equal" || echo "Not equal"
[ $x -ne $y ] && echo "Not equal"
[ $x -gt $y ] && echo "x > y"
[ $x -lt $y ] && echo "x < y"
[ $x -ge 5 ] && echo "x >= 5"
[ $y -le 10 ] && echo "y <= 10"
```

---

# 🔹 3. String Operators

| Operator    | Meaning                        |
| ----------- | ------------------------------ |
| `=` or `==` | Strings are equal              |
| `!=`        | Strings are not equal          |
| `<`         | String is less than (ASCII)    |
| `>`         | String is greater than (ASCII) |
| `-z str`    | String is empty                |
| `-n str`    | String is not empty            |

Example:

```bash
if [[ $a == "hello" ]]; then echo "Match"; fi

s1="hello"
s2="world"

[ "$s1" = "hello" ] && echo "Equal"
[ "$s1" != "$s2" ] && echo "Not equal"
[[ "a" < "b" ]] && echo "a < b"
[[ "z" > "y" ]] && echo "z > y"
[ -z "" ] && echo "String is empty"
[ -n "$s1" ] && echo "String is not empty"

```

---

# 🔹 4. File Test Operators

### File Existence & Type
| Operator  | Test                                                     |
| --------- | -------------------------------------------------------- |
| `-e file` | File exists                                              |
| `-a file` | File exists (same as `-e`, but **deprecated**)           |
| `-f file` | File is a **regular file**                               |
| `-d file` | File is a **directory**                                  |
| `-b file` | File is a **block device** (e.g. disk)                   |
| `-c file` | File is a **character device** (e.g. terminal, keyboard) |
| `-p file` | File is a **named pipe (FIFO)**                          |
| `-S file` | File is a **socket**                                     |
| `-L file` | File is a **symbolic link**                              |

```
file="/etc/passwd"

[ -e "$file" ] && echo "$file exists"
[ -a "$file" ] && echo "$file exists (using -a)"
[ -f "$file" ] && echo "$file is a regular file"
[ -d "/etc" ] && echo "/etc is a directory"
[ -L "/bin/sh" ] && echo "/bin/sh is a symlink"
[ -b "/dev/sda" ] && echo "/dev/sda is a block device"
[ -c "/dev/tty" ] && echo "/dev/tty is a character device"
[ -p "/tmp/myfifo" ] && echo "/tmp/myfifo is a named pipe"
[ -S "/var/run/docker.sock" ] && echo "Docker socket exists"

```

### File Permissions
| Operator  | Test                        |
| --------- | --------------------------- |
| `-r file` | File is **readable**        |
| `-w file` | File is **writable**        |
| `-x file` | File is **executable**      |
| `-u file` | File has **setuid** bit set |
| `-g file` | File has **setgid** bit set |
| `-k file` | File has **sticky bit** set |

```
[ -r "$file" ] && echo "$file is readable"
[ -w "$file" ] && echo "$file is writable"
[ -x "/bin/ls" ] && echo "/bin/ls is executable"

# Special permission bits
touch testfile
chmod u+s testfile
[ -u testfile ] && echo "Setuid bit is set"

chmod g+s testfile
[ -g testfile ] && echo "Setgid bit is set"

chmod +t testfile
[ -k testfile ] && echo "Sticky bit is set"
rm testfile
```

### File Size & Content
| Operator  | Test                               |
| --------- | ---------------------------------- |
| `-s file` | File size is **greater than zero** |

```
[ -s "$file" ] && echo "$file has content (size > 0)"

empty="empty.txt"
> "$empty"   # create empty file
[ ! -s "$empty" ] && echo "$empty is empty"
```

### File Ownership
| Operator  | Test                                      |
| --------- | ----------------------------------------- |
| `-O file` | File is **owned by current user**         |
| `-G file` | File is **owned by current user’s group** |

```
[ -O "$file" ] && echo "$file is owned by current user"
[ -G "$file" ] && echo "$file is owned by current group"
```

### File Timestamps
| Operator          | Test                                                            |
| ----------------- | --------------------------------------------------------------- |
| `file1 -nt file2` | `file1` is **newer** than `file2` (based on modification time)  |
| `file1 -ot file2` | `file1` is **older** than `file2`                               |
| `file1 -ef file2` | `file1` and `file2` are the **same file** (same device & inode) |
| `-N file`         | File was **modified since last read**                           |

```
file1="/etc/passwd"
file2="/etc/hosts"

[ "$file1" -nt "$file2" ] && echo "$file1 is newer than $file2"
[ "$file1" -ot "$file2" ] && echo "$file1 is older than $file2"
[ "$file1" -ef "$file1" ] && echo "$file1 and itself are the same file"

cp "$file1" copy.txt
[ -N copy.txt ] && echo "copy.txt was modified since last read"
```

### Examples
```bash
#!/bin/bash

file="/etc/passwd"

if [ -f "$file" ]; then
  echo "$file is a regular file"
fi

if [ -r "$file" ] && [ -w "$file" ]; then
  echo "$file is readable and writable"
fi

if [ -d "/tmp" ]; then
  echo "/tmp is a directory"
fi

if [ "$file" -nt "/etc/hosts" ]; then
  echo "$file is newer than /etc/hosts"
fi
```

---

# 🔹 5. Logical Operators

| Operator | Meaning                          |    |                                 |
| -------- | -------------------------------- | -- | ------------------------------- |
| `! expr` | NOT                              |    |                                 |
| `-a`     | AND (inside `[ ]`)               |    |                                 |
| `-o`     | OR (inside `[ ]`)                |    |                                 |
| `&&`     | AND (inside `[[ ]]` or commands) |    |                                 |
| \`       |                                  | \` | OR (inside `[[ ]]` or commands) |

```
a=5; b=10

# AND
[[ $a -lt 10 && $b -gt 5 ]] && echo "Both true"

# OR
[[ $a -lt 10 || $b -lt 5 ]] && echo "At least one true"

# NOT
[[ ! $a -eq 10 ]] && echo "Not equal to 10"
```

---

# 🔹 6. Assignment Operators

| Operator | Meaning             |
| -------- | ------------------- |
| `=`      | Assign              |
| `+=`     | Add and assign      |
| `-=`     | Subtract and assign |
| `*=`     | Multiply and assign |
| `/=`     | Divide and assign   |
| `%=`     | Modulus and assign  |

```
x=5

((x+=3))   # x = x+3
echo $x   # 8

((x-=2))   # x = x-2
echo $x   # 6

((x*=2))   # x = x*2
echo $x   # 12

((x/=3))   # x = x/3
echo $x   # 4

((x%=3))   # x = x%3
echo $x   # 1
```

---

# 🔹 7. Conditional Expression Operators

Used in `[[ ]]` and `(( ))`.

| Operator     | Meaning                              |
| ------------ | ------------------------------------ |
| `(( expr ))` | Arithmetic evaluation                |
| `[[ expr ]]` | Advanced conditional test            |
| `? :`        | Ternary conditional (inside `(( ))`) |

```
a=7; b=3

((a > b)) && echo "a is greater"

# Using [[ ]]
[[ $a == 7 && $b == 3 ]] && echo "Match"

# Ternary (inside arithmetic)
(( result = (a > b ? 100 : 200) ))
echo $result   # 100
```

---

# 🔹 8. Pattern Matching / Regex Operators

* `[[ $var == pattern ]]` → glob matching (e.g., `*.txt`).
* `[[ $var =~ regex ]]` → regex match.

Example:

```bash
if [[ $str =~ ^[0-9]+$ ]]; then echo "Number"; fi

file="notes.txt"

[[ $file == *.txt ]] && echo "Ends with .txt"

str="12345"
[[ $str =~ ^[0-9]+$ ]] && echo "Only digits"
```

---

# 🔹 9. Bitwise Operators (inside `(( ))`)

| Operator | Meaning     |            |
| -------- | ----------- | ---------- |
| `&`      | Bitwise AND |            |
| \`       | \`          | Bitwise OR |
| `^`      | Bitwise XOR |            |
| `~`      | Bitwise NOT |            |
| `<<`     | Left shift  |            |
| `>>`     | Right shift |            |

```
a=6   # 110 in binary
b=3   # 011 in binary

echo $((a & b))   # 2 (AND)
echo $((a | b))   # 7 (OR)
echo $((a ^ b))   # 5 (XOR)
echo $((~a))      # -7 (NOT)
echo $((a << 1))  # 12 (shift left)
echo $((a >> 1))  # 3  (shift right)
```
