#!/bin/bash

if [[ ${UID} -ne 0 ]];then
	echo "Please run with the root or sudo user"
	exit 1
fi

if [[ ${#} -lt 1 ]];then
	echo "Usage: ${0} USER_NAME [COMMENT]..."
	echo "Create a user with USER_NAME and COMMENT field"
	exit 1
fi

USER_NAME="${1}"

shift
COMMENT="${@}"

PASSWORD=$(openssl rand -base64 24)

useradd -c ${COMMENT} -m ${USER_NAME}

if [[ $? -ne 0 ]];then
	echo "The Account Could Not Created"
	exit 1
fi

echo ${PASSWORD} | passwd --stdin $USER_NAME

if [[ $? -ne 0 ]];then
	echo "password could not be set"
	exit 1
fi

passwd -e $USER_NAME

echo 
echo "USER NAME: $USER_NAME"
echo
echo "PASSWORD: $PASSWORD"
echo
echo "HOST: $(hostname)"




