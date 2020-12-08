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

# TEST 3 ARYTHMETIC ADD
in_file="./arythmetic_add.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./arythmetic_add_expected.txt"
error_file="./error.txt"
name="Arythmetic add"
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

# TEST 3 ARYTHMETIC SUB
in_file="./arythmetic_sub.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./arythmetic_sub_expected.txt"
error_file="./error.txt"
name="Arythmetic sub"
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

# TEST 4 ARYTHMETIC MUL
in_file="./arythmetic_mul.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./arythmetic_mul_expected.txt"
error_file="./error.txt"
name="Arythmetic mul"
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

# TEST 5 ARYTHMETIC DIV
in_file="./arythmetic_div.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./arythmetic_div_expected.txt"
error_file="./error.txt"
name="Arythmetic div"
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

# TEST 6 ARYTHMETIC MOD
in_file="./arythmetic_mod.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./arythmetic_mod_expected.txt"
error_file="./error.txt"
name="Arythmetic mod"
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

# TEST 7 LOOP FOR
in_file="./loop_for.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./loop_for_expected.txt"
error_file="./error.txt"
name="Loop for"
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

# TEST 8 LOOP WHILE
in_file="./loop_while.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./loop_while_expected.txt"
error_file="./error.txt"
name="Loop while"
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

# TEST 9 LOOP UNTIL
in_file="./loop_until.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./loop_until_expected.txt"
error_file="./error.txt"
name="Loop until"
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

# TEST 10 IF ELSE THEN
in_file="./cond_if.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./cond_if_expected.txt"
error_file="./error.txt"
name="If else"
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

# E2E TESTS

# TEST 1 created by Maciej Gebala
in_file="./e2e_gebala1.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala1_expected.txt"
error_file="./error.txt"
name="e2e gebala1"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "222" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 2 created by Maciej Gebala
in_file="./e2e_gebala2.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala2_expected.txt"
error_file="./error.txt"
name="e2e gebala2"
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

# TEST 3 created by Maciej Gebala
in_file="./e2e_gebala3.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala3_expected.txt"
error_file="./error.txt"
name="e2e gebala3"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "12345678" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 4 created by Maciej Gebala
in_file="./e2e_gebala4.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala4_expected.txt"
error_file="./error.txt"
name="e2e gebala4"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "1234567890 1234567890987654321 987654321" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 5 created by Maciej Gebala
in_file="./e2e_gebala5.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala5_expected.txt"
error_file="./error.txt"
name="e2e gebala5"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "100" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 6 created by Maciej Gebala
in_file="./e2e_gebala6.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala6_expected.txt"
error_file="./error.txt"
name="e2e gebala6"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "20" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 7 created by Maciej Gebala
in_file="./e2e_gebala7.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala7_expected.txt"
error_file="./error.txt"
name="e2e gebala7"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "1" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 8 created by Maciej Gebala
in_file="./e2e_gebala8.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala8_expected.txt"
error_file="./error.txt"
name="e2e gebala8"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "100" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TESTS 2020y from M GEBALA

# TEST 1 created by Maciej Gebala
in_file="./e2e_gebala_2020_1.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala_2020_1_expected.txt"
error_file="./error.txt"
name="e2e gebala2020 1"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "1 0" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 2 created by Maciej Gebala
in_file="./e2e_gebala_2020_2.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala_2020_2_expected.txt"
error_file="./error.txt"
name="e2e gebala2020 2"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "11" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 3 created by Maciej Gebala
in_file="./e2e_gebala_2020_3.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala_2020_3_expected.txt"
error_file="./error.txt"
name="e2e gebala2020 3"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "1" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 4 created by Maciej Gebala
in_file="./e2e_gebala_2020_4.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala_2020_4_expected.txt"
error_file="./error.txt"
name="e2e gebala2020 4"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "20" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 5 created by Maciej Gebala
in_file="./e2e_gebala_2020_5.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala_2020_5_expected.txt"
error_file="./error.txt"
name="e2e gebala2020 5"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "20" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 6 created by Maciej Gebala
in_file="./e2e_gebala_2020_6.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala_2020_6_expected.txt"
error_file="./error.txt"
name="e2e gebala2020 6"
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

# TEST 7 created by Maciej Gebala
in_file="./e2e_gebala_2020_7.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala_2020_7_expected.txt"
error_file="./error.txt"
name="e2e gebala2020 7"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "1234567890 1234567890987654321 987654321" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 8 created by Maciej Gebala
in_file="./e2e_gebala_2020_8.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala_2020_8_expected.txt"
error_file="./error.txt"
name="e2e gebala2020 8"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "0 0 0" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 9 created by Maciej Gebala
in_file="./e2e_gebala_2020_9.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala_2020_9_expected.txt"
error_file="./error.txt"
name="e2e gebala2020 9"
../kompilator $in_file $asm_file 2>$error_file
echo -n "TEST: $name ..."
echo "12 23 34" | ../vm/maszyna-wirtualna-cln $asm_file | sed 's/? //g' | grep ">" | sed 's/> //g' >$out_file
diff_res=$(diff $out_file $expected_out_file)
if [ -s $error_file ] || [ "$diff_res" ]; then
    echo -e " \033[0;31mFAILED\033[0m"
else
    echo -e " \033[0;32mPASSED\033[0m"
fi

rm -f $asm_file
rm -f $out_file
rm -f $error_file

# TEST 10 created by Maciej Gebala
in_file="./e2e_gebala_2020_10.txt"
asm_file="./asm.txt"
out_file="./out.txt"
expected_out_file="./e2e_gebala_2020_10_expected.txt"
error_file="./error.txt"
name="e2e gebala2020 10"
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