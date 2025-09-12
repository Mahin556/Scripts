Got it 🚀 You want a **complete reference of everything related to input in Bash scripting** — interactive, command-line arguments, files, redirection, piping, etc. I’ll give you a **full, structured cheatsheet** so nothing is left out.

---

# 📌 **Complete Guide to Input in Bash Scripts**

---

## 🔹 1. Command-Line Arguments (`$1`, `$2`, `$@`, etc.)

When a script is run with arguments, Bash provides them as variables:

* `$0` → Script name
* `$1`, `$2`, ... → Positional arguments
* `$#` → Number of arguments
* `$@` → All arguments (preserves quotes)
* `$*` → All arguments (treated as one word)
* `shift` → Shifts positional arguments left

```bash
#!/bin/bash
echo "Script name: $0"
echo "First arg: $1"
echo "Second arg: $2"
echo "All args: $@"
echo "Arg count: $#"

shift
echo "After shift, first arg: $1"
```

---

## 🔹 2. Interactive User Input (`read`)

The `read` command lets you take input from the user.

### Basic usage

```bash
read NAME
echo "Hello, $NAME"
```

### With prompt

```bash
read -p "Enter your name: " NAME
echo "Hi $NAME"
```

### With silent input (passwords)

```bash
read -sp "Enter password: " PASS
echo
echo "Password entered."
```

### With timeout

```bash
read -t 5 -p "Enter something within 5 seconds: " INPUT
echo "You entered: $INPUT"
```

### Multiple variables

```bash
read FIRST LAST
echo "First: $FIRST, Last: $LAST"
```

---

## 🔹 3. File Input (Redirection `<`)

You can feed a file into a script:

```bash
#!/bin/bash
while read line; do
  echo "Line: $line"
done < input.txt
```

---

## 🔹 4. Here Documents (`<<`)

Feed multiple lines of input directly:

```bash
cat <<EOF
This is line 1
This is line 2
EOF
```

Use variables inside:

```bash
NAME="Mahin"
cat <<EOF
Hello, $NAME
EOF
```

Use `<<'EOF'` to prevent variable expansion.

---

## 🔹 5. Here Strings (`<<<`)

Pass a string as input to a command:

```bash
grep "hello" <<< "hello world"
```

Or with `read`:

```bash
read VAR <<< "Hello World"
echo $VAR
```

---

## 🔹 6. Input Redirection from Files

```bash
command < file.txt   # Input comes from file
```

Example:

```bash
sort < unsorted.txt
```

---

## 🔹 7. Input via Pipes (`|`)

Send output of one command as input to another:

```bash
echo "hello world" | tr 'a-z' 'A-Z'
```

Or inside a script:

```bash
ls | while read file; do
  echo "File: $file"
done
```

---

## 🔹 8. Reading from `/dev/stdin` or `cat`

```bash
while read line; do
  echo "Got: $line"
done < /dev/stdin
```

Or:

```bash
cat | while read line; do
  echo "Input: $line"
done
```

---

## 🔹 9. Input Validation

Check if input is empty:

```bash
read -p "Enter value: " VAL
if [[ -z $VAL ]]; then
  echo "No input provided!"
fi
```

Check if numeric:

```bash
if [[ $VAL =~ ^[0-9]+$ ]]; then
  echo "Number"
else
  echo "Not a number"
fi
```

---

## 🔹 10. Select Menu (User Choice)

```bash
select option in Start Stop Exit; do
  case $option in
    Start) echo "Starting...";;
    Stop) echo "Stopping...";;
    Exit) break;;
    *) echo "Invalid choice";;
  esac
done
```

---

## 🔹 11. Input from Arguments + Redirection Together

```bash
#!/bin/bash
if [[ -n $1 ]]; then
  FILE=$1
  while read line; do
    echo "Line: $line"
  done < "$FILE"
else
  echo "Usage: $0 filename"
fi
```

---

## 🔹 12. Input from `getopts` (Flags & Options)

```bash
#!/bin/bash
while getopts ":u:p:" opt; do
  case $opt in
    u) USER=$OPTARG ;;
    p) PASS=$OPTARG ;;
    \?) echo "Invalid option -$OPTARG" ;;
  esac
done

echo "User: $USER, Pass: $PASS"
```

Run:

```bash
./script.sh -u admin -p secret
```

---

## 🔹 13. Input with `readarray` / `mapfile`

Reads lines from stdin into an array:

```bash
mapfile -t LINES < input.txt
echo "First line: ${LINES[0]}"
echo "All lines: ${LINES[@]}"
```

---

## 🔹 14. Special Input Variables

* `$?` → exit status of last command
* `$$` → process ID of script
* `$!` → PID of last background job
* `$_` → last argument of previous command
* `$RANDOM` → random number

---

## 🔹 15. Input Tricks

* Limit characters:

  ```bash
  read -n 1 -p "Press any key: " KEY
  ```
* Infinite loop input:

  ```bash
  while true; do
    read -p "Enter something: " VAR
    echo "You typed: $VAR"
  done
  ```

---

# ✅ Summary

Bash input methods include:

* **Arguments** (`$1`, `$@`, etc.)
* **Interactive input** (`read`, `select`)
* **Files & stdin** (`< file`, `cat`, `/dev/stdin`)
* **Here-documents** (`<<EOF`) and **here-strings** (`<<<`)
* **Pipes** (`|`)
* **getopts** for options
* **mapfile/readarray** for arrays

👉 With these, you can handle **any kind of input** in a Bash script.

---

Do you want me to turn this into a **Markdown cheatsheet with categorized code blocks** (like a study note) so you can save it and reuse?
