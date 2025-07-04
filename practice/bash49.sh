#!/bin/bash

# && ---> make sure both commands are executed
# || ---> make sure only one command is executed

# ls && echo "ls command executed"
# ls || echo "ls command not executed"
# ls && echo "ls command executed" && echo "ls command executed again"
# ls && echo "ls command executed" || echo "ls command executed again"
# ls || echo "ls command not executed" || echo "ls command not executed again"


ping -c 1 8.8.8.8 > /dev/null && echo "Internet working fine." || echo "Internet not working."

if [[ $OSTYPE == "linux-gnu" && $USER == 'root' ]]; then
  echo "This is a Linux system and you are root user."
else
  echo "This is not a Linux system or you are not root user."
fi

OS_TYPE=$(uname -s)

if [[ ${OS_TYPE,,} == "linux" && $UID -eq 0 ]]; then
  echo "This is a Linux system and you are root user."
else
  echo "This is not a Linux system or you are not root user."
fi

if [[ ${OS_TYPE,,} == "linux" ]]; then
  if [[ $UID -eq 0 ]]; then
    echo "This is a Linux system and you are root user."
  else
    echo "This is a Linux system but you are not root user."
  fi
fi

echo "my name is gaurav" || ls || echo "after ls"
