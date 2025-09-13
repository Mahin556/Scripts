#!/bin/bash

PORT=8080

if [[ -n "$PORT" ]]; then
    echo "Allowing traffic for port $PORT..."
    sudo firewall-cmd --permanent --add-port=${PORT}/tcp
    sudo firewall-cmd --reload
else
    echo "Port not specified!"
fi
