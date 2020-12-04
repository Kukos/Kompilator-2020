#ifndef LOOP_HPP
#define LOOP_HPP

#include <memory>

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
    std::shared_ptr<Lvalue> iterator;
    std::shared_ptr<Lvalue> counter;
    std::string start_label;
    std::string end_label;
    looptype_t type;

public:
    Loop(const std::shared_ptr<Lvalue>& iterator, const std::shared_ptr<Lvalue>& counter, const std::string& start_label, const std::string& end_label,  looptype_t type) noexcept;

    std::shared_ptr<Lvalue> get_iterator() const noexcept { return iterator; }
    std::shared_ptr<Lvalue> get_counter() const noexcept { return counter; }
    const std::string& get_start_label() const noexcept { return start_label; }
    const std::string& get_end_label() const noexcept { return end_label; }
    looptype_t get_type() const noexcept { return type; }
};

#endif


