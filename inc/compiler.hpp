#ifndef COMPILER_HPP
#define COMPILER_HPP

#include <variable_manager.hpp>
#include <loop_manager.hpp>
#include <assembler_generator.hpp>

class Compiler
{
private:
    Variable_manager var_manager;
    Loop_manager loop_manager;
    Assembler_generator asm_generator;
public:
    Variable_manager& get_var_manager() noexcept { return var_manager; }
    Loop_manager& get_loop_manager() noexcept { return loop_manager; }
    Assembler_generator& get_asm_generator() noexcept { return asm_generator; }
};


#endif