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
