#!/bin/bash
var1="Demo"
var2=0

echo -e "$var1\n$var2"

readonly var1 #after define
readonly var3="hello" #when define

var1="Mahin"
var2=1

echo -e "$var1\n$var2"

