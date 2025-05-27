#!/bin/bash

string="My name is mahin raza"

echo "${string#* }" #name is mahin raza
echo "${string% *}" #My name is mahin
echo "${string##* }" #raza
echo "${string%% *}" #My


