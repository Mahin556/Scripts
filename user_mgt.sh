#!/bin/bash

#===========================================================
# Script Name:   myscript.sh
# Description:   Brief description of what the script does
# Author:        Your Name
# Date:          YYYY-MM-DD
# Version:       1.0
# Usage:         ./myscript.sh [options/arguments]
#===========================================================

set -euo pipefail
IFS=$'\n\t'

SCRIPT_NAME=$(basename "$0")
VERSION="1.0"


* [ ] Check if the script is being run as root (UID=0).
* [ ] If not root → print error and exit.
* [ ] Check if at least one argument (username) is provided.
* [ ] If no argument → print usage instructions and exit.
* [ ] Store the first argument as `USER_NAME`.
* [ ] Store remaining arguments (if any) as `COMMENT`.
* [ ] Generate a random secure password using `openssl`.
* [ ] Create the new user account with home directory and comment field.
* [ ] Check if user creation was successful; if not → exit.
* [ ] Set the generated password for the new user.
* [ ] Check if password was set successfully; if not → exit.
* [ ] Force the user to change password at first login.
* [ ] Display final account details:
  * Username
  * Password
  * Hostname


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
PASSWORD=$(openssl rand -base64 24 | head -c 20)

# Create the user
useradd -c ${COMMENT} -m ${USER_NAME}

# Check if user is successfully created or not
if [[ $? -ne 0 ]] && ! id ${USER_NAME} &> /dev/null ;then
	echo "The Account Could Not Created"
	exit 1
fi

# Set password (works for most distros)
if ! echo "${USER_NAME}:${PASSWORD}" | chpasswd; then
  echo "Password could not be set"
  exit 1
fi

# Expire password so user must change it
passwd -e "${USER_NAME}" >/dev/null 2>&1

# Display the username, password, and the host where the user was created.
echo 
echo "USER NAME: $USER_NAME"
echo
echo "PASSWORD: $PASSWORD"
echo
echo "HOST: $(hostname)"




