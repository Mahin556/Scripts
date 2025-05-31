#!/bin/bash

# Script should be execute with sudo/root access.
if [[ ${UID} -ne 0 ]];then
	echo "Please run with the root or sudo user"
	exit 1
fi

# User should provide atleast one argument as username else guide him
if [[ ${#} -lt 1 ]];then
	echo "Usage: ${0} USER_NAME [COMMENT]..."
	echo "Create a user with USER_NAME and COMMENT field"
	exit 1
fi

# Store 1st argument as user name
USER_NAME="${1}"

# In case of more than one argument, store it as account comments
shift
COMMENT="${@}"

# Create a password.
PASSWORD=$(openssl rand -base64 24)

# Create the user
useradd -c ${COMMENT} -m ${USER_NAME}

# Check if user is successfully created or not
if [[ $? -ne 0 ]];then
	echo "The Account Could Not Created"
	exit 1
fi

# Set the password for the user.
echo ${PASSWORD} | passwd --stdin $USER_NAME

# Check_if password is successfully set or not
if [[ $? -ne 0 ]];then
	echo "password could not be set"
	exit 1
fi

# Force password change on first login.
passwd -e $USER_NAME

# Display the username, password, and the host where the user was created.
echo 
echo "USER NAME: $USER_NAME"
echo
echo "PASSWORD: $PASSWORD"
echo
echo "HOST: $(hostname)"




