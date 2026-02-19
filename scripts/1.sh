# ------------------------------------------------------------
#  #!/usr/bin/env bash
# ------------------------------------------------------------
#
# This line is called a "shebang" (or hashbang).
# It tells the system which interpreter should run this script.
#
# ------------------------------------------------------------
#  #!
# ------------------------------------------------------------
# Special characters at the top of a script.
# When you run: ./script.sh
# The kernel reads this first line to know how to execute it.
#
# ------------------------------------------------------------
#  /usr/bin/env
# ------------------------------------------------------------
# 'env' is a program that looks for executables
# using your system's PATH environment variable.
#
# Instead of hardcoding /bin/bash,
# it searches for "bash" wherever it exists in PATH.
#
# ------------------------------------------------------------
#  bash
# ------------------------------------------------------------
# The shell interpreter that will execute the script.
#
# ------------------------------------------------------------
# Meaning of: #!/usr/bin/env bash
# ------------------------------------------------------------
# → "Find bash in the user's PATH and use it
#    to run this script."
#
# ------------------------------------------------------------
# Why this is better than: #!/bin/bash
# ------------------------------------------------------------
# - On some systems, bash may not be in /bin/bash
# - It could be in /usr/local/bin/bash or elsewhere
# - Using env makes the script more portable
#
# ------------------------------------------------------------
# What happens when you run: ./script.sh
# ------------------------------------------------------------
# 1. System reads first line → #!/usr/bin/env bash
# 2. Runs → /usr/bin/env bash script.sh
# 3. env finds bash in PATH
# 4. bash executes the script
#
# ------------------------------------------------------------
# Short Summary:
# - It specifies the interpreter
# - It improves portability
# - It ensures the script runs with bash (not sh)
# ------------------------------------------------------------

#!/usr/bin/env bash

for file in `ls ../practice`;do
  echo files is $file
done

echo "#############################"

for file in ../practice/*;do
  echo files is $file
done