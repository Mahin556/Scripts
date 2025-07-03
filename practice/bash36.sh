#!/bin/bash

# User define variables
# name of the variable should be alphanumeric
# containe numeber, underscore and letters
# variable name should not start with number
# variable name should not contain special characters
# variable name should not contain space
# variable name should not contain hyphen
# variable are case sensitive


name="Mahin"
nAmE="Mahin"
Name="Mahin"
NAME="Mahin"
age=22

echo "name is $name and age is ${age}"


name="Mahin" age=22
echo "name is $name and age is ${age}"

work="Programm"
word="ing"

echo "I am ${work}er"
echo "${work}ing"

#concatenate
echo "${work}${word}"

# strong quotes
echo '${work}${word}'


# system define variables
# all the environment variables
# use `env` or `printenv` command to see all the environment variables
# $HOME
# $USER
# $PATH
# $SHELL
# $PWD
# $HOSTNAME
# $UID
# $EUID
# $RANDOM
# $SECONDS
# $PPID
# $BASH_VERSION
# $BASH
# $BASH_LINENO
# $BASH_ARGV
# $BASH_SOURCE
# $BASH_VERSINFO
# $BASH_ALIASES
# $BASH_ENV
# $BASHOPTS
# $BASH_SUBSHELL
# $BASH_REMATCH
# $BASH_ARGC
# $BASH_ARGV
# $BASH_EXECUTION_STRING
# $BASH_LINENO
# $BASH_SOURCE
# $BASH_VERSINFO

echo $HOME
echo $PWD
echo $HOSTNAME
echo $USER
echo $SHELL
echo ${$}
echo $UID
echo $PPID
echo $OSTYPE
echo $PATH
sleep 60

echo $SECONDS
echo

# man bash ---> give list of all system defined variables
# some variables are read-only like $UID or some are writable like $HOME