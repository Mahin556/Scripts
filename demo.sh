#!/bin/bash

echo mahin     raza
echo "mahin    raza"
echo 'mahin    raza'

Red_open='\033[0;31m'
Red_close='\033[0m'
Green_open='\033[0;32m'
Green_close='\033[0m'
White_open='\033[0;37m'
White_close='\033[0m'
echo -e "${Green_open}This is in Green${Green_close}"
echo -e "${Red_open}This is in Red${Red_close}"
echo -e "${Green_open}This is in Green${Green_close}"
echo -e "${White_open}This is in White${White_close}"
echo -e "${Green_open}This is in Green${Green_close}"

# we can redirect the error with red color to log file

echo " Multi
Line 
String
"
echo "
######### Script started #########
This is a multi-line string
####### Script ended #########
"
echo " Multi \
Line \
String
"
echo "
######### Script started ######### \
This is a multi-line string \
####### Script ended #########
"

"""
Both single and double quotes are used to define strings, but they behave differently in terms of how they handle variables and special characters.
Single Quotes ('):
    Treat the enclosed content literally.
    No variable expansion or special character interpretation.
    echo '$abcd'   # Output: $abcd

Double Quotes (""):
    Allow variable expansion and interpret certain special characters.
    abcd="Hello"
    echo "$abcd"   # Output: Hello
"""

# yum install -y httpd \
# nginx \
# mysql-server

echo ' Multi \
Line \
String
'
#new line
echo -e "This is new line character \n and this is next line"
#horizontal tab
echo -e "This is new horizontal tab \t and this is next line"
#vertical tab
echo -e "This is new vertical tab \v and this is next line"