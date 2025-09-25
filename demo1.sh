#!/bin/bash
foo() {
    echo "Inside foo"
    return 1
    echo "Never runs"
}

bar() {
    echo "Inside bar"
    exit 1
    echo "Never runs"
}

foo
echo "After foo, still running"

bar
echo "This will never print"
