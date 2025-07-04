#!/bin/bash

a=2
test $a -eq 1
echo $?

# man of command have there exit status too
# man grep, find, ls etc

if grep -i gaurav echo.sh > /dev/null
then
  echo "Echo Command Executed successfully"
fi

echo "I am Here"


if grep -q "localhost 192.168.29.168" /etc/hosts;then
  echo "localhost is present in /etc/hosts"
else
  echo "localhost is not present in /etc/hosts"
fi

number=5
if test $number -eq 5;
then
  echo "Echo Command Executed successfully"
fi

# test alias ----> []  check man of test command

if [ $number -eq 5 ]; then
  echo "Echo Command Executed successfully"
fi

  # STRING1 = STRING2
  #             the strings are equal

  #      STRING1 != STRING2
  #             the strings are not equal

  #      INTEGER1 -eq INTEGER2
  #             INTEGER1 is equal to INTEGER2

  #      INTEGER1 -ge INTEGER2
  #             INTEGER1 is greater than or equal to INTEGER2

  #      INTEGER1 -gt INTEGER2
  #             INTEGER1 is greater than INTEGER2

  #      INTEGER1 -le INTEGER2
  #             INTEGER1 is less than or equal to INTEGER2

  #      INTEGER1 -lt INTEGER2
  #             INTEGER1 is less than INTEGER2

  #      INTEGER1 -ne INTEGER2
  #             INTEGER1 is not equal to INTEGER2

  #      FILE1 -ef FILE2
  #             FILE1 and FILE2 have the same device and inode numbers

  #      FILE1 -nt FILE2
  #             FILE1 is newer (modification date) than FILE2

  #      FILE1 -ot FILE2
  #             FILE1 is older than FILE2

# -b FILE
#               FILE exists and is block special

#        -c FILE
#               FILE exists and is character special

#        -d FILE
#               FILE exists and is a directory

#        -e FILE
#               FILE exists

#        -f FILE
#               FILE exists and is a regular file

#        -g FILE
#               FILE exists and is set-group-ID

#        -G FILE
#               FILE exists and is owned by the effective group ID

#        -h FILE
#               FILE exists and is a symbolic link (same as -L)

#        -k FILE
#               FILE exists and has its sticky bit set

#        -L FILE
#               FILE exists and is a symbolic link (same as -h)

#        -N FILE
#               FILE exists and has been modified since it was last read

#        -O FILE
#               FILE exists and is owned by the effective user ID

# -p FILE
#               FILE exists and is a named pipe

#        -r FILE
#               FILE exists and read permission is granted

#        -s FILE
#               FILE exists and has a size greater than zero

#        -S FILE
#               FILE exists and is a socket

#        -t FD  file descriptor FD is opened on a terminal

#        -u FILE
#               FILE exists and its set-user-ID bit is set

#        -w FILE
#               FILE exists and write permission is granted

#        -x FILE
#               FILE exists and execute (or search) permission is granted