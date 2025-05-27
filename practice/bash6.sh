#!/bin/bash

echo "This is line one \n This is line second"
echo "BASH=$BASH"
echo "BASH=`echo $BASH`"
echo "BASH=$(echo $BASH)"
echo 'BASH=$BASH'
echo "BASH=\$BASH"
echo -e "BASH=\$BASH"


