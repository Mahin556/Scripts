Perfect 👍 You’ve covered `if`, `elif`, `for`, and `while`.
Now let’s deep dive into **`case` statement in Bash** — the switch-case style branching tool.

---

# 🎯 Bash `case` Statement (Complete Guide)

---

## 🔹 1. Basic Syntax

```bash
case WORD in
    PATTERN1)
        commands
        ;;
    PATTERN2)
        commands
        ;;
    *)
        default commands
        ;;
esac
```

* `WORD` → the variable or expression being matched
* `PATTERN` → can be a string, number, wildcard (`*`, `?`, `[a-z]`), or regex-like pattern
* `;;` → ends that case branch
* `*)` → default / fallback (like `else`)
* `esac` → ends the case block (`case` reversed)

---

## 🔹 2. Simple Example

```bash
echo "Enter a letter:"
read letter

case $letter in
    a)
        echo "You entered A"
        ;;
    b)
        echo "You entered B"
        ;;
    *)
        echo "Not A or B"
        ;;
esac
```

---

## 🔹 3. Multiple Matches

```bash
echo "Enter y/n:"
read answer

case $answer in
    y|Y|yes|YES)
        echo "You chose YES"
        ;;
    n|N|no|NO)
        echo "You chose NO"
        ;;
    *)
        echo "Invalid input"
        ;;
esac
```

---

## 🔹 4. Wildcards in Patterns

```bash
filename="report.txt"

case $filename in
    *.txt)
        echo "Text file"
        ;;
    *.sh)
        echo "Shell script"
        ;;
    *)
        echo "Unknown file type"
        ;;
esac
```

---

## 🔹 5. Ranges

```bash
read -p "Enter a digit: " digit

case $digit in
    [0-3])
        echo "Between 0 and 3"
        ;;
    [4-6])
        echo "Between 4 and 6"
        ;;
    [7-9])
        echo "Between 7 and 9"
        ;;
    *)
        echo "Not a digit"
        ;;
esac
```

---

## 🔹 6. With Commands

```bash
read -p "Enter a command: " cmd

case $cmd in
    date)
        date
        ;;
    list|ls)
        ls -l
        ;;
    whoami)
        whoami
        ;;
    *)
        echo "Unknown command"
        ;;
esac
```

---

## 🔹 7. Nested Case

```bash
read -p "Choose (fruit/animal): " choice
case $choice in
    fruit)
        read -p "Which one? (apple/banana): " fruit
        case $fruit in
            apple) echo "Red fruit" ;;
            banana) echo "Yellow fruit" ;;
            *) echo "Unknown fruit" ;;
        esac
        ;;
    animal)
        echo "You chose animal"
        ;;
    *)
        echo "Invalid choice"
        ;;
esac
```

---

## 🔹 8. Case with `select` (Menu)

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

## 🔹 9. Terminal One-Liner Example

```bash
case $(date +%u) in 6|7) echo "Weekend";; *) echo "Weekday";; esac
```

---

## 🔹 10. Differences from `if`

| Feature                 | `if/elif`  | `case`              |
| ----------------------- | ---------- | ------------------- |
| Numerical checks        | ✅ Yes      | ❌ Not direct        |
| Multiple string matches | ⚠️ Verbose | ✅ Clean             |
| Pattern matching        | Limited    | ✅ Wildcards, ranges |
| Default branch          | `else`     | `*)`                |

---

✅ **Summary:**
`case` is best for **pattern-based branching**, especially when checking strings, file extensions, user input, or command names. It’s cleaner than multiple `if` statements.

---

👉 Do you want me to also prepare a **full cheatsheet of `if`, `case`, `for`, `while`, `until` side by side** (all conditions + examples in a table) so you can compare everything quickly?
