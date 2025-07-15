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
