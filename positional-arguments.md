
### 📌 **Basic Positional Parameters**

* `$0` → The name of the script (or function).
* `$1` → First argument.
* `$2` → Second argument.
* `$3` → Third argument.
* … up to `$9`.

If you have more than 9 arguments, you need to use **`${10}`, `${11}`, …** (with braces).

---

### 📌 **Special Parameters**

* `$#` → Number of positional arguments (excluding `$0`).
* `$*` → All arguments as a **single word** (expanded as `"$1 $2 $3 …"`).
* `$@` → All arguments as **separate words** (expanded as `"$1" "$2" "$3" …"`).
* `"$*"` → All arguments quoted into **one string**.
* `"$@"` → All arguments quoted **individually** (preferred in loops).
* `$$` → Process ID of the current script.
* `$?` → Exit status of the last command.
* `$!` → PID of the last background process.
* `$_` → Last argument of the previous command.

---

### 📌 Example Script

```bash
#!/bin/bash
echo "Script name: $0"
echo "1st argument: $1"
echo "2nd argument: $2"
echo "Total arguments: $#"

echo "All arguments using * : $*"
echo "All arguments using @ : $@"

echo "Quoted * : \"$*\""
echo "Quoted @ : \"$@\""

for arg in "$@"; do
  echo "Argument: $arg"
done
```

Run with:

```bash
./myscript.sh apple banana "cherry pie"
```

Output:

```
Script name: ./myscript.sh
1st argument: apple
2nd argument: banana
Total arguments: 3
All arguments using * : apple banana cherry pie
All arguments using @ : apple banana cherry pie
Quoted * : "apple banana cherry pie"
Quoted @ : "apple" "banana" "cherry pie"
Argument: apple
Argument: banana
Argument: cherry pie
```

