#!/bin/bash

# Assigning command output to the variable

# older way
CURRENT_WORKING_DIR=`pwd`
# newer way
CURRENT_WORKING_DIR=$(pwd)

echo "Current working directory is: ${CURRENT_WORKING_DIR}"

current_date=$(date +"%Y-%m-%d %H:%M:%S")
echo "Current date and time is: ${current_date}"
