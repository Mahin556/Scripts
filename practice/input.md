```bash
#!/bin/bash

echo -e "\nEnter the path"
read path_demo

echo -e "\nyou path is:"`echo $path_demo`
ls $path_demo
```

---

```bash
#!/bin/bash

while read line
do
	echo $line
done < input.txt
```

---

```bash
#!/bin/bash
#Parameter
echo "Name:$1"
```

---

```bash
#!/bin/bash

echo "Enter a number:"
read num

if [ $num -gt 0 ] ; then
	echo "Number is Positive"
elif [ $num -lt 0 ]; then
	echo "Number is Negative"
else 
	echo "Number is zero"
fi
```
---
```bash
#!/bin/bash

i=1
echo "Enter a Max number:"
read num
echo -e "\nThe number to the $num"
while [ $i -le $num ]; do
	echo "$i"
	(( i += 1 ))
done
```

---

```bash
#!/bin/bash

i=1
echo "Enter a number:"
read num

echo -e "\nThe number to the $num"

while [ $i -le 10 ]; do
	echo "$num * $i = $(( $num*$i ))"
	(( i += 1 ))
done
```

---

```bash
#!/bin/bash

i=1
echo "Enter a number: "
read num

printf "The number you entered is: %d\n" $num

while [ $i -le $num ];do
  echo $i
  i=$((i+1))
done

for i in $(seq 1 $num);do
  echo $i
done

for ((i=1;i<=$num;i++));do
  echo $i
done
```

---

```bash
############################################################
# 1. COMMAND-LINE ARGUMENTS
#
# $0  → Script name
# $1  → First argument
# $2  → Second argument
# $#  → Total number of arguments
# $@  → All arguments (preserves quotes)
# $*  → All arguments (single word)
# shift → Shift arguments left
#
# Example:
############################################################

#!/bin/bash

echo "Script Name: $0"
echo "First Arg: $1"
echo "Second Arg: $2"
echo "Total Args: $#"
echo "All Args ($@): $@"
echo "All Args ($*): $*"

echo "Before shift: $1"
shift
echo "After shift: $1"
```

---

```bash
############################################################
# 2. INTERACTIVE USER INPUT (read)
#
# read VAR
# read -p "prompt" VAR
# read -s (silent)
# read -t seconds (timeout)
# read -n chars (limit input)
############################################################

read -p "Enter your name: " NAME
echo "Hello $NAME"

read -sp "Enter password: " PASS
echo
echo "Password received"

read -t 5 -p "Enter within 5 seconds: " INPUT
echo "You entered: $INPUT"

read FIRST LAST
echo "First: $FIRST, Last: $LAST"

read -n 1 -p "Press any key: " KEY
echo
echo "You pressed: $KEY"
```

---

```bash
############################################################
# 3. FILE INPUT (Redirection <)
#
# command < file.txt
############################################################

while IFS= read -r line; do
  echo "Line: $line"
done < input.txt
```

---

```bash
############################################################
# 4. HERE DOCUMENT (<<)
#
# Multi-line input
############################################################

cat <<EOF
This is line 1
This is line 2
EOF

NAME="Mahin"
cat <<EOF
Hello, $NAME
EOF

cat <<'EOF'
$NAME will not expand here
EOF
```

---

```bash
############################################################
# 5. HERE STRING (<<<)
#
# Single string input
############################################################

grep "hello" <<< "hello world"

read VAR <<< "Hello World"
echo "$VAR"
```

---

```bash
############################################################
# 6. INPUT REDIRECTION
############################################################

sort < unsorted.txt
wc -l < input.txt
```

---

```bash
############################################################
# 7. PIPES (|)
#
# Output → Input
############################################################

echo "hello world" | tr 'a-z' 'A-Z'

ls | while read file; do
  echo "File: $file"
done
```

---

```bash
############################################################
# 8. READING FROM STDIN
############################################################

while read line; do
  echo "Got: $line"
done < /dev/stdin

cat | while read line; do
  echo "Input: $line"
done
```

---

```bash
############################################################
# 9. INPUT VALIDATION
############################################################

read -p "Enter value: " VAL

if [[ -z $VAL ]]; then
  echo "No input provided!"
fi

if [[ -n $VAL ]]; then
  echo "Input exists"
fi

if [[ $VAL =~ ^[0-9]+$ ]]; then
  echo "Number"
else
  echo "Not a number"
fi
```

---

```bash
############################################################
# 10. SELECT MENU
############################################################

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

```bash
############################################################
# 11. ARGUMENT + FILE INPUT TOGETHER
############################################################

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

```bash
############################################################
# 12. getopts (FLAGS & OPTIONS)
############################################################

#!/bin/bash

while getopts ":u:p:" opt; do
  case $opt in
    u) USER=$OPTARG ;;
    p) PASS=$OPTARG ;;
    \?) echo "Invalid option -$OPTARG" ;;
  esac
done

echo "User: $USER"
echo "Pass: $PASS"

# Run:
# ./script.sh -u admin -p secret
```

---

```bash
############################################################
# 13. readarray / mapfile
############################################################

mapfile -t LINES < input.txt

echo "First line: ${LINES[0]}"
echo "All lines: ${LINES[@]}"
```

---

```bash
############################################################
# 14. SPECIAL VARIABLES
############################################################

echo "Exit status: $?"
echo "Script PID: $$"

sleep 10 &
echo "Last background PID: $!"

echo "Last argument of previous command: $_"
echo "Random number: $RANDOM"
```

---

```bash
############################################################
# 15. INPUT TRICKS
############################################################

# Infinite loop input
while true; do
  read -p "Enter something: " VAR
  echo "You typed: $VAR"
done
```
---

```bash
vim hello
```
```bash
#!/bin/bash

if [[ -n $1 ]];then
		name=$1
else
		read -p "Enter your name:" name
fi

echo "Hello, $name"
```

---

```bash
#!/bin/bash

for i in "$@"; do
	echo $i
done
```

---

```bash
greet() {
  local name=$1
  echo "hello $name (from func)"
}

for name in "$@"; do
  greet "$name" >> file.txt
	./hello $name
done

var=$(greet dave)
echo "var is $var"
```

---

```bash
greet() {
  local name=$1
  echo "hello $name (from func)"
  return 5
}

greet dave
echo $?
```

---

```bash
check_user() {
  id "$1" &>/dev/null
  return $?
}

check_user mahin
if [[ $? -eq 0 ]]; then
  echo "User exists"
else
  echo "User does not exist"
fi
```

---

