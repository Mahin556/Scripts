#!/bin/bash

file_path="/etc/hosts"
directory_path="/home"

if [[ -d $directory_path ]];then
  echo "Directory exists: $directory_path"
else
  echo "Directory does not exist: $directory_path"
fi

if [[ -f $file_path ]];then
  echo "File exists: $file_path"
else
  echo "File does not exist: $file_path"
fi

if [[ -e $file_path ]];then
  echo "File exists: $file_path"
else
  echo "File does not exist: $file_path"
fi

if [[ -r $file_path ]];then
  echo "File exists: $file_path"
else
  echo "File does not exist: $file_path"
fi

othername="gaurav sharma"
name="gaurav sharma"

if [[ ! "${othername}" != "${name}" ]]
then
  echo "both are not same"
else
  echo "both are same"
fi

if [[ ! "${othername}" == "${name}" ]]
then
  echo "both are not same"
else
  echo "both are same"
fi
