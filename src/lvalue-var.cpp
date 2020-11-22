#include <lvalue-var.hpp>

Lvalue_var::Lvalue_var(const std::string& name, bool is_mutuable) noexcept
: Lvalue(name, is_mutuable, VALTYPE_LVALUE_VAR)
{

}