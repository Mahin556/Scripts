#!/bin/bash

# Specify the log file to analyze
LOG_FILE="/path/to/log/file.log"

# Specify the pattern to search for
PATTERN="ERROR"

# Search for the specified pattern in the log file
search_result=$(grep "$PATTERN" "$LOG_FILE")

if [ -n "$search_result" ]; then
    echo "Log analysis detected the following pattern: $PATTERN"
    total_occurrences=$(grep -c "$PATTERN" "$LOG_FILE")
    echo "Total occurrences of $PATTERN: $total_occurrences"
else
    echo "No occurrences of $PATTERN found in the log file."
fi
