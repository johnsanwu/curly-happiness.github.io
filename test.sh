#!/bin/bash

# Test script to verify the fix in index.html

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Running tests..."

# 1. Check if the correct 'integrity' attribute exists.
# We are looking for the exact line to ensure it's correct.
if ! grep -q 'integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="' index.html; then
    echo "TEST FAILED: The 'integrity' attribute is missing or incorrect."
    exit 1
fi

# 2. Check if the incorrect 'xintegrity' attribute still exists.
# The test should fail if it finds this attribute.
if grep -q 'xintegrity=' index.html; then
    echo "TEST FAILED: The incorrect 'xintegrity' attribute was found."
    exit 1
fi

echo "All tests passed!"
exit 0
