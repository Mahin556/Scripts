#!/bin/bash

# readonly variable

name="Mahin"
readonly name
readonly name2="Mahin2" # This will give an error because name is readonly
echo "name is $name"

name="Mahin2" # This will give an error because name is readonly
echo "name is $name"
echo "name is $name2"

#unset variable
name3="Mahin3"
name3=
name4="Mahin4"
unset name4
echo "name is $name3,$name4" # This will give an empty output because name is unset

