### Defining Strings
```
#!/bin/bash

str1=Hello            # No spaces around =
str2="Hello World"    # Quotes allow spaces
str3='Single quotes'  # Literal string
echo $str1
echo $str2
echo $str3
```

### Printing Strings
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

### Format specifier
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

#### Multiple strings
```
first="Ram"
last="Misra"
printf "My name is %s %s\n" "$first" "$last"
```
#### Specify width, padding, and alignment:
```
printf "|%10s|\n" "Hi"     # Right-aligned in 10 chars
printf "|%-10s|\n" "Hi"    # Left-aligned
```
```output
|        Hi|
|Hi        |
```


```
#!/bin/bash

value3="World"
arr=("Hello" "there," "$value3")

# Print all elements
echo "${arr[@]}"

# Print number of elements
echo "${#arr[@]}"

# Access second element (index starts at 0)
echo "${arr[1]}"

# Access first element
echo "${arr[0]}"
```

```
#!/bin/bash
string="GeeksForGeeks"
echo ${string:5}      # from index 5 to end
echo ${string:5:3}    # from index 5, take 3 characters
```

```
#!/bin/bash

string="Welcome.to.GeeksForGeeks"

# Remove shortest match from front
echo ${string#*.}

# Remove shortest match from back
echo ${string%.*}

# Remove longest match from front
echo ${string##*.}

# Remove longest match from back
echo ${string%%.*}
```

```
filepath="/home/user/docs/file.txt"

echo ${filepath##*/}   # file.txt
echo ${filepath%/*}    # /home/user/docs
echo ${filepath##*.}   # txt
echo ${filepath%.*}    # /home/user/docs/file
```

```

```
