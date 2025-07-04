#!/bin/bash

read -p "Do you want to continue (Y/y/yes)? " uservalue

if [[ "${uservalue,,}" == "y" || "${uservalue,,}" == "yes" ]]
then
    echo "you want it"
else
    echo "you don't want it."
fi



