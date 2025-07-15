#!/bin/bash
# Function to generate a random password

pass() {
	tr -dc 'A-Za-z0-9!@#$%^&*()_+{}[]' < /dev/urandom | fold -w 12 | head -n 1
} 

password=$(pass)

echo "Generated password: $password"

