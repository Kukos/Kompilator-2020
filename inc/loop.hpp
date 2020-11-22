#ifndef LOOP_HPP
#define LOOP_HPP

#include <lvalue.hpp>

class Loop
{
public:
    typedef enum
    {
        LOOP_TYPE_FOR_DO,
        LOOP_TYPE_FOR_DOWNTO,
        LOOP_TYPE_WHILE,
        LOOP_TYPE_UNTIL
    } looptype_t;

private:
    Lvalue* iterator;
    Lvalue* counter;
    looptype_t type;

public:
    Loop(Lvalue* iterator, Lvalue* counter, looptype_t type) noexcept;

    Lvalue* get_iterator() const noexcept { return iterator; }
    Lvalue* get_counter() const noexcept { return counter; }
    looptype_t get_type() const noexcept { return type; }
};

#endif


