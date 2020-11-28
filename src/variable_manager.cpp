#include <variable_manager.hpp>

void Variable_manager::declare_variable(Lvalue* val) noexcept
{
    // Alloc memory
    val->set_addr(Architecture::alloc(val->get_size()));

    // Declare variable
    variables[val->get_name()] = val;
}

void Variable_manager::undeclare_variable(Lvalue* val) noexcept
{
    Value *to_delete = variables[val->get_name()];

    variables.erase(val->get_name());
    delete to_delete;
}

Lvalue* Variable_manager::get_variable(const std::string& name) noexcept
{
    if (!is_variable_declared(name))
        return NULL;

    return variables[name];
}

bool Variable_manager::is_variable_declared(const std::string& name) const noexcept
{
    return variables.find(name) != variables.end();
}