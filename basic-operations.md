
### 🔹 What is a Shell?

* A **shell** is a special user program that:

  * Acts as an interface between the user and the **kernel** (OS core).
  * Accepts **human-readable commands** → translates into machine code.
  * Provides **bidirectional communication** (user inputs → system outputs).
* When you log in:

  * System-wide + user-specific config files are loaded.
* **Bash** is the default shell in most Linux distributions.

---

### 🔹 What is a Terminal?

* A **terminal** is a program that provides an interface to access the shell.
* Lets you **type commands** and **see outputs** in a text-based environment.
* Used to run scripts and automate tasks.

---

### 🔹 Linux Variants

* **Server edition** → No GUI, only CLI, shell loads after login.
* **Desktop edition** → GUI available, shell must be opened manually.

---

### 🔹 Accessing the Shell

* **On Server:**

  1. Boot system
  2. Login prompt → enter username & password
  3. Shell prompt loads
* **On Desktop:**

  1. Login via GUI
  2. Open **terminal window** manually:

     * Right-click → Open Terminal
     * Or Applications → System Tools → Terminal
     * GNOME 3: Search “Terminal” in Activities

---

### 🔹 Virtual Consoles

* **Shortcut keys:** `Ctrl + Alt + F1` … `F6` (text-based terminals).
* `Ctrl + Alt + F1` or `F7` → return to GUI (depends on distro).
* Useful for:

  * Logging in as different users simultaneously.
  * Switching seamlessly between GUI and CLI.

---

### 🔹 Shell, Kernel, Hardware Relationship

User ↔ **Shell** ↔ **Kernel** ↔ Hardware

* We **can’t directly interact with the kernel** (written in C, low-level).
* The **shell** provides a human-friendly interface.
* The **terminal** is just another program that gives us access to the shell.
* Remote shell access possible via **SSH** or **Telnet**.

---

### 🔹 Shebang (`#!`)

* Tells the system **which interpreter** should run the script.
* Example:

  ```bash
  #!/bin/bash
  echo "Hello World"
  ```
* Without shebang:

  * Script runs in the **current shell**.
  * May fail if script syntax differs from current shell.
* You can also run scripts directly by calling the interpreter:

  ```bash
  bash script.sh
  python3 script.py
  ```

---

### 🔹 Popular Linux Shells

* **sh** → Bourne shell
* **bash** → Bourne Again Shell (default in Linux)
* **csh** → C shell
* **ksh** → Korn shell
* **zsh** → Z shell (more features)
* **fish** → Friendly Interactive Shell

Check your default shell:

```bash
echo $SHELL
```

Change shell:

```bash
chsh -s /bin/zsh
```

*(applies on next login)*

---

### 🔹 Shell Prompt & Command Prompt

* Prompt format:

  ```
  user@hostname:~$
  ```
* `$` → normal user prompt
* `#` → root user prompt

---

### 🔹 Script Naming Convention

* Scripts usually saved with `.sh` extension.
* Example:

  ```bash
  nano myscript.sh
  chmod +x myscript.sh
  ./myscript.sh
  ```

---

✅ This screenshot basically covers:

1. **What is Shell & Terminal**
2. **How to access them** (GUI, server, virtual console)
3. **Shebang importance**
4. **Different shell types**
5. **Shell prompt basics**
6. **Script execution & naming conventions**
