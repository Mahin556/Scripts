#!/bin/bash
# Function to generate a random password
generate_password() {
tr -dc 'A-Za-z0-9!@#$%^&*()_+{}[]' < /dev/urandom | fold -w 12 | head -n 1
}
# Call the function and store the generated password
password=$(generate_password)
echo "Generated password: $password"