#ifndef COMPILER_HPP
#define COMPILER_HPP

#include <variable_manager.hpp>
#include <loop_manager.hpp>

class Compiler
{
private:
    Variable_manager var_manager;
    Loop_manager loop_manager;
public:
    Variable_manager& get_var_manager() noexcept { return var_manager; }
    Loop_manager& get_loop_manager() noexcept { return loop_manager; }
};


#endif