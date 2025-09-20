
## 🔹 1. Using `sleep` in terminal
- Linux commands can run one after another or at the same time, but sometimes a delay is needed between commands.
- The sleep command pauses command execution for a specified time, which is useful when timing affects the correctness or success of subsequent operations.
- The command accepts delays in seconds (s), minutes (m), hours (h), or days (d), providing flexibility.
- By using sleep in scripts, users can automate tasks more effectively and prevent system overloads or command failures due to premature execution.<img width="677" height="126" alt="image" src="https://github.com/user-attachments/assets/6844054d-bdd3-4f45-a8be-8ec3e4e4b32b" />


`sleep` pauses execution for a given amount of time.

Examples:

```bash
sleep 5        # sleep for 5 seconds
sleep 2m       # sleep for 2 minutes
sleep 1h       # sleep for 1 hour
sleep 0.5      # sleep for half a second
```

You can test it by running:

```bash
echo "Start"; sleep 3; echo "End"
```

👉 Output:

```
Start
(3 sec pause…)
End
```

---

## 🔹 2. Using `sleep` inside a Bash script

Example script (`myscript.sh`):

```bash
#!/bin/bash
echo "Step 1"
sleep 2
echo "Step 2 (after 2 seconds)"
sleep 3
echo "Step 3 (after 3 more seconds)"
```

Run it:

```bash
bash myscript.sh
```

---

## 🔹 3. Sleep in loops

`sleep` is often used inside loops to slow down execution:

```bash
#!/bin/bash
for i in {1..5}
do
    echo "Iteration $i"
    sleep 1   # wait 1 second before next iteration
done
```

Output:

```
Iteration 1
(wait 1 sec)
Iteration 2
(wait 1 sec)
...
```

---

## 🔹 4. Sleep with fractional seconds

Bash supports floating-point sleeps:

```bash
sleep 0.2   # 200 milliseconds
```

```
sleep 7h 30m && mplayer alarm.mp3

sleep 1 && echo "one" && sleep 1 && echo "two"

#!/bin/bash
SLEEP_INTERVAL="30"
CURRENT_TIME=$(date +"%T")
echo "Time before sleep: ${CURRENT_TIME}"
echo "Sleeping for ${SLEEP_INTERVAL} seconds"
sleep ${SLEEP_INTERVAL}
CURRENT_TIME=$(date +"%T")
echo "Time after sleep: ${CURRENT_TIME}"

#!/bin/bash
while :
    do
        if ping -c 1 www.google.com &> /dev/null
        then
        echo "Google is online"
        break
        fi
    sleep 10
done

while kill -0 $BACK_PID ; do
    echo "Waiting for the process to end"
    sleep 1
done

for (( i = 1 ; i <= 250 ; i++ ));
    do
    sleep 1
    qsub computation"${i}".pbs
done

```

### References
- https://phoenixnap.com/kb/linux-sleep
  
