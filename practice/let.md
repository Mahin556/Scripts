```bash
############################################################
# let COMMAND (Bash Arithmetic)
#
# Purpose:
# Perform arithmetic operations in Bash.
#
# Syntax:
# let expression
#
# Examples:
############################################################

a=5
b=3

let sum=a+b
echo $sum        # 8

let a++
echo $a          # 6

let a=a*2
echo $a          # 12

############################################################
# Important:
# - Used only for arithmetic
# - No $ needed inside expression
# - Exit status:
#     0 → result is NON-zero
#     1 → result is zero
#
# Modern alternative (recommended):
#     (( expression ))
############################################################
```