```bash
#!/bin/bash

echo "Enter fruite"
read fruite

case $fruite in
	"apple")
		echo "This is apple"
		;;
	"banana")
		echo "This is banana"
		;;
	"orange")
		echo "This is banana"
		;;
	*)
		echo "Unknown fruite"
		;;
esac
```

---

```bash
#!/usr/bin/env bash

hello() {
  local s=$1
  echo "hello $s!"
}

goodbye() {
  local s=$1
  echo "goodbye $s!"
}

if (($# == 0)); then
  echo 'name required!' >&2
  exit 1
fi

for name in "$@"; do
  case "$name" in
    d* | b*) hello "$name";;
    *) goodbye "$name";;
  esac
done

```

---

```bash
#!/usr/bin/env bash

############################################################
# CASE STATEMENT IN BASH
#
# Purpose:
#   Used for pattern matching (like switch-case).
#
# Syntax:
#
# case "variable" in
#   pattern1) commands ;;
#   pattern2) commands ;;
#   *)        default ;;
# esac
#
############################################################


############################################################
# 1️⃣ BASIC CASE EXAMPLE (Using ;;)
#
# - ;; means STOP after first match
# - Only first matching block executes
############################################################

s='dave'

case "$s" in
  d*)  echo 'matched d*';;
  dave) echo 'matched dave';;
  f*)  echo 'matched f*';;
  foo) echo 'matched foo';;
  *)   echo 'matched *';;
esac

# Explanation:
# d* matches first (because dave starts with d)
# Execution stops at ;; so only:
# matched d*


############################################################
# 2️⃣ FALL-THROUGH USING ;&
#
# - ;& means execute next block WITHOUT checking pattern
# - Like C language fall-through
############################################################

s='far'

case "$s" in
  d*)  echo 'matched d*';;
  dave) echo 'matched dave';&
  f*)  echo 'matched f*';&
  foo) echo 'matched foo';&
  *)   echo 'matched *';&
esac

# If f* matches:
# It will print:
# matched f*
# matched foo
# matched *
# (because ;& forces fall-through)


############################################################
# 3️⃣ FALL-THROUGH USING ;;&
#
# - ;;& means:
#     Run current block
#     THEN re-check next pattern
# - Executes only if next pattern also matches
############################################################

s='dave'

case "$s" in
  d*)  echo 'matched d*';;&
  dave) echo 'matched dave';;&
  f*)  echo 'matched f*';;&
  foo) echo 'matched foo';;&
  *)   echo 'matched *';;&
esac

# Flow:
# d* matches → prints matched d*
# ;;& → re-check next pattern
# dave matches → prints matched dave
# f* does NOT match
# foo does NOT match
# * always matches → prints matched *


############################################################
# PATTERN RULES (GLOB PATTERNS)
#
# d*    → starts with d
# f*    → starts with f
# *     → matches everything
# ?     → matches one character
# [abc] → matches a or b or c
#
# NOTE: case uses glob patterns, NOT regex.
############################################################


############################################################
# IMPORTANT RULE: ORDER MATTERS
#
# Specific patterns should come BEFORE general ones.
#
# WRONG:
#   d*)
#   dave)
#
# Because d* will catch dave first.
#
############################################################


############################################################
# WHEN TO USE CASE
#
# - CLI argument parsing
# - File extension handling
# - OS detection
# - Menu systems
# - Pattern grouping
#
############################################################


############################################################
# CASE vs IF
#
# if [[ $var == pattern ]] → Single condition
#
# case → Cleaner for multiple pattern checks
#
############################################################
```