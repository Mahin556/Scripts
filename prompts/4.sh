#!/bin/bash

scripts=("build.sh" "deploy.sh" "test.sh")
PS3="Choose a script to run: "

select script in "${scripts[@]}"; do
  if [[ -n "$script" && -x "$script" ]]; then
    echo "Running '$script'..."
    "./$script"
    break
  else
    echo "Script not found or not executable."
  fi
done