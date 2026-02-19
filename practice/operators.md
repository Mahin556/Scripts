
# 🔹 1. Arithmetic Operators

Used in `(( ))` or with `let`, `expr`, or `$(( ))`.

| Category       | Operator | Meaning               | Example               | Output / Explanation |
| -------------- | -------- | --------------------- | --------------------- | -------------------- |
| **Arithmetic** | `+`      | Addition              | `echo $((5+3))`       | `8`                  |
|                | `-`      | Subtraction           | `echo $((5-3))`       | `2`                  |
|                | `*`      | Multiplication        | `echo $((5*3))`       | `15`                 |
|                | `/`      | Division (integer)    | `echo $((5/3))`       | `1` (integer only)   |
|                | `%`      | Modulus               | `echo $((5%3))`       | `2`                  |
|                | `**`     | Exponent              | `echo $((2**3))`      | `8`                  |
|                | `++`     | Increment             | `((a++))`             | Increases after use  |
|                | `--`     | Decrement             | `((--a))`             | Decreases before use |
|                | `+=`     | Add & assign          | `((x+=3))`            | `x = x + 3`          |
|                | `-=`     | Subtract & assign     | `((x-=2))`            |                      |
|                | `*=`     | Multiply & assign     | `((x*=2))`            |                      |
|                | `/=`     | Divide & assign       | `((x/=2))`            |                      |
|                | `%=`     | Modulus & assign      | `((x%=2))`            |                      |
|                | `(( ))`  | Arithmetic evaluation | `((5>3)) && echo yes` | Prints yes           |

```
a=10; b=3

echo $((a + b))   # 13
echo $((a - b))   # 7
echo $((a * b))   # 30
echo $((a / b))   # 3
echo $((a % b))   # 1
echo $((a ** b))  # 1000

((a++))           # post-increment
((++a))           # pre-increment
((a--))           # post-decrement
((--a))           # pre-decrement
echo $a           # 11
```

---

# 🔹 2. Relational (Integer Comparison) Operators

Used inside `[[ ]]` or `(( ))`.

| Category               | Operator | Meaning            | Example       | Explanation |
| ---------------------- | -------- | ------------------ | ------------- | ----------- |
| **Integer Comparison** | `-eq`    | Equal              | `[ 5 -eq 5 ]` | True        |
|                        | `-ne`    | Not equal          | `[ 5 -ne 3 ]` | True        |
|                        | `-gt`    | Greater than       | `[ 5 -gt 3 ]` | True        |
|                        | `-lt`    | Less than          | `[ 3 -lt 5 ]` | True        |
|                        | `-ge`    | ≥                  | `[ 5 -ge 5 ]` | True        |
|                        | `-le`    | ≤                  | `[ 3 -le 5 ]` | True        |
|                        | `==`     | Equal (in `(( ))`) | `((5==5))`    | True        |

Example:

```bash
if [ "$a" -eq "$b" ]; then
  echo "Equal"
fi

x=5; y=8

if [[ a -gt b ]]; then     echo "a is greater"; else echo "b is greater";fi
if [[ a -gt b ]]; then     echo "a is greater";fi

[ $x -eq $y ] && echo "Equal" || echo "Not equal"
(( $a == $b )) && echo "Equal" || echo "Not equal"
[ $x -ne $y ] && echo "Not equal"
[ $x -gt $y ] && echo "x > y"
[ $x -lt $y ] && echo "x < y"
[ $x -ge 5 ] && echo "x >= 5"
[ $y -le 10 ] && echo "y <= 10"
```

---

# 🔹 3. String Operators

| Category             | Operator   | Meaning       | Example            | Explanation |
| -------------------- | ---------- | ------------- | ------------------ | ----------- |
| **String Operators** | `=` / `==` | Equal         | `[[ "a" == "a" ]]` | True        |
|                      | `!=`       | Not equal     | `[[ "a" != "b" ]]` | True        |
|                      | `<`        | ASCII less    | `[[ "a" < "b" ]]`  | True        |
|                      | `>`        | ASCII greater | `[[ "z" > "y" ]]`  | True        |
|                      | `-z`       | Empty string  | `[ -z "" ]`        | True        |
|                      | `-n`       | Not empty     | `[ -n "hello" ]`   | True        |
|                      | `-v`       | Var exist or not |  `[ -v name ]`  | True        |

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

| Category                          | Operator | Meaning      | Example                       | Explanation |
| --------------------------------- | -------- | ------------ | ----------------------------- | ----------- |
| **File Tests (Existence & Type)** | `-e`     | Exists       | `[ -e file ]`                 | File exists |
|                                   | `-f`     | Regular file | `[ -f file ]`                 |             |
|                                   | `-d`     | Directory    | `[ -d /etc ]`                 |             |
|                                   | `-L`     | Symlink      | `[ -L /bin/sh ]`              |             |
|                                   | `-b`     | Block device | `[ -b /dev/sda ]`             |             |
|                                   | `-c`     | Char device  | `[ -c /dev/tty ]`             |             |
|                                   | `-p`     | Named pipe   | `[ -p myfifo ]`               |             |
|                                   | `-S`     | Socket       | `[ -S /var/run/docker.sock ]` |             |


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
| Category             | Operator | Meaning    | Example          |
| -------------------- | -------- | ---------- | ---------------- |
| **File Permissions** | `-r`     | Readable   | `[ -r file ]`    |
|                      | `-w`     | Writable   | `[ -w file ]`    |
|                      | `-x`     | Executable | `[ -x /bin/ls ]` |
|                      | `-u`     | setuid bit | `[ -u file ]`    |
|                      | `-g`     | setgid bit | `[ -g file ]`    |
|                      | `-k`     | sticky bit | `[ -k file ]`    |


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
| Category             | Operator | Meaning             | Example               |
| -------------------- | -------- | ------------------- | --------------------- |
| **File Size / Time** | `-s`     | Size > 0            | `[ -s file ]`         |
|                      | `-nt`    | Newer than          | `[ file1 -nt file2 ]` |
|                      | `-ot`    | Older than          | `[ file1 -ot file2 ]` |
|                      | `-ef`    | Same inode          | `[ file1 -ef file2 ]` |
|                      | `-N`     | Modified since read | `[ -N file ]`         |


```
[ -s "$file" ] && echo "$file has content (size > 0)"

empty="empty.txt"
> "$empty"   # create empty file
[ ! -s "$empty" ] && echo "$empty is empty"
```

### File Ownership
| Category           | Operator | Meaning        | Example       |
| ------------------ | -------- | -------------- | ------------- |
| **File Ownership** | `-O`     | Owned by user  | `[ -O file ]` |
|                    | `-G`     | Owned by group | `[ -G file ]` |


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
| Category              | Operator | Meaning         | Example                    |    |              |   |             |
| --------------------- | -------- | --------------- | -------------------------- | -- | ------------ | - | ----------- |
| **Logical Operators** | `!`      | NOT             | `[[ ! 5 -eq 3 ]]`          |    |              |   |             |
|                       | `&&`     | AND             | `[[ 5 -gt 3 && 2 -lt 4 ]]` |    |              |   |             |
|                       | `        |                 | `                          | OR | `[[ 5 -gt 10 |   | 2 -lt 4 ]]` |
|                       | `-a`     | AND (old style) | `[ 5 -gt 3 -a 2 -lt 4 ]`   |    |              |   |             |
|                       | `-o`     | OR (old style)  | `[ 5 -gt 10 -o 2 -lt 4 ]`  |    |              |   |             |


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

# 🔹 7. Conditional Expression Operators

| Category                    | Operator | Meaning         | Example           |
| --------------------------- | -------- | --------------- | ----------------- |
| **Conditional Expressions** | `[[ ]]`  | Advanced test   | `[[ $a == 5 ]]`   |
|                             | `(( ))`  | Arithmetic test | `(( a > b ))`     |
|                             | `?:`     | Ternary         | `((a>b ? 1 : 0))` |

```
a=7; b=3

((a > b)) && echo "a is greater"

# Using [[ ]]
[[ $a == 7 && $b == 3 ]] && echo "Match"

# Ternary (inside arithmetic)
result=((a > b ? 100 : 200))
echo $result   # 100
```

---

# 🔹 8. Pattern Matching / Regex Operators

* `[[ $var == pattern ]]` → glob matching (e.g., `*.txt`).
* `[[ $var =~ regex ]]` → regex match.

| Category             | Operator   | Meaning     | Example                 |
| -------------------- | ---------- | ----------- | ----------------------- |
| **Pattern Matching** | `== *.txt` | Glob match  | `[[ file == *.txt ]]`   |
|                      | `=~ regex` | Regex match | `[[ 123 =~ ^[0-9]+$ ]]` |


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

| Category                     | Operator | Meaning     | Example                |
| ---------------------------- | -------- | ----------- | ---------------------- |
| **Bitwise (inside `(( ))`)** | `&`      | AND         | `echo $((6 & 3))` → 2  |
|                              | `\|`     | OR          | `echo $((6 \| 3))` → 7 |
|                              | `^`      | XOR         | `echo $((6 ^ 3))` → 5  |
|                              | `~`      | NOT         | `echo $((~6))`         |
|                              | `<<`     | Left shift  | `echo $((6 << 1))`     |
|                              | `>>`     | Right shift | `echo $((6 >> 1))`     |

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
