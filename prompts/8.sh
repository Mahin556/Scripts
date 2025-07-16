#!/bin/bash

while true;do
    read -p "Enter Domain to ping:- " domain
    [[ "$domain" == "exit" ]] && break

    if ping -c 1 "$domain" &> /dev/null; then
        echo "$domain is reachable."
    else
        echo "Failed to reach $domain."
  fi
done

