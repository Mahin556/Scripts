Got it ✅ Let’s go through **scheduling tasks with `at` in Bash/Linux** in full detail. The `at` command is used for **one-time scheduling of tasks** at a specified time. Unlike `cron`, which is recurring, `at` runs a job only once.

---

# 📌 Scheduling with `at` in Linux

---

## 1. **Check if `at` is installed & enabled**

On RHEL/HPC systems, sometimes it’s not installed by default.

```bash
sudo yum install at -y   # RHEL / CentOS
sudo systemctl enable --now atd
systemctl status atd     # should be active
```

`atd` is the **daemon** that executes scheduled `at` jobs.

---

## 2. **Basic Syntax**

```bash
at TIME
```

Then type commands, and press **Ctrl+D** to save.

Example:

```bash
$ at 10:30
at> echo "Job executed at $(date)" >> ~/job.log
at> <Ctrl+D>
job 1 at Sat Sep 13 10:30:00 2025
```

---

## 3. **Time Formats Supported**

`at` accepts flexible time formats:

* **Exact time:**

  ```bash
  at 10:30
  at 23:59
  ```

* **With AM/PM:**

  ```bash
  at 5pm
  at 11am
  ```

* **Relative times:**

  ```bash
  at now + 1 hour
  at now + 2 days
  at now + 3 weeks
  ```

* **Specific date:**

  ```bash
  at 10:30 09/14/2025
  at 5pm tomorrow
  at midnight
  at teatime   # 4pm
  ```

---

## 4. **Submitting Jobs Non-Interactively**

You can echo commands into `at`:

```bash
echo "echo Hello >> ~/at_test.log" | at now + 1 minute
```

Or use a script:

```bash
at -f myscript.sh 2pm
```

---

## 5. **Managing Jobs**

* **List jobs:**

  ```bash
  atq
  ```

* **Remove a job:**

  ```bash
  atrm <job_id>
  ```

Example:

```bash
$ atq
2  Sat Sep 13 22:00:00 2025 a user
$ atrm 2
```

---

## 6. **Output of at jobs**

* By default, output is sent via **mail** to the user.
* To redirect output, use `>`, `>>`, or `2>&1` inside your command.

Example:

```bash
echo "echo Job run at $(date) >> ~/job.log" | at now + 1 min
```

---

## 7. **Access Control**

Access to `at` is controlled by:

* `/etc/at.allow` → users allowed to use `at`
* `/etc/at.deny` → users denied access

If neither file exists, only `root` can use `at`.

---

## 8. **Practical Examples**

### Schedule system shutdown at midnight

```bash
echo "sudo shutdown -h now" | at midnight
```

### Run backup script tomorrow at 2 AM

```bash
at -f /home/user/backup.sh 2am tomorrow
```

### Run job in 10 minutes

```bash
echo "tar -czf /tmp/backup.tar.gz /home/user" | at now + 10 minutes
```

---

## 9. **Difference Between `at` and `cron`**

* `at` → one-time tasks
* `cron` → repetitive/scheduled tasks

---

✅ **Summary**

* `at TIME` → schedule a job once
* `at -f script.sh TIME` → run script at time
* `atq` → list jobs
* `atrm <jobid>` → remove jobs
* `atd` daemon must be running

---

Would you like me to also include **`batch`**, which is like `at` but schedules jobs to run when system load is low (useful in HPC systems)?
