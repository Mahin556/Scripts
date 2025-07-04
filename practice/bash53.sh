#!/bin/bash

i=1
until [[ $i -eq 10 ]];do
    echo "Iteration: $i"
    ((i++))
done

