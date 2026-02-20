```bash
a=2
b=2

if [[ $a == $b ]]; then
    echo 'a and b are the same'
fi
```
---
```bash
c=2
d=3

if [[ $c != $d ]]; then
    echo 'c and d are NOT the same'
fi
```
---
```bash
if [[ -f file.txt ]]; then
    echo 'file.txt exists and is a file'
fi
```
---
```bash
while [[ -f file.txt ]]; do
    echo 'file.txt exists and is a file'
    sleep 1
done
```
---
```bash
until [[ -f file.txt ]]; do
    echo 'file.txt does not exist'
    sleep 1
done

echo 'file exists'
```
---
```bash
if [[ $a -eq $b ]]; then
    echo "Equal numbers"
fi
```
---
```bash
until [[ -f /tmp/app_ready ]]; do
    echo "Waiting for app..."
    sleep 2
done

echo "App is ready!"
```
---
```bash
if ls; then
    echo "ls worked"
fi
```
---
```bash
if echo hi; then
    echo "ls worked"
fi
```
---
```bash
for thing in {a..f}; do
    echo "thing is $thing"
done
```
---
```bash
max=5
for ((i = 0; i < max; i++)); do
    echo "thing is $thing"
done
```
---
```bash
max=5
for ((i = 0; i < max; i++)); do
    echo "i is $i"
done

for ((i=0; i<$max; i++)); do
    echo "i is $i"
done
```
---
```bash
if false; then
    echo "Will not run"
fi

if true; then
    echo "Will run"
fi

if mkdir testdir; then
    echo "Directory created"
fi
```

---
```bash
#!/bin/bash

file="test.txt"
if [ -e $file ];then
    echo "$file found"
else
    echo "$file not found"
fi 
```

---
```bash
#!/bin/bash
number=5
if [ $number -gt 10 ]; then
echo "$number is greater than 10"
else
echo "$number is not greater than 10"
fi
echo "--------"
if [ $number -gt 10 ]; then
echo "$number is greater than 10"
elif [ $number -eq 10 ]; then
echo "$number is equal to 10"
else
echo "$number is less than 10"
fi
```
---
```bash
#!/bin/bash
directory="$1"
if [ -z "$directory" ]; then
echo "Usage: $0 <directory>"
exit 1
fi

if [ ! -d "$directory" ]; then
echo "Error: '$directory' is not a valid directory."
exit 1
fi
echo "Empty files in $directory:"
find "$directory" -type f -empty
```
---
```bash
#!/bin/bash
directory="$1"
if [ -z "$directory" ]; then
echo "Usage: $0 <directory>"
exit 1
fi

if [ ! -d "$directory" ]; then

echo "Error: '$directory' is not a valid directory."
exit 1
fi

cd "$directory" || exit 1

for file in *; do
if [ -f "$file" ]; then
newname=$(echo "$file" | tr 'A-Z' 'a-z')
[ "$file" != "$newname" ] && mv "$file" "$newname"
fi
done
```
---
```bash
#!/bin/bash
host="$1"
if [ -z "$host" ]; then
echo "Usage: $0 <hostname or IP>"
exit 1
fi
ping -c 4 "$host"
 

if [ $? -eq 0 ]; then
echo "$host is reachable."
else
echo "$host is not reachable."
fi
```
---
```bash
if grep -q "Pop" $release_file || grep -q "Ubuntu" $release_file
then
    # The host is based on Ubuntu,
    # Run the apt version of the command
    sudo apt update 1>>$logfile 2>>$errorlog
    sudo apt dist-upgrade -y 1>> $logfile 2>>$errorlog
    if [ $? -ne 0 ]
    then
        echo "An error occurred, please check the $errorlog file."
    fi
fi
```
---
```bash
#!/bin/bash

command=/usr/bin/htop

if [ -f $command ]
then
    echo "$command is available, let's run it..."
else
    echo "$command is NOT available, installing it..."
    sudo apt update && sudo apt install -y htop
fi

$command
```
---
```bash
#!/bin/bash

command=htop

if command -v $command
then
    echo "$command is available, let's run it..."
else
    echo "$command is NOT available, installing it..."
    sudo apt update && sudo apt install -y $command
fi

$command
```
