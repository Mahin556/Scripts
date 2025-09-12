### Function

Functions are named block or reusable code
- Reusing logic
- Keep script modular
- Easy for debugging and maintenance
- Reduce duplication
- DRY principle
- Centralize a logic
- support parameters

Differnet ways to define functions
```
function my_func1() {
  echo ""
}

my_func2() {
  echo ""
}

funcation my_func2 {
  echo ""
}
```

Calling a function
```
my_func1
my_func2
my_func3
```

```
#!/bin/bash

# Function for installation
function install() {
    echo "Running installation step..."
}

# Function for configuration
configuration() {
    echo "Running configuration step..."
}

# Function for deployment
function deploy {
    echo "Running deployment step..."
}

# Calling functions
configuration
install
deploy
```

Parameter
```
function install() {
    yum install -y $1
}

install httpd
```

Modify a Global Variable
```
#!/bin/bash

result=0

add_numbers() {
    result=$(( $1 + $2 ))   # modifies global variable
}

add_numbers 4 6
echo "Result: $result"
```

Use return (Exit Code Only, 0–255)
```
#!/bin/bash

is_even() {
    if (( $1 % 2 == 0 )); then
        return 0   # success
    else
        return 1   # failure
    fi
}

is_even 4
if [ $? -eq 0 ]; then
    echo "Even number"
else
    echo "Odd number"
fi
```

Use echo and Capture the Output
```
#!/bin/bash

get_sum() {
    echo $(( $1 + $2 ))
}

result=$(get_sum 3 5)
echo "Sum is $result"
```

Use exit (▲ Avoid in Functions)
```
#!/bin/bash

bad_function() {
    echo "Exiting script..."
    exit 1   # stops the entire script
}

bad_function
echo "This line will never run"
```

