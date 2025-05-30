#!/bin/bash

if [[ $# -eq 0 ]]; then
	echo "Please provides atleast one argument"
	exit 1
fi

echo "First argument $1"
echo "Second argument $2"
echo "All argument $@"
echo "Number of arguments $#"

# For loop to access the values from argument
for filename in $@; do
	echo "copying file - $filename"
done

