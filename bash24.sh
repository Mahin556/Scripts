#!/bin/bash

STRING="welcome.to.myvm"

echo ${STRING#*.}
echo ${STRING##*.}
echo ${STRING%.*}
echo ${STRING%%.*}

