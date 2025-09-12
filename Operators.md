
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

Used to check files, directories, permissions, etc.

| Operator          | Test                        |
| ----------------- | --------------------------- |
| `-e file`         | File exists                 |
| `-f file`         | Regular file exists         |
| `-d dir`          | Directory exists            |
| `-L file`         | Symbolic link               |
| `-r file`         | File is readable            |
| `-w file`         | File is writable            |
| `-x file`         | File is executable          |
| `-s file`         | File size > 0               |
| `-O file`         | File owned by current user  |
| `-G file`         | File owned by current group |
| `file1 -nt file2` | file1 is newer than file2   |
| `file1 -ot file2` | file1 is older than file2   |

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

