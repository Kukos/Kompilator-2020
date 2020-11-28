#ifndef ASSEMBLER_GENERATOR_HPP
#define ASSEMBLER_GENERATOR_HPP

#include <vector>
#include <string>
#include <cstdint>

#include <value.hpp>
#include <lvalue.hpp>
#include <register.hpp>
#include <architecture.hpp>

class Assembler_generator
{
private:
    // manage asm code
    std::vector<std::string> code;
    void add_code(const std::string& line) noexcept;

    // Instructions defined by VM. Methods generate and add code into code vector
    void asm_get(const Register& x) noexcept;
    void asm_put(const Register& x) noexcept;
    void asm_load(const Register& x, const Register& y) noexcept;
    void asm_store(const Register& x, const Register& y) noexcept;
    void asm_add(const Register& x, const Register& y) noexcept;
    void asm_sub(const Register& x, const Register& y) noexcept;
    void asm_reset(const Register& x) noexcept;
    void asm_inc(const Register& x) noexcept;
    void asm_dec(const Register& x) noexcept;
    void asm_shr(const Register& x) noexcept;
    void asm_shl(const Register& x) noexcept;
    void asm_jump(int64_t offset) noexcept;
    void asm_jzero(const Register& x, int64_t offset) noexcept;
    void asm_jodd(const Register& x, int64_t offset) noexcept;
    void asm_halt() noexcept;

    // private algorithm to pump rvalue and addr to register. Methods generate and add code into code vector
    void move_rvalue_to_reg(const Register& x, uint64_t val) noexcept;
    void move_addr_to_reg(const Register& x, const Lvalue& var) noexcept;

public:
    // Methods defined by Language. Generator produce code and write into code vector
    void load(const Register& x, const Value& val) noexcept;
    void store(const Lvalue& var, const Register& x) noexcept;

    void read(const Lvalue& var) noexcept;
    void write(const Value& val) noexcept;

    void finish_program() noexcept;


    // get code in 1 string
    std::string get_generated_code() const noexcept;
};

#endif