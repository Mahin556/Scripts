#!/bin/bash

function factorial() {
    num=$1
    if (( $num <= 1 )); then
        echo 1
        return
    fi
    echo $(($num * $(factorial $(( num - 1 ))) ))
}

read -p "Enter a number: " num
result=$(factorial $num)
echo "Factorial of $num is: $result"