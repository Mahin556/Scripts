#!/bin/bash

echo "Welcome to signup page."
echo "************************"

read -p "Please enter your name: " NAME
read -p "Please enter your email address: " EMAIL
read -s -p "Please enter your password: " PASSWORD
echo
read -s -p "Please confirm your password: " CONFIRM_PASSWORD
echo

if [ "$PASSWORD" == "$CONFIRM_PASSWORD" ]; then
    echo "Signup Successful!"
else
    echo "Passwords do not match! Please try again."
fi
