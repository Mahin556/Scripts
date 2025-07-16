#!/bin/bash

a=5
b=4
#let
let a++
let c=a+b
let d=$a*$b
echo $d
echo $a
echo $c
((a++))
echo $a
echo $(($a++)) #first print a then increment 1

((a+=5))
echo $a
