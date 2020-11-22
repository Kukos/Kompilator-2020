#include <compiler.hpp>

void Compiler::declare_variable(Lvalue* val) noexcept
{
    // Alloc memory
    val->set_addr(Architecture::alloc(val->get_size()));

    // Declare variable
    variables[val->get_name()] = val;
}

void Compiler::undeclare_variable(Lvalue* val) noexcept
{
    Value *to_delete = variables[val->get_name()];

    variables.erase(val->get_name());
    delete to_delete;
}

Lvalue* Compiler::get_variable(const std::string& name) noexcept
{
    if (!is_variable_declared(name))
        return NULL;

    return variables[name];
}

bool Compiler::is_variable_declared(const std::string& name) const noexcept
{
    return variables.find(name) != variables.end();
}

void Compiler::add_loop_to_stack(const Loop& loop) noexcept
{
    stack_loop.push(loop);
}

Loop Compiler::get_loop_from_stack() noexcept
{
    Loop loop = stack_loop.top();
    stack_loop.pop();

    return loop;
}