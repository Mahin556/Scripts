#!/bin/bash

function factorial() {
    factorial=1
    num=$1
    for ((i=1;i<=num;i++));do
        factorial=$((factorial*i))
    done
    echo $factorial
}

read -p "Enter a number: " num
result=$(factorial $num)
echo "Factorial of $num is: $result"