#ifndef COMPILER_HPP
#define COMPILER_HPP

#include <map>
#include <stack>

#include <lvalue.hpp>
#include <loop.hpp>

class Compiler
{
private:
    std::map<std::string, Lvalue*> variables;
    std::stack<Loop> stack_loop;

public:
    void declare_variable(Lvalue* val) noexcept;
    void undeclare_variable(Lvalue* val) noexcept;
    bool is_variable_declared(const std::string& name) const noexcept;
    Lvalue* get_variable(const std::string& name) noexcept;
    void add_loop_to_stack(const Loop& loop) noexcept;
    Loop get_loop_from_stack() noexcept;
};


#endif