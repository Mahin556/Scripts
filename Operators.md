
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

### File Permissions
| Operator  | Test                        |
| --------- | --------------------------- |
| `-r file` | File is **readable**        |
| `-w file` | File is **writable**        |
| `-x file` | File is **executable**      |
| `-u file` | File has **setuid** bit set |
| `-g file` | File has **setgid** bit set |
| `-k file` | File has **sticky bit** set |

### File Size & Content
| Operator  | Test                               |
| --------- | ---------------------------------- |
| `-s file` | File size is **greater than zero** |

### File Ownership
| Operator  | Test                                      |
| --------- | ----------------------------------------- |
| `-O file` | File is **owned by current user**         |
| `-G file` | File is **owned by current user’s group** |

### File Timestamps
| Operator          | Test                                                            |
| ----------------- | --------------------------------------------------------------- |
| `file1 -nt file2` | `file1` is **newer** than `file2` (based on modification time)  |
| `file1 -ot file2` | `file1` is **older** than `file2`                               |
| `file1 -ef file2` | `file1` and `file2` are the **same file** (same device & inode) |
| `-N file`         | File was **modified since last read**                           |

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

---

# 🔹 7. Conditional Expression Operators

Used in `[[ ]]` and `(( ))`.

| Operator     | Meaning                              |
| ------------ | ------------------------------------ |
| `(( expr ))` | Arithmetic evaluation                |
| `[[ expr ]]` | Advanced conditional test            |
| `? :`        | Ternary conditional (inside `(( ))`) |

---

# 🔹 8. Pattern Matching / Regex Operators

* `[[ $var == pattern ]]` → glob matching (e.g., `*.txt`).
* `[[ $var =~ regex ]]` → regex match.

Example:

```bash
if [[ $str =~ ^[0-9]+$ ]]; then echo "Number"; fi
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

