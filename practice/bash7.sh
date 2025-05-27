#!/bin/bash

echo "Today's date " `date`

echo -e "\nEnter the path"
read path_demo

echo -e "\nyou path is:"`echo $path_demo`
ls $path_demo
