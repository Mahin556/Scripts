#!/bin/bash

add() {
	local result=$(($1+$2))
	echo "Addition of $1 and $2 is ${result}"
}
sub() {
	local result=$(($1-$2))
	echo "Subtraction of $1 and $2 is ${result}"
}
mul() {
	local result=$(($1*$2))
	echo "Multiplication of $1 and $2 is ${result}"
}
dev() {
	local result=$(($1/$2))
	echo "Devision of $1 and $2 is ${result}"
}

echo "Please choose what operation you want to perform"
echo "a) Addition"
echo "b) Subtraction"
echo "c) Multiplication"
echo "d) Devision"

read -p "Enter your choise: " opr
read -p "Enter First number:" num1
read -p "Enter Second number:" num2

case $opr in
	a) add $num1 $num2 ;;
	b) sun $num1 $num2 ;;
	c) mul $num1 $num2 ;;
	d) dev $num1 $num2 ;;
	*) echo "Please provide a valid value"
esac
