#include "adapter.hpp"
#include "vp.hpp"

int sc_main(int argc, char* argv[])
{
    if (argc < 2) {
        std::cout << "Usage: ./vp <path_to_card_image>" << std::endl;
        return 1;
    }

    vp top("vp", argv, argc);
    sc_core::sc_start();

    return 0;
}
