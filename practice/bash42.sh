#!/bin/bash

# How to Set Default Value of a Variable

read -p "Enter your name: " name

name=${name:-"World"}

echo "Hello, $name!"

# name1=""
name2=${name1-"World"} # This will set the default value of name to "World" if it is not set
echo "Hello, $name2!"

unset name

: ${name:?"Give a name"} # This will give an error if name is not set
echo "Hello, $name!"

: ${1:?"Give a name"} # This will give an error if the first argument is not set
echo "Hello, $1!"
