## Single-Line Comments
- Start a line with #.
- Bash ignores everything after # on that line.
```bash
#!/bin/bash

# This is a single-line comment
echo "Hello, World!"  # Inline comment after a command
```

## Inline Comments
- Can be placed after commands on the same line.
```bash
echo "Install nginx"  # This prints the installation step
```

## Multi-Line Comments
Bash has no native multi-line comment syntax. Use one of these tricks:
- Using : (No-op)
```bash
: '
This is a multi-line comment
Spanning multiple lines
Ignored by Bash
'
```
- Using <<COMMENT (Here Document)
```bash
<<COMMENT
This is another way to create
multi-line comments in Bash.
It will be ignored by the shell.
COMMENT
```

## Commenting Out Code
```bash
# echo "This line will not run"
echo "This line will run"
```

## Tips & Best Practices
- Always use comments to explain complex logic.
- Keep comments short and clear.
- Use inline comments sparingly; prefer explanatory blocks above the code.
- Use docstrings for functions (not enforced by Bash, but a convention):
```bash
my_function() {
    # This function prints a greeting message
    echo "Hello, $1"
}
```

## Combining Comments with Echo
- You can print sections or purpose headers in scripts:
```bash
echo "
########### Script Starting ###########
Purpose: Install NGINX
######################################
"
```
