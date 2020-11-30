#include <bitset>
#include <bits/stdc++.h>

#include <assembler_generator.hpp>
#include <assembler.hpp>
#include <rvalue.hpp>
#include <lvalue.hpp>
#include <lvalue-var.hpp>
#include <lvalue-array.hpp>

Assembler_generator::Label_manager::Label_manager(Assembler_generator* asm_generator) noexcept
: asm_generator{asm_generator}, label_counter{1}
{

}

std::string Assembler_generator::Label_manager::create_label(const std::string& name) noexcept
{
    return name + "_" + std::to_string(label_counter++);
}

std::string Assembler_generator::Label_manager::create_label() noexcept
{
    return create_label("LABEL");
}

void Assembler_generator::Label_manager::insert_label(const std::string& label) noexcept
{
    uint64_t label_line = asm_generator->get_current_asm_line() + 1;

    auto lab = labels.find(label);
    // insert_label was called before jump_to_label, so there is no label. Add label
    if (lab == labels.end())
        labels[label] = std::make_pair(label_line, std::vector<uint64_t>());
    else // someone set line as a jump point from to label, so now set only jump point to as a label_line
        lab->second.first = label_line;
}

void Assembler_generator::Label_manager::jump_to_label(const std::string& jump_code, const std::string& label) noexcept
{
    // jump_code is incomplete as JUMP or JZERO x or JODD y, but this is fine. Add it to code and add jump from point to label
    asm_generator->add_code(jump_code);

    // jump code is here, so current line is our jump to point
    uint64_t jump_line = asm_generator->get_current_asm_line();
    auto lab = labels.find(label);

    // jump_to_label was called before insert_label, so there is no label.
    // Add label with invalid label line, but add jump from point to vector
    if (lab == labels.end())
        labels[label] = std::make_pair(0, std::vector<uint64_t>{jump_line});
    else // there is a label here, so add another jump from point to vector
        lab->second.second.push_back(jump_line);
}

void Assembler_generator::Label_manager::generate_code_from_labels() noexcept
{
    for (auto& label : labels)
    {
        uint64_t jump_to = label.second.first;
        auto& jump_from_vector = label.second.second;
        for (auto& jump_from : jump_from_vector)
        {
            int64_t jump_offset = static_cast<int64_t>(jump_to) - static_cast<int64_t>(jump_from);
            asm_generator->code[jump_from - 1] += " " + std::to_string(jump_offset) + "\n";
        }
        // we complete code based on this vector, we dont need values from this vector
        jump_from_vector.clear();
    }
}

Assembler_generator::Assembler_generator() noexcept
: label_manager{Assembler_generator::Label_manager(this)}
{

}

void Assembler_generator::add_code(const std::string& line) noexcept
{
    code.push_back(line);
}

size_t Assembler_generator::get_current_asm_line() const noexcept
{
    return code.size();
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

void Assembler_generator::asm_jump_label(const std::string& label) noexcept
{
    label_manager.jump_to_label(Assembler::instruction_jump(), label);
}

void Assembler_generator::asm_jzero_label(const Register& x, const std::string& label) noexcept
{
    label_manager.jump_to_label(Assembler::instruction_jzero() + " " + x.get_name(), label);
}

void Assembler_generator::asm_jodd_label(const Register& x, const std::string& label) noexcept
{
    label_manager.jump_to_label(Assembler::instruction_jodd() + " " + x.get_name(), label);
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

void Assembler_generator::finish_code_generation() noexcept
{
    label_manager.generate_code_from_labels();
}

std::string Assembler_generator::get_generated_code() const noexcept
{
    std::string generated_code = "";

    for (auto const& line: code)
        generated_code += line;

    return generated_code;
}

void Assembler_generator::finish_program() noexcept
{
    asm_halt();
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

void Assembler_generator::load(const Register& x, const Value& val) noexcept
{
    if (val.get_type() == Value::VALTYPE_RVALUE)
        move_rvalue_to_reg(x, dynamic_cast<const Rvalue&>(val).get_value());
    else
    {
        // x := &var or x := &arr[i]
        move_addr_to_reg(x, dynamic_cast<const Lvalue&>(val));

        // x := *(&var)
        asm_load(x, x);
    }
}

void Assembler_generator::store(const Lvalue& var, const Register& x) noexcept
{
    Register& temp = Architecture::get_free_register();
    temp.lock();

    // temp := &var
    move_addr_to_reg(temp, var);

    asm_store(x, temp);

    temp.unlock();
}

void Assembler_generator::read(const Lvalue& var) noexcept
{
    Register& ret = Architecture::get_retval_register();
    ret.lock();

    // ret := &var
    move_addr_to_reg(ret, var);

    // *ret := scan from stdin
    asm_get(ret);

    ret.unlock();
}

void Assembler_generator::write(const Value& val) noexcept
{
    Register& ret = Architecture::get_retval_register();
    ret.lock();

    if (val.get_type() == Value::VALTYPE_RVALUE)
    {
        // Alloc new memory for this value (we wont deallocate it), we have 2^64 memory
        // and this kind of leaks are only possible by writting some values into code like WRITE 10,
        // so this is safe
        Architecture::addr_t val_addr = Architecture::alloc(1);
        move_rvalue_to_reg(ret, val_addr); // x := &memory

        Register& temp = Architecture::get_free_register();
        temp.lock();

        // temp := val
        move_rvalue_to_reg(temp, dynamic_cast<const Rvalue&>(val).get_value());

        // *ret = val
        asm_store(temp, ret);

        temp.unlock();
    }
    else
        // ret := &var
        move_addr_to_reg(ret, dynamic_cast<const Lvalue&>(val));

    // here ret := &var or ret := &(int){5}, so we can print it
    asm_put(ret);

    ret.unlock();
}

void Assembler_generator::add(const Value& val1, const Value& val2) noexcept
{
    Register& retval = Architecture::get_retval_register();
    retval.lock();

    Register& temp = Architecture::get_free_register();
    temp.lock();

    load(retval, val1); // retval = val1
    load(temp, val2); // temp = val1

    asm_add(retval, temp); // retval = retval + temp

    temp.unlock();

    // retval will be used in assignment, so dont unlock it now
}

void Assembler_generator::sub(const Value& val1, const Value& val2) noexcept
{
    Register& retval = Architecture::get_retval_register();
    retval.lock();

    Register& temp = Architecture::get_free_register();
    temp.lock();

    load(retval, val1); // retval = val1
    load(temp, val2); // temp = val1

    asm_sub(retval, temp); // retval = retval - temp

    temp.unlock();

    // retval will be used in assignment, so dont unlock it now
}

void Assembler_generator::mul(const Value& val1, const Value& val2) noexcept
{
    Register& retval = Architecture::get_retval_register();
    retval.lock();

    Register& temp1 = Architecture::get_free_register();
    temp1.lock();
    load(temp1, val1);

    Register& temp2 = Architecture::get_free_register();
    temp2.lock();
    load(temp2, val2);

    const std::string label_end = label_manager.create_label("MUL_END");
    const std::string label_loop = label_manager.create_label("MUL_LOOP");
    const std::string label_inside_loop = label_manager.create_label("MUL_INSIDE_LOOP");
    const std::string label_odd = label_manager.create_label("MUL_ODD");

    // Peasant Multiplication
    asm_reset(retval);
    asm_jzero_label(temp1, label_end);

    // we reuse this jzero as initial check and loop check
    label_manager.insert_label(label_loop);
    asm_jzero_label(temp2, label_end);
    asm_jodd_label(temp2, label_odd);
    label_manager.insert_label(label_inside_loop);
    asm_shl(temp1);
    asm_shr(temp2);
    asm_jump_label(label_loop);

    label_manager.insert_label(label_odd);
    asm_add(retval, temp1);
    asm_jump_label(label_inside_loop);

    temp1.unlock();
    temp2.unlock();

    label_manager.insert_label(label_end);
    // retval will be used in assignment, so dont unlock it now
}