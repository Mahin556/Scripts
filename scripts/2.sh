#!/usr/bin/env bash
#
# ------------------------------------------------------------
# LOOPING OVER ARGUMENTS IN BASH (THE RIGHT WAY)
# ------------------------------------------------------------
#
# ❌ WRONG WAY:
#
for arg in $*; do
  echo "<$arg>"
done
#
# Why this is wrong:
# - $* expands to all arguments
# - Without quotes → word splitting happens
# - Arguments with spaces get broken apart
#
# Example:
# ./script.sh foo bar "hello    world"
#
# You expect 3 arguments.
# You get 5 (because "hello    world" gets split).
#
# ------------------------------------------------------------
# ❌ STILL WRONG:
#
for arg in "$*"; do
  echo "<$arg>"
done
#
# Why this is wrong:
# - "$*" joins ALL arguments into ONE single string
# - You now get exactly ONE argument
#
# Example result:
# "foo bar hello    world"
#
# Everything becomes one big argument.
#
# ------------------------------------------------------------
# ❌ ALSO WRONG:
#
for arg in $@; do
  echo "<$arg>"
done
#
# Why?
# - $@ without quotes behaves like $*
# - Word splitting still happens
#
# ------------------------------------------------------------
# ✅ CORRECT WAY:
#
for arg in "$@"; do
  echo "<$arg>"
done
#
# Why this works:
# - "$@" preserves each positional parameter
# - Each argument stays separate
# - Spaces inside arguments are preserved
#
# Example:
# ./script.sh foo bar "hello    world"
#
# Output:
# <foo>
# <bar>
# <hello    world>
#
# Perfect. Exactly 3 arguments.
#
# ------------------------------------------------------------
# KEY DIFFERENCE:
#
# $*      → all arguments as one word list
# "$*"    → all arguments as ONE single string
# $@      → like $*, subject to word splitting
# "$@"    → EACH argument preserved correctly  ✅
#
# ------------------------------------------------------------
# RULE TO REMEMBER:
#
# When looping over arguments in bash:
#
#   ALWAYS USE:  for arg in "$@"
#
# If you don’t know what to do in bash…
# QUOTE IT (correctly).
#
# ------------------------------------------------------------
