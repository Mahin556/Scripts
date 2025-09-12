Absolutely! Bash **debugging** is crucial to figure out why a script isn’t working as expected. Bash provides **built-in options and techniques** to debug scripts. I’ll give you a **complete, structured guide**.

---

# 📌 **Debugging in Bash Scripts**

---

## 1. **Run Bash in Debug Mode**

### a) `-x` option

Prints each command before executing it, showing how variables are expanded.

```bash
bash -x script.sh
```

**Example:**

```bash
#!/bin/bash
NAME="Mahin"
echo "Hello $NAME"
```

Run with debug:

```bash
bash -x script.sh
```

Output:

```
+ NAME=Mahin
+ echo 'Hello Mahin'
Hello Mahin
```

---

### b) `-v` option

Prints each line **as it is read**, before execution.

```bash
bash -v script.sh
```

---

### c) `-n` option

Syntax check only; does **not execute** the script.

```bash
bash -n script.sh
```

---

## 2. **Use `set` Built-in for Debugging**

### a) `set -x` / `set +x`

Turn on/off debug mode **inside the script**:

```bash
#!/bin/bash
echo "Before debug"

set -x   # Start debugging
VAR=5
echo "Value of VAR: $VAR"
set +x   # Stop debugging

echo "After debug"
```

---

### b) `set -e`

Exit the script immediately if any command returns a non-zero status.

```bash
#!/bin/bash
set -e
echo "Step 1"
ls non_existing_file   # Script stops here
echo "Step 2"
```

---

### c) `set -u`

Treat unset variables as an error:

```bash
#!/bin/bash
set -u
echo $UNDEFINED_VAR   # Error
```

---

### d) Combine flags

```bash
set -euxo pipefail
```

* `-e` → exit on error
* `-u` → treat unset variables as errors
* `-x` → print commands before executing
* `-o pipefail` → fail if any command in a pipeline fails

---

## 3. **Trace Execution with `PS4`**

You can customize the prefix for `-x` output:

```bash
#!/bin/bash
export PS4='+ ${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '
set -x
myfunc() {
  echo "Inside function"
}
myfunc
```

Output will show **file name, line number, function name** for each command.

---

## 4. **Debugging Loops and Functions**

Use `set -x` locally:

```bash
#!/bin/bash
myfunc() {
  set -x
  for i in {1..3}; do
    echo "Loop $i"
  done
  set +x
}
myfunc
```

---

## 5. **Using `trap` for Debugging**

Run a command when an error or signal occurs.

```bash
#!/bin/bash
trap 'echo "Error at line $LINENO"' ERR
false   # triggers trap
```

* `$LINENO` → line number where error occurred
* `$BASH_COMMAND` → command being executed

Example:

```bash
trap 'echo "Command failed: $BASH_COMMAND at line $LINENO"' ERR
```

---

## 6. **Debugging Input/Output**

* Print variables with `echo` or `printf`
* Check if commands return expected values
* Use `set -x` around suspect sections

---

## 7. **Debugging Tips**

1. Use small test scripts to isolate the problem.
2. Test loops and conditionals separately.
3. Redirect debug output to a file:

```bash
bash -x script.sh > debug.log 2>&1
```

4. Combine `-x` and `-v` for maximum verbosity.
5. Use `shellcheck` (external tool) for static analysis:

```bash
shellcheck script.sh
```

---

✅ **Summary**

* `bash -x`, `set -x` → trace commands
* `set -e`, `set -u`, `set -o pipefail` → stop on errors
* `trap` → catch errors or signals
* `PS4` → detailed debug info
* `shellcheck` → static syntax and style checking

---

If you want, I can make a **Markdown cheatsheet** with **all Bash debugging commands, flags, and traps**, ready for reference.

Do you want me to do that?
