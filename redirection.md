
### 1. `>`

Redirects **stdout (1)** to a file.

```bash
ls > out.txt
```

* Standard output (successful results) goes into `out.txt`.
* Errors still appear on the terminal.

---

### 2. `2>`

Redirects **stderr (2)** to a file.

```bash
ls notexist 2> err.txt
```

* Error messages go into `err.txt`.
* Normal output still goes to the terminal.

---

### 3. `&>`

Redirects **both stdout and stderr** to the same file (Bash/Zsh shortcut).

```bash
ls existing notexist &> all.txt
```

* Both output and errors go into `all.txt`.

Equivalent to:

```bash
ls existing notexist > all.txt 2>&1
```

---

### 4. `2>1`

⚠️ Common mistake!
This means:

* Redirect `stderr (2)` to a file literally named `1` (not to stdout).

```bash
ls notexist 2>1
```

* Creates a file `1` with the error output.
* Stdout still prints to terminal.

---

### 5. `2>&1`

This is the **proper way** to merge stderr into stdout.

* `>&` means "make file descriptor point to another descriptor".

```bash
ls existing notexist > all.txt 2>&1
```

Steps:

1. `> all.txt` → stdout goes into `all.txt`.
2. `2>&1` → stderr is redirected to **where stdout is currently going** (which is `all.txt`).

So both stdout and stderr go into `all.txt`.

---

✅ **Summary Table**

| Operator | Meaning                                         |
| -------- | ----------------------------------------------- |
| `>`      | Redirect stdout only                            |
| `2>`     | Redirect stderr only                            |
| `&>`     | Redirect both stdout and stderr (Bash shortcut) |
| `2>1`    | Redirect stderr to file named `1`               |
| `2>&1`   | Redirect stderr to wherever stdout goes         |

