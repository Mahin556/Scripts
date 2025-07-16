#!/bin/bash

#String Operations
string="My name is mahin raza"

echo "${string#* }" #name is mahin raza
echo "${string% *}" #My name is mahin
echo "${string##* }" #raza
echo "${string%% *}" #My

myvar="Hello World!"
length=${#myvar}
echo $length

all_upper=${myvar^^}
echo $all_upper

first_upper=${myvar^}
echo $first_upper

all_lower=${myvar,,}
echo $all_lower

first_lower=${myvar,,}
echo $first_lower

replace=${myvar/World/Buddy}
echo $replace

slice=${myvar:6:11}
echo $slice