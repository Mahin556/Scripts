#!/bin/bash

input_file='input.txt'
output_file='output.txt'

echo "Removing same lines......"
sort $input_file | uniq > $output_file
echo "Duplicate lines removed successfully."
