Absolutely! In **Bash scripting**, the **exit code** (also called **return status**) is one of the most fundamental concepts. It tells you whether a command **succeeded or failed**, and scripts often use it for **conditional logic**. Here’s a complete guide:

---

# 📌 **Exit Codes in Bash**

---

## 1. **What is an Exit Code?**

* Every command in Bash returns a number called the **exit code**.
* Convention:

  * `0` → Success
  * Non-zero → Failure or specific error

You can check it using the special variable `$?`.

```bash
#!/bin/bash
ls /tmp
echo "Exit code: $?"  # 0 if successful

ls /nonexistent
echo "Exit code: $?"  # non-zero (2)
```

---

## 2. **Using Exit Codes in Conditions**

```bash
#!/bin/bash
mkdir /tmp/testdir
if [[ $? -eq 0 ]]; then
    echo "Directory created successfully"
else
    echo "Failed to create directory"
fi
```

---

## 3. **Exit Codes in Scripts**

You can **set your own exit code** using the `exit` command:

```bash
#!/bin/bash
echo "Doing some task..."
if [[ $1 -eq 0 ]]; then
    echo "Everything OK"
    exit 0
else
    echo "Something went wrong"
    exit 1
fi
```

* Run `echo $?` after script finishes to see its exit code.

```bash
./myscript.sh 0
echo $?   # 0

./myscript.sh 1
echo $?   # 1
```

---

## 4. **Exit Codes in Functions**

```bash
#!/bin/bash
myfunc() {
    return 5
}

myfunc
echo "Function exit code: $?"
```

* `return` sets the exit code of a **function** (0-255).
* `$?` captures the exit code.

---

## 5. **Common Exit Codes**

| Code | Meaning                        |
| ---- | ------------------------------ |
| 0    | Success                        |
| 1    | General error                  |
| 2    | Misuse of shell builtins       |
| 126  | Command invoked cannot execute |
| 127  | Command not found              |
| 128  | Invalid argument to exit       |
| 130  | Script terminated by Ctrl+C    |
| 255  | Exit status out of range       |

> Note: Commands and programs may define their own codes.

---

## 6. **Exit on Errors Automatically**

* Use `set -e` to make the script exit immediately on any command failure:

```bash
#!/bin/bash
set -e
echo "This works"
ls /nonexistent  # Script stops here
echo "This will not run"
```

---

## 7. **Using Exit Codes in Pipelines**

* By default, `$?` returns the **exit code of the last command** in a pipeline.
* Use `set -o pipefail` to catch any failure in the pipeline:

```bash
#!/bin/bash
set -o pipefail
grep "foo" file.txt | sort
echo $?  # Non-zero if grep fails
```

---

## 8. **Summary**

* `$?` → exit code of last command
* `exit N` → exit code of script
* `return N` → exit code of function
* `0` → success, non-zero → error
* `set -e` + `set -o pipefail` → robust error handling

---

If you want, I can also make a **Markdown cheatsheet for Bash exit codes** including **common codes, examples, and traps** so it’s easy to reference.

Do you want me to do that?
