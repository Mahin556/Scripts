```bash
############################################################
# expr COMMAND (Bash Arithmetic - Old Style)
#
# Purpose:
# Perform arithmetic and string operations.
#
# Syntax:
# expr operand1 operator operand2
#
# IMPORTANT:
# - Spaces are required between operands and operators
# - * must be escaped as \*
############################################################

# Arithmetic Examples
a=5
b=3

expr $a + $b      # 8
expr $a - $b      # 2
expr $a \* $b     # 15
expr $a / $b      # 1
expr $a % $b      # 2

############################################################
# Comparison
############################################################

expr $a = $b      # 0 (false)
expr $a '>' $b    # 1 (true)

############################################################
# String Operations
############################################################

expr length "hello"     # 5
expr substr "hello" 2 3 # ell
expr index "hello" l    # 3 (position)

############################################################
# Exit Status Rule:
# Result = 0 → exit status 1
# Result ≠ 0 → exit status 0
#
# Modern Replacement (Recommended):
#   $(( expression ))
#   (( expression ))
############################################################
```