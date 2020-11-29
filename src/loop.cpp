#include <loop.hpp>

Loop::Loop(const std::shared_ptr<Lvalue>& iterator, const std::shared_ptr<Lvalue>& counter, looptype_t type) noexcept
: iterator{iterator}, counter{counter}, type{type}
{

}