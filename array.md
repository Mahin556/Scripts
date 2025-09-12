## Array
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
