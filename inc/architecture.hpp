#ifndef ARCHITECTURE_HPP
#define ARCHITECTURE_HPP

#include <cstdint>

class Architecture
{
public:
    typedef uint64_t addr_t;
    static Architecture::addr_t alloc(Architecture::addr_t bytes) noexcept;

private:
    static Architecture::addr_t first_free_addr;
};

#endif