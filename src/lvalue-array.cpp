#include <lvalue-array.hpp>

Lvalue_array::Lvalue_array(const std::string& name, Architecture::addr_t offset, Architecture::addr_t size) noexcept
: Lvalue(name, true, VALTYPE_LVALUE_ARRAY), offset{offset}, size{size}
{

}