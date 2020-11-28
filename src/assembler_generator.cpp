#include <bitset>
#include <bits/stdc++.h>

#include <assembler_generator.hpp>
#include <assembler.hpp>
#include <rvalue.hpp>
#include <lvalue.hpp>
#include <lvalue-var.hpp>
#include <lvalue-array.hpp>

void Assembler_generator::add_code(const std::string& line) noexcept
{
    code.push_back(line);
}

void Assembler_generator::asm_get(const Register& x) noexcept
{
    add_code(Assembler::instruction_get() + " " + x.get_name() + "\n");
}

void Assembler_generator::asm_put(const Register& x) noexcept
{
    add_code(Assembler::instruction_put() + " " + x.get_name() + "\n");
}

void Assembler_generator::asm_reset(const Register& x) noexcept
{
    add_code(Assembler::instruction_reset() + " " + x.get_name() + "\n");
}

void Assembler_generator::asm_inc(const Register& x) noexcept
{
    add_code(Assembler::instruction_inc() + " " + x.get_name() + "\n");
}

void Assembler_generator::asm_dec(const Register& x) noexcept
{
    add_code(Assembler::instruction_dec() + " " + x.get_name() + "\n");
}

void Assembler_generator::asm_shr(const Register& x) noexcept
{
    add_code(Assembler::instruction_shr() + " " + x.get_name() + "\n");
}

void Assembler_generator::asm_shl(const Register& x) noexcept
{
    add_code(Assembler::instruction_shl() + " " + x.get_name() + "\n");
}

void Assembler_generator::asm_load(const Register& x, const Register& y) noexcept
{
    add_code(Assembler::instruction_load() + " " + x.get_name() + " " + y.get_name() +  "\n");
}

void Assembler_generator::asm_store(const Register& x, const Register& y) noexcept
{
    add_code(Assembler::instruction_store() + " " + x.get_name() + " " + y.get_name() +  "\n");
}

void Assembler_generator::asm_add(const Register& x, const Register& y) noexcept
{
    add_code(Assembler::instruction_add() + " " + x.get_name() + " " + y.get_name() +  "\n");
}

void Assembler_generator::asm_sub(const Register& x, const Register& y) noexcept
{
    add_code(Assembler::instruction_sub() + " " + x.get_name() + " " + y.get_name() +  "\n");
}

void Assembler_generator::asm_jump(int64_t offset) noexcept
{
    add_code(Assembler::instruction_jump() + " " + std::to_string(offset) + "\n");
}

void Assembler_generator::asm_jzero(const Register& x, int64_t offset) noexcept
{
    add_code(Assembler::instruction_jzero() + " " + x.get_name() + " " + std::to_string(offset) + "\n");
}

void Assembler_generator::asm_jodd(const Register& x, int64_t offset) noexcept
{
    add_code(Assembler::instruction_jodd() + " " + x.get_name() + " " + std::to_string(offset) + "\n");
}

void Assembler_generator::asm_halt() noexcept
{
    add_code(Assembler::instruction_halt() + "\n");
}

void Assembler_generator::move_rvalue_to_reg(const Register& x, uint64_t val) noexcept
{
    std::bitset<sizeof(val) * CHAR_BIT> bits(val);

    size_t i;
    for (i = bits.size() - 1; i > 0; --i)
        if (bits[i])
            break;

    asm_reset(x);
    for (; i > 0; --i)
        if (bits[i])
        {
            asm_inc(x);
            asm_shl(x);
        }
        else
        {
            asm_shl(x);
        }

    if (bits[i])
        asm_inc(x);
}

void Assembler_generator::move_addr_to_reg(const Register& x, const Lvalue& var) noexcept
{
    if (var.get_type() == Value::VALTYPE_LVALUE_VAR)
        move_rvalue_to_reg(x, dynamic_cast<const Lvalue_var&>(var).get_addr());
    else // Array, t[a] or t[10]
    {
        const Lvalue_array& arr = dynamic_cast<const Lvalue_array&>(var);
        move_rvalue_to_reg(x, arr.get_addr()); // x := &arr[0]

        Register& temp = Architecture::get_free_register();
        temp.lock();

        const Value* access_element = arr.get_access_element();
        if (access_element->get_type() == Value::VALTYPE_RVALUE)
            move_rvalue_to_reg(temp, dynamic_cast<const Rvalue*>(access_element)->get_value());
        else
        {
            move_rvalue_to_reg(temp, dynamic_cast<const Lvalue*>(access_element)->get_addr());
            asm_load(temp, temp); // temp := *(&access_element)
        }

        asm_add(x, temp); // x := &arr[access_element]

        move_rvalue_to_reg(temp, arr.get_access_offset()); // temp := offset

        asm_sub(x, temp); // x := &arr[access_element - array_offset]

        temp.unlock();
    }
}