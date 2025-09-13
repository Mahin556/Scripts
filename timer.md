#!/bin/bash

i=1
while true; do
    echo "File$i $(date +%Y-%m-%d_%H-%M-%S)"
    sleep 10
    i=$((i+1))
done
