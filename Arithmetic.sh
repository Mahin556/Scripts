#!/bin/bash

num1=10
num2=15

#Arithmetic Expansion ($((...)))

result=$((num1+num2))
echo "Sum:- $result"

result=$(expr $num1 + $num2)
echo "Sum:- $result"

let "result=num1+num2"
echo "Sum:- $result"

a=5
b=6

# Basic operations
echo "$((a + b))"   # Addition → 11
echo "$((a - b))"   # Subtraction → -1
echo "$((a * b))"   # Multiplication → 30
echo "$((a / b))"   # Integer Division → 0 (since 5/6 truncates to 0)
echo "$((b / a))"   # Integer Division → 1
echo "$((a % b))"   # Modulo → 5
echo "$((2 ** 3))"  # Exponentiation → 8

# Increment and compound assignment
((a++))
echo "$a"          # a becomes 6

NUM1=10
echo $((++NUM1))

((a += 3))
echo "$a"          # a becomes 9


if (( a > b )); then
    echo "a is greater"
fi

x=10
y=3

# Multiplication
let "z = x * y"
echo "$z"      # 30

# Division
let z=x/y
echo "$z"      # 3

let "z = (x + y) * 2"

let x++
echo $x   # 11

let "x += 5"
echo $x   # 16

