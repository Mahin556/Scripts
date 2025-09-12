

# ⏰ Cron & Scheduling in Bash

---

## 🔹 1. What is Cron?

* **cron** = time-based job scheduler in Unix/Linux.
* Runs background process `crond` to execute commands or scripts at scheduled times.
* Jobs are defined in **crontab** (cron table).

---

## 🔹 2. Crontab Format

Each cron job has **5 fields + command**:

```
* * * * * command-to-execute
| | | | |
| | | | └── Day of week (0-6, Sun=0)
| | | └──── Month (1-12)
| | └────── Day of month (1-31)
| └──────── Hour (0-23)
└────────── Minute (0-59)
```

---

## 🔹 3. Examples

### Every minute

```cron
* * * * * echo "Hello" >> /tmp/hello.log
```

### Every day at 2:30 AM

```cron
30 2 * * * /home/user/backup.sh
```

### Every Monday at 5 PM

```cron
0 17 * * 1 /home/user/report.sh
```

### Every 10 minutes

```cron
*/10 * * * * /home/user/script.sh
```

### At reboot

```cron
@reboot /home/user/startup.sh
```

---

## 🔹 4. Special Keywords

Instead of 5 fields, you can use shortcuts:

| Keyword    | Meaning                    |
| ---------- | -------------------------- |
| `@reboot`  | Run at system startup      |
| `@yearly`  | Once a year (Jan 1, 00:00) |
| `@monthly` | Once a month               |
| `@weekly`  | Once a week                |
| `@daily`   | Once a day (midnight)      |
| `@hourly`  | Once every hour            |

---

## 🔹 5. Managing Cron Jobs

### Edit your crontab

```bash
crontab -e
```

### List your cron jobs

```bash
crontab -l
```

### Remove all cron jobs

```bash
crontab -r
```

---

## 🔹 6. Scheduling a Script

1. Write your script, e.g. `/home/user/backup.sh`

```bash
#!/bin/bash
tar -czf /home/user/backups/backup_$(date +%F).tar.gz /home/user/data
```

2. Make it executable:

```bash
chmod +x /home/user/backup.sh
```

3. Add to cron (e.g., daily at 1 AM):

```cron
0 1 * * * /home/user/backup.sh
```

---

## 🔹 7. Logging & Debugging

* Redirect output/errors to log:

```cron
0 3 * * * /home/user/myscript.sh >> /var/log/myscript.log 2>&1
```

* Check logs:

```bash
journalctl -u cron
# or
grep CRON /var/log/syslog   # Debian/Ubuntu
grep CROND /var/log/cron    # RHEL/CentOS
```

---

## 🔹 8. One-Time Scheduling with `at`

If you want a command **once**, use `at`:

```bash
echo "/home/user/script.sh" | at 10:30
```

👉 Runs once at 10:30 AM today.

---

✅ **Summary:**

* Use **cron** for repetitive scheduling.
* Use **@keywords** for simple scheduling.
* Use **at** for one-time jobs.
* Always log output for debugging.
