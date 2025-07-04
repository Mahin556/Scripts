#!/bin/bash

packageName="nginx"  # Global variable

function install(){
  myname="gaurav"    # Local variable inside function (not declared as local, so still global)
  echo "installing ${1}"  # Prints the argument passed to install()
}

function configuration(){
  packageName="tomcat"  # Redefines global variable packageName (no 'local', so global overwrite)
  local myname="sachin"  # Local variable, only visible within this function
  echo "config ${1}"     # Prints the argument passed to configuration()
  echo "name ${myname}"     # Prints the argument passed to configuration()
}

echo "first ${packageName}"       # Prints: first nginx
echo "myname = ${myname}"         # myname not defined yet, prints empty
install "${packageName}"          # install nginx → sets myname=gaurav
echo "myname = ${myname}"         # now prints: myname = gaurav
echo "second ${packageName}"      # still nginx
configuration "${packageName}"    # changes packageName to tomcat
echo "${packageName}"    # Prints: tomcat


