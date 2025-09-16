
### ⏱ 1. Countdown Timer

```bash
countdown() {
    local secs=$1
    while [ $secs -gt 0 ]; do
        echo -ne "⏳ $secs seconds remaining...\r"
        sleep 1
        : $((secs--))
    done
    echo -e "\n✅ Time’s up!"
}

countdown 10   # runs for 10 seconds
```

---

### ⏰ 2. Digital Clock (live updating)

```bash
while true; do
    echo -ne "🕒 $(date +%H:%M:%S)\r"
    sleep 1
done
```

---

### 📆 3. Date + Time Clock with Refresh

```bash
while true; do
    clear
    echo "📅 $(date '+%Y-%m-%d %H:%M:%S')"
    sleep 1
done
```

---

### 🔄 4. Simple Loading Spinner

```bash
spinner() {
    local pid=$!
    local spin='-\|/'
    local i=0
    while kill -0 $pid 2>/dev/null; do
        i=$(( (i+1) %4 ))
        printf "\rLoading... ${spin:$i:1}"
        sleep 0.2
    done
}

(sleep 5) &  # fake command
spinner
echo -e "\n✅ Done!"
```

---

### 📊 5. Progress Bar

```bash
progress_bar() {
    local total=$1
    local i
    for ((i=1; i<=total; i++)); do
        sleep 0.1
        printf "\rProgress: [%-50s] %d%%" $(head -c $i < /dev/zero | tr '\0' '#') $((i*2))
    done
    echo -e "\n✅ Complete!"
}

progress_bar 50
```

---

### ⌛ 6. Stopwatch

```bash
start=$(date +%s)
while true; do
    now=$(date +%s)
    elapsed=$(( now - start ))
    printf "\r⏱ Elapsed: %02d:%02d:%02d" $((elapsed/3600)) $((elapsed%3600/60)) $((elapsed%60))
    sleep 1
done
```

---

### ⚡ 7. Fancy Loading Dots

```bash
for i in {1..10}; do
    echo -ne "Loading$(printf '.%.0s' $(seq 1 $((i%4))))   \r"
    sleep 0.5
done
echo -e "\n✅ Finished!"
```

---

👉 With these, you can make your Bash scripts feel interactive and user-friendly.

Do you want me to combine them into a **single menu-driven script** (choose timer, clock, spinner, etc.) so you can test them all in one place?
