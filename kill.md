Good one 👍 — `kill -0` looks strange at first, but it’s very useful.

---

### 🔹 What `kill -0` does

* `kill` normally sends a signal to a process.
* `-0` is a **special signal number** that doesn’t actually kill anything.
* Instead, it just **checks if the process exists** and whether you have permission to signal it.

---

### 🔹 Syntax

```bash
kill -0 <pid>
```

* If the process exists → exit code `0` (success).
* If the process does **not** exist → exit code `1`.
* If the process exists but you don’t have permission → exit code `1` (with error message).

---

### 🔹 Example

```bash
sleep 1000 &
pid=$!

# Check if process is alive
if kill -0 "$pid" 2>/dev/null; then
    echo "Process $pid is still running"
else
    echo "Process $pid is not running"
fi
```

Output (before killing):

```
Process 12345 is still running
```

After `kill $pid`:

```
Process 12345 is not running
```

---

### 🔹 Common use case

It’s often used in **spinners/progress bars** to keep running while a background process is alive:

```bash
long_task &
pid=$!

while kill -0 "$pid" 2>/dev/null; do
    echo -ne "."
    sleep 1
done
echo " Done!"
```

---

👉 Do you want me to show you how `kill -0` compares with `ps -p <pid>` for process checking (since both are common in scripts)?
