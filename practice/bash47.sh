#!/bin/bash

name="gaurav sharma"

if [ "$name" = "gaurav sharma" ]
then
  echo "both strings are equal"
fi

name="gaurav sharma"

if [ -n "$name" ]
then
  echo "both strings are equal"
fi


#!/bin/bash

name="gaurav sharma"
othername="saurav sharma"

if [[ "${name}" == "${othername}" ]]
then
  echo "both strings are equal"
fi

if [[ -n "${name}" ]]
then
  echo "length of string is non zero"
fi

if [[ -z "${name}" ]]
then
  echo "length of string is zero"
fi


