#!/bin/bash

backup_file() {
    if [ -f "$1" ]; then
        cp "$1" "$1.bak"
        echo "Created backup of $1"
    else
        echo "Error: $1 is not a file"
    fi
}

# Example usage
backup_file ~/.bashrc
