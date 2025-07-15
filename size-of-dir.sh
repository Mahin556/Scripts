#!/bin/bash
directory="/etc"

total_size=$(du -csh "$directory" | grep total | awk '{print $1}')
echo "Total size of the file in $directory = $total_size"
