#!/bin/bash

# Assign the value "Hello" to the variable abcd

abcd="Hello"

# Single quotes prevent variable expansion; prints the string literally

echo '$abcd'   # Output: $abcd

# Double quotes allow variable expansion; prints the value of the variable

echo "$abcd"   # Output: Hello