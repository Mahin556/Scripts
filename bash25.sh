#!/bin/bash

COMMAND_OUTPUT=$(df -h / | grep / | awk '{print $5}')

echo "Disk usage: $COMMAND_OUTPUT"
