## Variable

Used to store and represent data in a memory
2 types
  1. System defined:- defined by system on the bash shell(env or printenv)
  2. User defined:- defined by the user in script

Syntax
Variable_name=data(int,string,char,array,null,bool)
No space around `=`

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
#!/bin/bash
var1="Devil"
var2=23
readonly var1
echo $var1 $var2
var1=23
echo $var1 $var2
```
