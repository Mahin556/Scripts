#!/bin/bash

while true;do
  echo "Choose an environment to deploy:"
  echo "1) Deployment"
  echo "2) Staging"
  echo "3) Production"
  echo "4) Exit"
  read -p "Enter a choice:" choice
  case $choice in
    1)
    echo "Deployment..."
    break
    ;;
  2)
    echo "Staging..."
    break
    ;;
  3)
    echo "Production..."
    break
    ;;
  4)
    echo "Exiting..."
    break
    ;;
  *)
    echo "Invalid Choice, Try again..."
    ;;
  esac
done
