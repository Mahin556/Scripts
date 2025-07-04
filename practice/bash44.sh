#!/bin/bash

# syntax 1
function Installation(){
    echo "This is a Installationfunction ${1} ${2}"
    echo "${0}" # print the script name not function name
    echo ${FUNCNAME} # print the function name
}

# syntax 2
Configuration(){
    echo "${FUNCNAME} Start" # print the function name
    echo "This is a Configuring ${1}"
    echo "${FUNCNAME} Completed" # print the function name
}

# syntax 3
function Deployement {
    Configuration  # calling another function
    echo "This is a Deployement function $1"
}

Installation "nginx" "python"
Configuration "nginx"
Deployement "python"

# stats of defining thing in script
# 1. variable
# 2. function
# 3. alias
# 4. Function calls(must be after a function definition) and code

# Order of function calls matters
# 1. Function calls must be after the function definition
# 2. Function calls can be in any order, but they must be defined before they are called

