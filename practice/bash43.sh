#!/bin/bash

echo "$((a+b))"
echo "$((a-b))"
echo "$(($a*$b))"
echo "$(($a/$b))"   # 5/6
echo "$((a%b))"
echo "$((2**3))"  # 2*2*2

((a++))
echo "$a"  # Increment a by 1
((b--))
echo "$b"  # Decrement b by 1

((a+=5))  # Add 5 to a
echo "$a"
((b-=3))  # Subtract 3 from b
echo "$b"
((a*=2))  # Multiply a by 2
echo "$a"
((b/=2))  # Divide b by 2
echo "$b"
((a%=3))  # Modulus of a by 3
echo "$a"
((b**=2))  # Raise b to the power of 2
echo "$b"
((a==b))  # Check if a is equal to b
echo "$a"
((a!=b))  # Check if a is not equal to b
echo "$a"
((a<b))   # Check if a is less than b
echo "$a"
((a>b))   # Check if a is greater than b
echo "$a"
((a<=b))  # Check if a is less than or equal to b
echo "$a"
((a>=b))  # Check if a is greater than or equal to b
echo "$a"
((a&&b))  # Logical AND
echo "$a"
((a||b))  # Logical OR

