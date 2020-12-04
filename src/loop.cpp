#include <loop.hpp>

Loop::Loop(const std::shared_ptr<Lvalue>& iterator, const std::shared_ptr<Lvalue>& counter, const std::string& start_label, const std::string& end_label,  looptype_t type) noexcept
: iterator{iterator}, counter{counter}, start_label{start_label}, end_label{end_label}, type{type}
{

}