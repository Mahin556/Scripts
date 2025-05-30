#!/bin/bash

FREE_MEMORY=$(free -mt | grep 'Total' | awk '{print $4}')
TH=2500
if [[ $FREE_MEMORY -lt $TH ]]; then
	echo "WARNING, RAM is Low"
else
	echo "RAM space is sufficient $FREE_MEMORY"
fi
