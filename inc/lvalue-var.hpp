#ifndef LVALUE_VAR_HPP
#define LVALUE_VAR_HPP

#include <lvalue.hpp>

class Lvalue_var : public Lvalue
{
public:
    Lvalue_var(const std::string& name, bool is_mutuable) noexcept;

    Architecture::addr_t get_size() const noexcept override { return 1; }
};

#endif