#include <loop_manager.hpp>

void Loop_manager::add_loop_to_stack(const Loop& loop) noexcept
{
    stack_loop.push(loop);
}

Loop Loop_manager::get_loop_from_stack() noexcept
{
    Loop loop = stack_loop.top();
    stack_loop.pop();

    return loop;
}