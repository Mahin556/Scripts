Nice 👌 this screenshot is showing three **very useful Linux commands** for working with file paths. Let’s break them down with examples:

---

### 1. `basename`

* Removes the directory part of a path and only shows the **file name**.

```bash
basename /home/user/docs/report.txt
```

Output:

```
report.txt
```

You can also remove the file extension:

```bash
basename /home/user/docs/report.txt .txt
```

Output:

```
report
```

---

### 2. `dirname`

* Removes the filename and gives the **directory path**.

```bash
dirname /home/user/docs/report.txt
```

Output:

```
/home/user/docs
```

---

### 3. `realpath`

* Shows the **absolute full path** of a file.
* Useful if you are in a relative directory.

```bash
cd /home/user/docs
realpath report.txt
```

Output:

```
/home/user/docs/report.txt
```

---

Yes 👍 there are many more **path and filename related commands/utilities** in Linux (apart from `basename`, `dirname`, `realpath`). These are super useful when writing **shell scripts**. Let me give you a list with examples:

---

### 1. `readlink`

* Prints the **absolute path of a symlink or file**.

```bash
readlink -f myfile
```

Output:

```
/home/user/project/myfile
```

---

### 2. `pwd`

* Shows the **current working directory**.

```bash
pwd
```

Output:

```
/home/user/docs
```

---

### 3. `ls -d`

* Can be used to print **directory path only**.

```bash
ls -d /etc/*
```

---

### 4. `stat`

* Shows detailed information about a file (size, permissions, last modified, etc).

```bash
stat report.txt
```

---

### 5. `file`

* Identifies the **file type** (text, binary, image, etc).

```bash
file script.sh
```

Output:

```
script.sh: Bourne-Again shell script, ASCII text executable
```

---

### 6. `find`

* Locate files or directories by name/path/size.

```bash
find /home/user -name "*.txt"
```

---

### 7. `realpath --relative-to`

* Get **relative path** instead of full absolute path.

```bash
realpath --relative-to=/home/user /home/user/docs/file.txt
```

Output:

```
docs/file.txt
```

---

### 8. Parameter expansion in Bash (built-in, no external command)

You don’t always need external commands like `basename`. Bash itself can handle this:

```bash
FILE="/home/user/docs/report.txt"

echo "${FILE##*/}"   # basename -> report.txt
echo "${FILE%/*}"    # dirname  -> /home/user/docs
echo "${FILE##*.}"   # extension -> txt
echo "${FILE%.*}"    # filename without extension -> /home/user/docs/report
```

---

👉 So apart from `basename`, `dirname`, and `realpath`, the **important related ones** are:

* `readlink`
* `pwd`
* `stat`
* `file`
* `find`
* Bash parameter expansion (`##`, `%` operators)

---

Do you want me to prepare a **cheatsheet table** with all these commands + examples (like your screenshot style)?


👉 Do you want me to also show how you can **combine these commands in a script** (for example, to check a file’s path and name separately)?
