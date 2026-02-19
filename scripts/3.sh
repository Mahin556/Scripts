#!/usr/bin/env bash

# ============================================================
# LISTING FILES IN BASH — THE CORRECT WAY
# ============================================================
#
# This explains why:
#   ls | while read ...
# is WRONG
#
# And why:
#   for f in ./files/*; do ...
# is CORRECT
#
# ============================================================
# ❌ THE "CRINGE" VERSION
# ============================================================

ls ./files | while read file; do
  echo "<$file>"
done

# Why people think this works:
# - ls prints files separated by newlines
# - while read reads line by line
# - So it looks correct
#
# But this is fundamentally broken.


# ============================================================
# 🚨 THE REAL PROBLEM
# ============================================================
#
# Filenames in Linux can contain:
# - spaces
# - tabs
# - newlines
# - almost any character except NULL
#
# Example:
#
# A file can literally be named:
#
#   b<newline>c
#
# That is ONE file whose name contains a newline.
#
# If you run:
#
#   ls files | cat
#
# It will print:
#
#   a
#   b
#   c
#   d
#   e
#
# But that does NOT mean there are 5 files.
#
# There may actually be:
#   - a
#   - b\nc   (ONE file)
#   - d
#   - e
#
# ls output is ambiguous.
#
# You cannot distinguish:
#   - newline separating files
#   - newline inside filename
#
# Therefore:
#   Parsing ls output is unsafe.
#
# ============================================================
# ❌ WHY "ls | while read" FAILS
# ============================================================
#
# Because:
# - ls formats output for humans
# - read splits on newline
# - newline is valid inside filenames
#
# Your script lies to you.
#
# RULE:
#   Never parse ls.
#
# ============================================================
# ✅ THE "BASED" VERSION (CORRECT)
# ============================================================

# for f in ./files/*; do
#   echo "file is $f"
# done

# Why this works:
# - * is expanded by the shell (globbing)
# - The shell already knows the real filenames
# - No parsing of formatted text
# - Works with:
#     spaces
#     tabs
#     newlines
#     weird characters
#
# The shell expands:
#   ./files/*
#
# Into actual pathnames BEFORE the loop runs.


# ============================================================
# 🧠 EVEN SAFER (PROPER QUOTING)
# ============================================================

for f in ./files/*; do
  printf 'file is %q\n' "$f"
done

# %q prints filenames safely escaped.
# Always quote "$f".


# ============================================================
# 🏆 FULLY BULLETPROOF METHOD (find + NULL separator)
# ============================================================

find ./files -type f -print0 | while IFS= read -r -d '' f; do
  printf 'file is %q\n' "$f"
done

find . -type f | while read f; do ...

# Why this is bulletproof:
# - -print0 separates filenames with NULL
# - NULL is the ONLY character not allowed in filenames
# - read -d '' reads until NULL
#
# This handles absolutely everything safely.


# ============================================================
# 🔥 CORE RULES TO REMEMBER
# ============================================================
#
# ❌ Never do:
#     for f in `ls`
#     for f in $(ls)
#     ls | while read ...
#
# ✅ Always do:
#     for f in *
#     for f in ./dir/*
#
# Or for extreme safety:
#     find -print0 + read -d ''
#
# ------------------------------------------------------------
# FINAL TRUTH:
#
# ls is for humans.
# Globbing is for scripts.
#
# If your script depends on parsing ls output,
# your script is broken.
# ============================================================
