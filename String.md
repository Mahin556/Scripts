## Defining Strings
```
#!/bin/bash

str1=Hello            # No spaces around =
str2="Hello World"    # Quotes allow spaces
str3='Single quotes'  # Literal string
echo $str1
echo $str2
echo $str3
```

## Printing Strings
```
#!/bin/bash

str1=Hello            # No spaces around =
str2="Hello World"    # Quotes allow spaces
str3='Single quotes'  # Literal string
num1=1  # Literal string

echo $str1
echo "$str2"
echo "String is: %s\n" "$str3"
echo "num is is: %n\n" "$num1"
```

## Format specifier
- 
- `printf` is the preferred method for formatted output in Bash.
- Bash itself doesn’t interpret %s—it’s just part of the format string for printf.
  
| Specifier | Meaning                         | Example                                       |
| --------- | ------------------------------- | --------------------------------------------- |
| `%s`      | String                          | `printf "%s\n" "Hello"` → `Hello`             |
| `%d`      | Signed decimal integer          | `printf "%d\n" 42` → `42`                     |
| `%i`      | Integer (same as `%d`)          | `printf "%i\n" 42` → `42`                     |
| `%f`      | Floating point decimal          | `printf "%.2f\n" 3.14159` → `3.14`            |
| `%e`      | Scientific notation (lowercase) | `printf "%e\n" 1234` → `1.234000e+03`         |
| `%E`      | Scientific notation (uppercase) | `printf "%E\n" 1234` → `1.234000E+03`         |
| `%x`      | Hexadecimal (lowercase)         | `printf "%x\n" 255` → `ff`                    |
| `%X`      | Hexadecimal (uppercase)         | `printf "%X\n" 255` → `FF`                    |
| `%o`      | Octal                           | `printf "%o\n" 8` → `10`                      |
| `%%`      | Literal `%` character           | `printf "Progress: 50%%\n"` → `Progress: 50%` |

#### Multiple values
```
first="Ram"
last="Misra"
printf "My name is %s %s\n" "$first" "$last"

printf "Name: %s, Age: %d\n" "Alice" 30
# Output: Name: Alice, Age: 30

printf "%s %s %s\n" "one" "two" "three"
# Output: one two three
```

#### Specify width, padding, and alignment:
```bash
printf "|%10s|\n" "Hi"
# Output: Right-align in 10 characters → |        Hi|

printf "|%-10s|\n" "Hi"
# Output: Left-align  → |Hi        |

printf "|%5d|\n" 42
# Output: Right-align number → |   42|

printf "|%-5d|\n" 42
# Output: Left-align number  → |42   |
```

#### Floating Point Formatting
```bash
num=3.14159
printf "%.2f\n" $num   # 2 decimal places → 3.14
printf "%8.3f\n" $num  # Width 8, 3 decimals →    3.142
```

## Escapes and Special Characters
| Escape | Meaning      | Example                    | Output         |
| ------ | ------------ | -------------------------- | -------------- |
| `\n`   | New line     | `echo -e "Line1\nLine2"`   | Line1<br>Line2 |
| `\t`   | Tab          | `echo -e "Col1\tCol2"`     | Col1    Col2   |
| `\v`   | Vertical tab | `echo -e "A\vB"`           | A<br>   B      |
| `\\`   | Backslash    | `echo -e "C:\\Path"`       | C:\Path        |
| `\"`   | Double quote | `echo -e "He said \"Hi\""` | He said "Hi"   |
| `\a`   | Alert / bell | `echo -e "\a"`             | (system beep)  |

```bash
printf "Line1\nLine2\n"
printf "Column1\tColumn2\n"
printf "Quote: \"%s\"\n" "Hello"
```

## Concatenation
```bash
var1="Hello"
var2="World"
var3="${var1} ${var2}!"
echo "$var3"   # Hello World!
```

## String Length
```
str="GeeksForGeeks"
echo ${#str}    # 13
```

## Substring Extraction
```bash
str="GeeksForGeeks"
echo ${str:5}     # ForGeeks (from index 5)
echo ${str:5:3}   # For (from index 5, length 3)
```

## Substring Matching (Trimming)
```bash
string="Welcome.to.GeeksForGeeks"

echo ${string#*.}   # Remove shortest match from front → to.GeeksForGeeks
echo ${string##*.}  # Remove longest match from front  → GeeksForGeeks

echo ${string%.*}   # Remove shortest match from back  → Welcome.to
echo ${string%%.*}  # Remove longest match from back   → Welcome
```

## Substring Replacement
```bash
str="I like apples"

echo ${str/apples/oranges}     # Replace first → I like oranges
echo ${str//apples/oranges}    # Replace all   → I like oranges
echo ${str/ap*/bananas}        # Pattern match → I like bananas
```

## Searching in Strings
```bash
str="Hello World"
[[ $str == *World* ]] && echo "Found"
[[ $str == Hello*  ]] && echo "Starts with Hello"
[[ $str == *Hello ]] && echo "Ends with Hello"
[[ $str == *World* ]] || echo "Not Found"
[[ $str == Hello*  ]] || echo "Not Starts with Hello"
[[ $str == *Hello ]] || echo "Not Ends with Hello"
```

## String Comparison
```bash
a="abc"
b="xyz"

if [[ "$a" == "$b" ]]; then
  echo "Equal"
elif [[ "$a" < "$b" ]]; then
  echo "a is less"
else
  echo "a is greater"
fi
```

## Changing Case
```bash
str="hello world"
echo ${str^^}   # HELLO WORLD (uppercase)
echo ${str,,}   # hello world (lowercase)

echo ${str^}    # Hello world (capitalize first letter)
echo ${str,}    # hello world (lowercase first letter)
```

## Trimming Whitespace
```bash
str="   hello   "
echo "[$str]"             # [   hello   ]

echo "[$(echo $str)]"     # Trim in subshell
echo "[$(echo $str | xargs)]" # [hello]
```

## Splitting Strings
```bash
str="apple,banana,cherry"
IFS=',' read -r -a arr <<< "$str"
echo "${arr[0]}"   # apple
echo "${arr[1]}"   # banana
echo "${arr[2]}"   # cherry

for item in "${arr[@]}"; do
    echo "$item"
done
```

#### Explanation:
IFS=','
  - Internal Field Separator: tells Bash to split the string on commas.
read -r -a arr <<< "$str"
  - read reads a line from input.
  - -r prevents backslash escapes from being interpreted.
  - -a arr stores the split values into an array called arr.
  - <<< "$str" uses a here-string, sending the content of $str as input to read.


## Arrays from Strings
```bash
str="Hello there world"
arr=($str)
echo ${arr[@]}     # Hello there world
echo ${#arr[@]}    # 3 (number of words)
```

## Reversing Strings
```bash
str="Hello"
echo "$str" | rev    # olleH
```

## Check Empty String
```bash
str=""
if [[ -z "$str" ]]; then
  echo "Empty"
fi

if [[ -n "$str" ]]; then
  echo "Not empty"
fi
```

## Extract Filename / Path
```bash
path="/home/user/file.txt"
echo ${path##*/}   # file.txt (remove longest prefix)
echo ${path%%/*}   # home (remove longest suffix)
echo ${path%/*}    # /home/user (directory only)
echo ${path##*.}   # txt (extension)
```

## Multiple String Substitutions
```bash
str="banana apple cherry"
echo ${str//a/A}   # bAnAnA Apple cherry
```

## Using Regex with [[ ]]
```bash
str="abc123"
if [[ $str =~ [0-9]+ ]]; then
  echo "Contains digits"
fi
```

## Advanced with awk / sed
```bash
str="Hello World"
echo "$str" | awk '{print toupper($0)}'   # HELLO WORLD
echo "$str" | sed 's/World/Bash/'         # Hello Bash
```

## Parameter Expansion Tricks
```bash
var="abcdef"
echo ${var:0:3}   # abc
echo ${var:(-3)}  # def (last 3 chars)
echo ${var: -3}   # def (space before - required)
```

## Default Values in Bash
| Form              | Meaning                                                                     |
| ----------------- | --------------------------------------------------------------------------- |
| `${var:-default}` | Use `default` **if `$var` is unset or empty**, but do not change `$var`.    |
| `${var:=default}` | Use `default` **if `$var` is unset or empty**, and **assign it to `$var`**. |
| `${var:+value}`   | Use `value` **if `$var` is set and not empty**.                             |
| `${var:?message}` | Throw an error with `message` if `$var` is unset or empty.                  |

```bash
#!/bin/bash

# Variable not set
echo "${name:-Guest}"     # Guest (default, does NOT assign)

# Assign default if unset
echo "${name:=Guest}"     # Guest (assigns to $name)
echo "$name"              # Guest

# Value only if set
city="Delhi"
echo "${city:+India}"     # India
unset city
echo "${city:+India}"     # (empty)

# Error if unset
unset file
echo "${file:?File not defined}"  # Exits with message: File not defined

```
