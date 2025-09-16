## Variable

Used to store and represent data in a memory
2 types
  1. System defined:- defined by system on the bash shell(env or printenv)
  2. User defined:- defined by the user in script

Syntax
Variable_name=data(int,string,char,array,null,bool)
No space around `=`

Key Commands for Managing Variables
- env – show environment variables
- printenv – print environment variables (all or specific)
- set – show all shell + environment variables + functions
- unset – remove a variable
- export – make a variable available to sub-shells

Properties
```
Overwritable
```

Variable naming convension
```
Contain letter,number,underscore.
Start with underscore(_),latter(a..z,A..Z).
Case-sensitive
No whitespace, special char
purposeful name
no reverse keyword(if,do,then,for,while,else,fi,done,set,case etc)
```
Allowed
```
mahin
MAHIN
Mahin
Mahin_RAZA
Mahin_
mahin123
_MAHIN
```

Not allowed
```
3MAHIM
MAHIN@RAZA
```

Export
```
export MAHIN=raza #avail to all sub shell sessions
echo "export MAHIN=raza" >> ~/.bashrc  #avail to all shell sessions
```

ECHO
```
echo $MAHIN
echo ${MAHIN}
echo $MAHIN_RAZA #wrong❌
echo ${MAHIN}_RAZA #right✔️
echo $0 #Displays the name of the current shell or the name of the script being executed.
echo $? #Exit code of last command
echo $$ #Give process id of current shell

```

Complete list of **commonly defined system/shell variables** (you’ll always see many of them when you run `printenv`, `env`, or `set`):

---

## 🔹 Standard Shell Special Variables (defined by the shell itself)

| Variable        | Meaning                                                               |
| --------------- | --------------------------------------------------------------------- |
| `$0`            | Name of the shell script (or shell itself if interactive).            |
| `$1, $2, …, $9` | Positional parameters (arguments to script/command).                  |
| `$#`            | Number of positional parameters passed.                               |
| `$*`            | All positional parameters as a single string.                         |
| `$@`            | All positional parameters, each quoted separately.                    |
| `"$@"`          | All args preserved as separate quoted strings (safer in scripts).     |
| `$?`            | Exit status of the last executed command.                             |
| `$$`            | PID (process ID) of the current shell.                                |
| `$!`            | PID of the last background process.                                   |
| `$_`            | Last argument of the last command (also current command in progress). |
| `$-`            | Current shell options/flags (set with `set -x`, etc.).                |
| `$$`            | PID of the current shell.                                             |
| `$PPID`         | PID of the parent process.                                            |

```
#!/bin/bash

VAR_1=$1
VAR_2=$2
echo $0
echo $1
echo $2
echo $#
echo $*
VAR_2=$*

echo $@
echo "$@"

for i in $@;do
    echo $i
done

for i in $*;do
    echo $i
done

#!/bin/bash

x=10
arr=(a b c)
declare -i num=5
declare -A map=([name]="Mahin" [role]="DevOps")

for var in x arr num map; do
    echo "Checking variable: $var"
    declare -p "$var"
done

```

---

## 🔹 Common System-Defined Environment Variables

| Variable           | Meaning                                                           |
| ------------------ | ----------------------------------------------------------------- |
| `PATH`             | List of directories searched for commands.                        |
| `HOME`             | Path to the current user’s home directory.                        |
| `PWD`              | Current working directory.                                        |
| `OLDPWD`           | Previous working directory.                                       |
| `SHELL`            | User’s default login shell.                                       |
| `USER` / `LOGNAME` | Currently logged-in user.                                         |
| `UID`              | Numeric user ID of current user.                                  |
| `HOSTNAME`         | System’s host name.                                               |
| `HOSTTYPE`         | Machine hardware type.                                            |
| `MACHTYPE`         | CPU architecture + OS type (e.g., `x86_64-pc-linux-gnu`).         |
| `OSTYPE`           | Operating system type (e.g., `linux-gnu`).                        |
| `PS1`              | Primary shell prompt string.                                      |
| `PS2`              | Secondary prompt (when waiting for multiline input, usually `>`). |
| `PS4`              | Prompt used when tracing with `set -x`.                           |
| `TERM`             | Type of terminal (e.g., `xterm-256color`).                        |
| `EDITOR`           | Default text editor.                                              |
| `VISUAL`           | Preferred full-screen editor.                                     |
| `LANG`             | Default locale.                                                   |
| `LC_*`             | Locale-specific settings (LC\_ALL, LC\_TIME, LC\_CTYPE, etc.).    |
| `PATH`             | Command search path.                                              |
| `MAIL`             | Mailbox location.                                                 |
| `TMPDIR`           | Directory for temporary files.                                    |
| `RANDOM`           | Returns a different random integer each time it’s referenced.     |
| `SECONDS`          | Number of seconds since the shell was started.                    |
| `LINENO`           | Current line number in the script.                                |
| `FUNCNAME`         | Name of the currently executing function (in Bash).               |
| `COLUMNS`          | Terminal width.                                                   |
| `LINES`            | Terminal height.                                                  |

---

## 🔹 Less Common but Useful

| Variable         | Meaning                                                           |
| ---------------- | ----------------------------------------------------------------- |
| `SHLVL`          | Number of nested shell levels.                                    |
| `BASH_VERSION`   | Version of Bash (if using Bash).                                  |
| `BASH_VERSINFO`  | Array containing Bash version details.                            |
| `PWD`            | Current directory.                                                |
| `PROMPT_COMMAND` | Command executed before each primary prompt.                      |
| `HISTFILE`       | File where command history is stored (usually `~/.bash_history`). |
| `HISTSIZE`       | Number of commands kept in memory history.                        |
| `HISTFILESIZE`   | Number of lines kept in the history file.                         |

---

✅ To see all variables currently set in your shell:

```bash
set        # shows all shell + env variables + functions
printenv   # shows environment variables only
env        # another way to show environment variables
```

### Variable Defining in Script
```
#!/bin/bash
# User defined variables

echo "This is User Defined Variables example:-"
echo

FIRST_NAME="Ram"
LAST_NAME="Misra"

echo "My name is $FIRST_NAME $LAST_NAME."
exit 118
```
```
controlplane:~$ echo $?
128
```
```
#!/bin/bash
var1="Devil"
var2=23
readonly var1
echo $var1 $var2
var1=23
echo $var1 $var2
```

To get the lenght of the variable value
```
variableName=value
echo ${#variableName}
```
```
#!/bin/bash
# String length example

str="GeeksForGeeks"
echo "The string is: $str"
echo "Length of string: ${#str}"
```

Assigning String Variables in Bash
- No spaces are allowed around the = sign.
- You can use either single quotes ', double quotes ", or no quotes if no spaces/special characters.
```
VariableName='value'
echo $VariableName        # prints value

VariableName="value"
echo ${VariableName}      # prints value

VariableName=value
echo "$VariableName"      # prints value
```
```
var1="Hello"
var2="World"
var3="!"

var=$var1$var2$var3
echo $var
```
```
var="${var1}**${var2}**${var3}"
echo $var
```
```
var=$var1 $var2 $var3   # ❌ Bash thinks $var2 is a command!
echo "${var1} ${var2} ${var3}"
```


# 📌 Ways to Store Command Output in a Variable

## 1. ✅ Using `$( ... )` (Preferred Modern Method)

This is the **recommended** way — cleaner, easier to read, supports nesting.

```bash
#!/bin/bash
CURRENT_DIR=$(pwd)
echo "Current Directory: ${CURRENT_DIR}"
```

---

## 2. ⚠️ Using Backticks `` `...` `` (Deprecated)

Older syntax, still works but harder to nest.

```bash
#!/bin/bash
CURRENT_DIR=`pwd`
echo "Current Directory: ${CURRENT_DIR}"
```

---

## 3. Using `read` with Command Substitution

If you want to directly assign to variables via `read`:

```bash
#!/bin/bash
read CURRENT_DIR <<< "$(pwd)"
echo "Current Directory: ${CURRENT_DIR}"
```

---

## 4. Capturing Multi-Line Output into an Array

When a command produces multiple lines, you can store them in an array:

```bash
#!/bin/bash
FILES=($(ls))
echo "First file: ${FILES[0]}"
echo "All files: ${FILES[@]}"
for file in ${FILES[@]};do
    echo $file
done
```

---

## 5. Using `mapfile` / `readarray` (Preferred for Arrays)

This safely stores each line into an array:

```bash
#!/bin/bash
mapfile -t FILES < <(ls)
echo "Total files: ${#FILES[@]}"
```

---

## 6. Storing Command Output into a Variable with `while read`

```bash
#!/bin/bash
OUTPUT=""
while read line; do
    OUTPUT+="$line "
done < <(ls)
echo "Files: $OUTPUT"
```

---

## 7. Assigning Exit Status Instead of Output

⚠️ Don’t confuse capturing **output** vs **exit status**.
For exit status, use `$?`:

```bash
ls /tmp > /dev/null
STATUS=$?
echo "Exit status: $STATUS"
```

---

✅ **Summary**

* Use `$(...)` for **most cases**.
* Use `mapfile` or `readarray` for multi-line outputs into arrays.
* Use backticks only for legacy scripts.

Great topic 👍 In **Bash**, a **readonly variable** is a variable whose value cannot be changed once it is assigned. This is useful when you want to **protect constants** or ensure critical values in your script aren’t accidentally modified.

---

# 📌 Readonly Variables in Bash

## 🔹 1. Declaring a Readonly Variable

You can make a variable readonly in two ways:

### Using `readonly`

```bash
#!/bin/bash
readonly PI=3.14159
echo "Value of PI: $PI"
PI=4.5   # ❌ Error: variable is read-only
```

### Using `declare -r`

```bash
#!/bin/bash
declare -r GREETING="Hello, World!"
echo "$GREETING"
GREETING="Hi"   # ❌ Error
```

Both are equivalent.

---

## 🔹 2. Checking Readonly Variables

List all readonly variables:

```bash
readonly
```

List a specific variable:

```bash
readonly -p | grep PI
```

---

## 🔹 3. Making an Existing Variable Readonly

```bash
#!/bin/bash
NAME="Mahin"
readonly NAME
NAME="Other"   # ❌ Error
```

---

## 🔹 4. Readonly Functions

You can also make functions readonly:

```bash
#!/bin/bash
myfunc() {
  echo "This is a function"
}

readonly -f myfunc
myfunc   # Works

myfunc() { echo "Redefined"; }   # ❌ Error: function is read-only
```

---

## 🔹 5. Key Points

* Once declared readonly, a variable **cannot** be unset (`unset VAR` will fail).
* Useful for **constants**, **paths**, or **critical config values**.
* Scope: readonly applies within the **current shell session** or script.

---

✅ Example in action:

```bash
#!/bin/bash
readonly APP_VERSION="1.0.0"
echo "App Version: $APP_VERSION"

# Attempt to modify
APP_VERSION="2.0.0"   # ❌ bash: APP_VERSION: readonly variable
```
---

# 📌 Variable Scope in Bash

## 🔹 1. Global Variables (default)

* By default, every variable you declare is **global** to the current shell and its child processes (unless exported).
* Accessible everywhere in the script after declaration.

```bash
#!/bin/bash
GLOBAL_VAR="I am global"

function show_global {
  echo "Inside function: $GLOBAL_VAR"
}

show_global
echo "Outside function: $GLOBAL_VAR"
```

✅ Output:

```
Inside function: I am global
Outside function: I am global
```

---

## 🔹 2. Local Variables (inside functions)

* Use `local` inside a function to restrict the variable scope to that function.
* Prevents accidental modification of variables outside the function.

```bash
#!/bin/bash
VAR="outside"

function demo {
  local VAR="inside"
  echo "Inside function: $VAR"
}

demo
echo "Outside function: $VAR"
```

✅ Output:

```
Inside function: inside
Outside function: outside
```

---

## 🔹 3. Environment Variables

* Global variables that are exported with `export` become **environment variables**.
* Available to **child processes** but not to parent shells.

```bash
#!/bin/bash
export PATH_VAR="I am exported"

bash -c 'echo "In subshell: $PATH_VAR"'
echo "In current shell: $PATH_VAR"
```

✅ Output:

```
In subshell: I am exported
In current shell: I am exported
```

---

## 🔹 4. Special Cases

* **Subshells**: Running commands in `$(...)` or inside `( )` creates a subshell where modifications do not affect the parent shell.

```bash
#!/bin/bash
VAR="original"
( VAR="changed in subshell"; echo "Inside subshell: $VAR" )
echo "Outside subshell: $VAR"
```

✅ Output:

```
Inside subshell: changed in subshell
Outside subshell: original
```

---

## 🔹 5. Function vs Script Scope

* Variables in a script are not automatically visible in the **parent shell** unless you `export` them or explicitly `source` the script.

```bash
#!/bin/bash
SCRIPT_VAR="inside script"
```

Run it:

```bash
./myscript.sh
echo $SCRIPT_VAR   # ❌ nothing (not exported)
```

But if you `source` it:

```bash
source myscript.sh
echo $SCRIPT_VAR   # ✅ inside script
```

Here’s the difference between running a script with `./myscript.sh` and `source myscript.sh`:

* **`./myscript.sh`**

  * Executes the script in a **new subshell** (child process).
  * Any variables, functions, or directory changes (`cd`) inside the script **do not affect your current shell**.
  * The script needs **execute permission** (`chmod +x myscript.sh`).
  * The first line (`#!`) defines which shell will run it (e.g., `#!/bin/bash` or `#!/bin/sh`).

* **`source myscript.sh`** (or shorthand: `. myscript.sh`)

  * Executes the script in the **current shell** (no new process).
  * Any variables, functions, or directory changes inside the script **remain available after execution**.
  * No need for execute permission.
  * The shebang (`#!`) is ignored because your current shell directly interprets the script.

**Example:**

```bash
# myscript.sh
x=10
cd /tmp

#!/bin/bash
mkdir demo
cd demo
```

* `./myscript.sh` → Runs in a subshell → `x` is not available, current directory unchanged.
* `source myscript.sh` → Runs in the current shell → `x=10` stays, and your current directory becomes `/tmp`.

---

# ✅ Summary

* **Global** (default): Visible everywhere in the script.
* **Local** (`local`): Visible only inside the function.
* **Environment** (`export`): Passed to child processes.
* **Subshell**: Changes don’t affect parent shell.
* **Sourcing**: Runs a script in the current shell → keeps variables.
