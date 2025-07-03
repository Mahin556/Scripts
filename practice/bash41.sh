#!/bin/bash

# String operations

string="my name is john doe"
echo $string # Print the string
echo ${string^} # Capitalize the first letter of the string
echo ${string^^} # Capitalize all letters of the string

string="My name is John Doe"
echo $string # Print the string
echo ${string,} # Lowercase the first letter of the string
echo ${string,,} # Lowercase all letters of the string

echo ${#string} # Length of the string


string="abcdefghijklmnopqrstuvwxyz"
echo ${string:0}
echo ${string:1}
echo ${string:4}
echo ${string:0:4} # Print the first 4 characters of the string
echo ${string:4:4} # Print the 5th to 8th characters of the string
echo ${string:0} # Print all characters of the string
echo ${string: -1} # Print the last character of the string
echo ${string: -2} # Print the last 2 characters of the string
echo ${string: -4} # Print the last 4 characters of the string
echo ${string: -4:2} # Print the 2 characters before the last

string="abcafjajradcwefwererf"
echo ${string#a*c} # Remove the first occurrence of 'a' and everything before it(a need to be first character of the string give error if a is not first character)
echo ${string##a*c} # Remove the last occurrence of 'a' and everything before it

echo ${string%e*f} # Remove the first occurrence of 'e' and everything before it(f need to be last character of the string give error if f is not last character)
echo ${string%%e*f} # Remove the last occurrence of 'e' and everything before it

string="abcafiwefabcadhaabc"
echo ${string/a/b} # Replace the first occurrence of 'a' with 'b'
echo ${string//a/b} # Replace all occurrences of 'a' with 'b'
echo ${string/a} # Remove the first occurrence of 'a'
echo ${string//a} # Remove all occurrences of 'a'

