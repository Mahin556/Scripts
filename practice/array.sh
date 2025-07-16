#!/bin/bash
myArray=(1 2 3 "mahin")
for i in "${myArray[@]}";do 
    echo $i
done

#Update array
myArray+=(5 6 7)

echo "${myArray[@]}"

#Array key-value
declare -A myArray1
myArray1=( [Name]="Mahin" [age]=20 )
echo "${myArray1[@]}"
echo "${myArray1["Name"]}"