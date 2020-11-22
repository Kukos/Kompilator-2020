#include <loop.hpp>

Loop::Loop(Lvalue* iterator, Lvalue* counter, looptype_t type) noexcept
: iterator{iterator}, counter{counter}, type{type}
{

}