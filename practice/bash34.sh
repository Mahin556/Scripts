#!/bin/bash

read -p "Please provide your input:" site

ping -c 1 $site
#sleep 5s

if [[ $? -eq 0 ]]; then
	echo "successfully connected to the $site"
else
	echo "Unable to connect to the $site"
fi

