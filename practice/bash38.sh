#!/bin/bash

echo $0
name=${1}
age=${2}

echo "name is ${name} and age is ${age}"

# Take both name and age as a command and rest as arguments
# name =${1:-"Mahin"}
# age =${2:-22}

arg1=$1
arg2=$2
arg3=$3
arg4=$4
arg5=$5
arg6=$6
arg7=$7
arg8=$8
arg9=$9
arg10=${10}
arg11=${11}
arg12=${12}

#give total no of command line arguments
echo $#

echo $@ # ----> give list of all command line arguments
echo $* # ----> give single string of all the command line arguments