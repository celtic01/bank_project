#!/bin/bash

# Check for the existence of a Makefile
if [ ! -f Makefile ]; then
  echo "Makefile not found in the current directory."
  exit 1
fi

# Reformat the Makefile by adjusting indentation (using sed)
# This script assumes that the Makefile is in the current directory
sed -i -e 's/^[ \t]*//' Makefile

echo "Makefile formatted."

# Optionally, you can add more formatting rules or use tools like `astyle`, `prettier`, or `makefile2graph` for more advanced formatting.

