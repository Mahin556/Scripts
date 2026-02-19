#!/bin/bash

i=1
echo "Enter a number: "
read num

printf "The number you entered is: %d\n" $num

while [ $i -le $num ];do
  echo $i
  i=$((i+1))
done

for i in $(seq 1 $num);do
  echo $i
done

for ((i=1;i<=$num;i++));do
  echo $i
done

