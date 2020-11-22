#include <architecture.hpp>

// 0 is a NULL
Architecture::addr_t Architecture::first_free_addr = 1;

Architecture::addr_t Architecture::alloc(Architecture::addr_t bytes) noexcept
{
    addr_t alloc_addr = first_free_addr;
    first_free_addr += bytes;

    return alloc_addr;
}