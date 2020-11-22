#!/bin/bash

# Simple E2E tests

# Test1. Correct gramma checker. Expected result: empty stderr and 0 as retval
in_file="./gramma_correct.txt"
out_file="./out.txt"
error_file="./error.txt"
name="Gramma correct"
echo -n "TEST: $name ..."
../kompilator $in_file $out_file 2>$error_file
if [ $? -eq 1 ] || [ -s $error_file ]; then
    echo " FAILED"
else
    echo " PASSED"
fi

rm $out_file
rm $error_file
