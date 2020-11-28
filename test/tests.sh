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
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $out_file
rm -f $error_file


# Test2. Error: Incorrect array range. Expected result: non-empty stderr and 1 as retval
in_file="./error1.txt"
out_file="./out.txt"
error_file="./error.txt"
expected_error_file="./error_expected1.txt"
name="Incorrect array range"
echo -n "TEST: $name ..."
../kompilator $in_file $out_file 2>$error_file
diff_res=$(diff $error_file $expected_error_file)
if [ $? -eq 1 ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $out_file
rm -f $error_file


# Test3. Error: Redeclaration. Expected result: non-empty stderr and 1 as retval
in_file="./error2.txt"
out_file="./out.txt"
error_file="./error.txt"
expected_error_file="./error_expected2.txt"
name="Variable redaclaration"
echo -n "TEST: $name ..."
../kompilator $in_file $out_file 2>$error_file
diff_res=$(diff $error_file $expected_error_file)
if [ $? -eq 1 ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $out_file
rm -f $error_file

# Test4. Error: Undeclared variable. Expected result: non-empty stderr and 1 as retval
in_file="./error3.txt"
out_file="./out.txt"
error_file="./error.txt"
expected_error_file="./error_expected3.txt"
name="Undeclared variable"
echo -n "TEST: $name ..."
../kompilator $in_file $out_file 2>$error_file
diff_res=$(diff $error_file $expected_error_file)
if [ $? -eq 1 ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $out_file
rm -f $error_file

# Test5. Error: Incorrect use of array. Expected result: non-empty stderr and 1 as retval
in_file="./error4.txt"
out_file="./out.txt"
error_file="./error.txt"
expected_error_file="./error_expected4.txt"
name="Incorrect use of array"
echo -n "TEST: $name ..."
../kompilator $in_file $out_file 2>$error_file
diff_res=$(diff $error_file $expected_error_file)
if [ $? -eq 1 ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $out_file
rm -f $error_file

# Test6. Error: Incorrect use of variable. Expected result: non-empty stderr and 1 as retval
in_file="./error5.txt"
out_file="./out.txt"
error_file="./error.txt"
expected_error_file="./error_expected5.txt"
name="Incorrect use of variable"
echo -n "TEST: $name ..."
../kompilator $in_file $out_file 2>$error_file
diff_res=$(diff $error_file $expected_error_file)
if [ $? -eq 1 ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $out_file
rm -f $error_file

# Test7. Error: Unitializated variable. Expected result: non-empty stderr and 1 as retval
in_file="./error6.txt"
out_file="./out.txt"
error_file="./error.txt"
expected_error_file="./error_expected6.txt"
name="Unitializated variable"
echo -n "TEST: $name ..."
../kompilator $in_file $out_file 2>$error_file
diff_res=$(diff $error_file $expected_error_file)
if [ $? -eq 1 ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $out_file
rm -f $error_file

# Test8. Error: Unitializated variable. Expected result: non-empty stderr and 1 as retval
in_file="./error7.txt"
out_file="./out.txt"
error_file="./error.txt"
expected_error_file="./error_expected7.txt"
name="Unitializated variable"
echo -n "TEST: $name ..."
../kompilator $in_file $out_file 2>$error_file
diff_res=$(diff $error_file $expected_error_file)
if [ $? -eq 1 ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $out_file
rm -f $error_file

# Test9. Error: Undeclared variable after forloop. Expected result: non-empty stderr and 1 as retval
in_file="./error8.txt"
out_file="./out.txt"
error_file="./error.txt"
expected_error_file="./error_expected8.txt"
name="Undeclared variable after forloop"
echo -n "TEST: $name ..."
../kompilator $in_file $out_file 2>$error_file
diff_res=$(diff $error_file $expected_error_file)
if [ $? -eq 1 ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $out_file
rm -f $error_file

# Test10. Error: Changing const variable. Expected result: non-empty stderr and 1 as retval
in_file="./error9.txt"
out_file="./out.txt"
error_file="./error.txt"
expected_error_file="./error_expected9.txt"
name="Changing const variable"
echo -n "TEST: $name ..."
../kompilator $in_file $out_file 2>$error_file
diff_res=$(diff $error_file $expected_error_file)
if [ $? -eq 1 ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $out_file
rm -f $error_file

# TESTS OF CORRETNESS USING VM

# TEST1 I/O
in_file="./io.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./io_expected.txt"
error_file="./error.txt"
name="I/O"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "5 1111 99 88 77 66" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 2 ARYTHMETIC ASSIGNMENT
in_file="./arythmetic_assign.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./arythmetic_assign_expected.txt"
error_file="./error.txt"
name="Arythmetic assignment"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file