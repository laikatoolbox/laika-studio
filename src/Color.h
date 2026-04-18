#ifndef COLOR_H
#define COLOR_H

#include <cmath>
namespace LaikaShared {

class Color {
public:
    Color();
};

struct Lab {float L; float a; float b;};
struct RGB {float r; float g; float b;};

Lab linear_srgb_to_oklab(RGB c);
RGB oklab_to_linear_srgb(Lab c);
} // namespace LaikaShared

#endif // COLOR_H
