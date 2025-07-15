#!/bin/bash

read -p "Enter a natural number:- " n
sum=0
for((i=1;i<=n;i++));do
    ((sum+=${i}))
done
echo "SUM--> $sum"