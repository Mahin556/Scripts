Perfect 👍 You want **everything possible with logging in Bash scripting**.
Here’s a **complete breakdown** of logging techniques, levels, destinations, and best practices for Bash.

---

### 1. Basic logging in Bash

* **Write to stdout**

  ```bash
  echo "This is a normal log"
  ```
* **Write to stderr**

  ```bash
  echo "This is an error log" >&2
  ```
* **Redirect output to a log file**

  ```bash
  echo "Script started at $(date)" >> script.log
  ```

---

### 2. Logging levels

You can define levels (like in programming languages):

* `DEBUG` → detailed info for debugging
* `INFO` → general info
* `WARNING` → non-critical issues
* `ERROR` → failures
* `CRITICAL` → system-breaking issues

Example function:

```bash
log() {
    level=$1
    shift
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] [$level] $*" >> script.log
}

log INFO "Script started"
log ERROR "File not found"
log DEBUG "Variable value is $x"
```

---

### 3. Redirecting all output

* Redirect stdout and stderr to a file:

  ```bash
  ./myscript.sh > script.log 2>&1
  ```
* Append instead of overwrite:

  ```bash
  ./myscript.sh >> script.log 2>&1
  ```

---

### 4. Log rotation

Prevent logs from growing infinitely:

```bash
if [ -f script.log ]; then
    mv script.log script.log.$(date +%F_%T)
fi
```

---

### 5. Colored logs (for terminal)

Make logs readable:

```bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}[INFO] Script started${NC}"
echo -e "${RED}[ERROR] Something failed${NC}" >&2
```

---

### 6. Send logs to syslog

Use the `logger` command:

```bash
logger "This is a log message from my script"
logger -p local0.error "This is an error log"
```

* These logs go into `/var/log/syslog` or `/var/log/messages` depending on the OS.

---

### 7. Timestamps & PID in logs

```bash
echo "$(date +"%F %T") [PID $$] INFO: Task started" >> script.log
```

---

### 8. Function-based logging system

```bash
log_file="script.log"

log() {
  local level=$1
  shift
  echo "$(date +"%F %T") [$level] $*" >> "$log_file"
}

log INFO "Starting script"
log WARN "Low disk space"
log ERROR "Failed to copy file"
```

---

### 9. Trap errors & log them

```bash
trap 'echo "$(date +"%F %T") [ERROR] Command failed at line $LINENO" >> script.log' ERR
set -e  # exit on error
```

---

### 10. Debug logging (built-in)

Enable debug mode:

```bash
set -x   # show commands before execution
set +x   # disable debug
```

Redirect debug logs:

```bash
exec 2> debug.log
set -x
```

---

### 11. Separate logs for stdout & stderr

```bash
./myscript.sh >out.log 2>err.log
```

---

### 12. Rotating log files with `logrotate`

You can configure system log rotation using `/etc/logrotate.d/myscript`:

```
/path/to/script.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
}
```

---

### 13. Logging to multiple destinations

Log both to console and file:

```bash
logfile="script.log"
exec > >(tee -a "$logfile") 2>&1
echo "This will go to both console and $logfile"
```

---

### 14. Advanced structured logging (JSON logs)

```bash
log_json() {
  level=$1
  shift
  echo "{\"timestamp\":\"$(date +%FT%T)\",\"level\":\"$level\",\"message\":\"$*\"}" >> script.json
}

log_json INFO "Starting service"
log_json ERROR "Service failed to start"
```

---

### 15. Remote logging

Send logs to a remote server:

```bash
logger -n 192.168.1.100 -P 514 "Remote log test"
```

---

### 16. Log rotation inside script

Keep last 5 log files:

```bash
for i in 5 4 3 2 1; do
    if [ -f script.log.$i ]; then
        mv script.log.$i script.log.$((i+1))
    fi
done
[ -f script.log ] && mv script.log script.log.1
```

---

### 17. Performance monitoring logs

Capture execution time:

```bash
start=$(date +%s)
# some commands
end=$(date +%s)
echo "Execution time: $((end-start)) seconds" >> script.log
```

---

### 18. Example: Complete logging template

```bash
#!/bin/bash

logfile="script.log"
exec > >(tee -a "$logfile") 2>&1

log() {
    level=$1; shift
    echo "$(date +"%F %T") [$level] $*"
}

trap 'log ERROR "Command failed at line $LINENO"' ERR

log INFO "Script started"
sleep 1
log WARN "This is a warning"
false   # triggers error
log INFO "Script finished"
```

---

✅ With these techniques, you can:

* Log to file, console, syslog, or remote server
* Use levels (INFO, ERROR, DEBUG)
* Rotate, timestamp, and color logs
* Capture stdout, stderr, and execution trace


Got it 👍 You want **detailed knowledge about `logger` in Linux/Bash**.
Here’s a **complete breakdown** of the `logger` command and how it’s used for logging.

---

## 1. What is `logger`?

* `logger` is a command-line utility in Linux/Unix that sends messages to the **system log** (`syslog` or `journald` depending on the system).
* Instead of writing logs to a file manually, `logger` hands them off to the system’s **logging daemon** (`rsyslog`, `syslog-ng`, or `systemd-journald`).
* Useful for Bash scripts to record events in a central log system.

---

## 2. Default behavior

* By default, `logger "Message"` sends logs to **syslog** under the **user facility** at **notice priority**.
* Logs usually appear in:

  * `/var/log/syslog` (Debian/Ubuntu)
  * `/var/log/messages` (RHEL/CentOS)
  * `journalctl` (systemd systems)

Example:

```bash
logger "Backup script started"
```

Check logs:

```bash
tail -f /var/log/syslog      # Debian/Ubuntu
journalctl -f                # systemd-based distros
```

---

## 3. Syntax

```bash
logger [options] [message]
```

---

## 4. Common options

* **`-p facility.priority`** → Set facility and priority level

  ```bash
  logger -p local0.info "Service started"
  logger -p auth.error "Authentication failed"
  ```

  Facilities: `auth`, `authpriv`, `cron`, `daemon`, `kern`, `lpr`, `mail`, `news`, `syslog`, `user`, `uucp`, `local0`–`local7`
  Priorities: `emerg`, `alert`, `crit`, `err`, `warning`, `notice`, `info`, `debug`

* **`-t tag`** → Add a tag (useful to identify which script logged the message)

  ```bash
  logger -t backup_script "Backup completed successfully"
  ```

* **`-i`** → Include the process ID (PID) in the log entry

  ```bash
  logger -i -t backup_script "Started"
  # Produces: backup_script[12345]: Started
  ```

* **`-f file`** → Log contents of a file

  ```bash
  logger -f /var/log/custom_app.log
  ```

* **`-s`** → Also log to stderr (so it shows in terminal)

  ```bash
  logger -s "This will go to syslog and screen"
  ```

* **`-n host` and `-P port`** → Send log to a remote syslog server

  ```bash
  logger -n 192.168.1.100 -P 514 "Remote log test"
  ```

* **`-u socket`** → Use Unix domain socket instead of network

  ```bash
  logger -u /dev/log "Message"
  ```

---

## 5. Example logs in practice

### Simple log

```bash
logger "Hello, this is a log from bash"
```

### With priority & tag

```bash
logger -p local0.warning -t myscript "Disk space is low"
```

Log entry will look like:

```
Sep 13 10:30:22 server myscript: Disk space is low
```

### Logging errors

```bash
command_that_might_fail || logger -p user.err -t error_handler "Command failed"
```

### Logging from a script

```bash
#!/bin/bash
logger -t myscript -i "Script started"
if cp /tmp/file /backup/; then
  logger -t myscript "Backup successful"
else
  logger -p local0.err -t myscript "Backup failed"
fi
```

---

## 6. Checking logs

* **systemd systems**:

  ```bash
  journalctl -t myscript
  ```
* **rsyslog systems**:

  ```bash
  grep myscript /var/log/syslog
  # or
  grep myscript /var/log/messages
  ```

---

## 7. Advanced usage

* **Structured JSON logging**:

  ```bash
  logger -t myscript "$(jq -n --arg msg "Process started" --arg time "$(date)" '{message:$msg,timestamp:$time}')"
  ```

* **Remote centralized logging** (SIEM/Splunk/ELK stack):

  ```bash
  logger -n logserver.example.com -P 514 -t myscript "User login attempt"
  ```

* **Custom facility** (local0–local7) for script separation:

  * In `/etc/rsyslog.conf`:

    ```
    local0.*    /var/log/myscript.log
    ```
  * Restart rsyslog: `systemctl restart rsyslog`
  * Script:

    ```bash
    logger -p local0.info -t myscript "Custom log file test"
    ```

---

## 8. Why use `logger` in scripts?

* Logs go into **centralized system logs** → easier monitoring.
* Supports **log levels, facilities, and tags**.
* Works with **log rotation** automatically (via syslog/journald).
* Can log to **remote servers** for central monitoring.
* Adds **timestamps and hostnames** automatically.


