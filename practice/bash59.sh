#!/bin/bash
# for loop to iterate through a list of values
info=("mahin" "raza" 22)
for i in ${info[@]};do
    echo -e "$i"
done
