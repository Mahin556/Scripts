Got it 👍 You’re asking about **running processes/scripts in the background** in Linux/Bash. This is super important for long-running or scheduled tasks.

---

# ⚡ Running Processes in the Background (Bash/Linux)

---

## 🔹 1. Run a Command in Background with `&`

```bash
./myscript.sh &
```

* `&` sends it to the **background**.
* You can keep using the terminal.

Check jobs:

```bash
jobs
```

Bring it back to foreground:

```bash
fg %1
```

Send it back to background:

```bash
bg %1
```

---

## 🔹 2. Run a Command with `nohup`

```bash
nohup ./myscript.sh > output.log 2>&1 &
```

* `nohup` = "no hangup", prevents process from stopping if terminal closes.
* Redirects output to `nohup.out` (or your log file).

---

## 🔹 3. Run with `disown`

```bash
./myscript.sh &
disown
```

* Removes the job from shell’s job table.
* Process won’t stop even if you logout.

---

## 🔹 4. Using `screen`

```bash
screen -S mysession
./myscript.sh
```

* Detach: `Ctrl + A, D`
* Reattach: `screen -r mysession`

---

## 🔹 5. Using `tmux`

```bash
tmux new -s mysession
./myscript.sh
```

* Detach: `Ctrl + B, D`
* Reattach: `tmux attach -t mysession`

---

## 🔹 6. Scheduling with Background

Combine with **cron**:

```cron
0 1 * * * /home/user/myscript.sh > /home/user/myscript.log 2>&1 &
```

---

## 🔹 7. Check Running Background Jobs

* List jobs in current shell:

```bash
jobs -l
```

* Check all processes:

```bash
ps aux | grep myscript
```

* Monitor live:

```bash
top
htop   # if installed
```

---

## 🔹 8. Kill Background Jobs

```bash
kill -9 <PID>
```

Example:

```bash
ps aux | grep myscript
kill -9 12345
```

---

✅ **Summary:**

* `&` → quick background
* `nohup` or `disown` → survive logout
* `screen` / `tmux` → manage long sessions
* `cron` → automatic scheduling

---

👉 Do you want me to also show you **differences between `&`, `nohup`, `disown`, `screen`, and `tmux` in a comparison table**?
