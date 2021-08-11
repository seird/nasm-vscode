#include "tests.h"

#include <stdint.h>


extern int64_t double_int(int64_t);


MU_TEST(test_double)
{
    MU_CHECK_INT_EQ(double_int(10), 2*10);
    MU_CHECK_INT_EQ(double_int(22), 2*22);
    MU_CHECK_INT_EQ(double_int(33), 2*33);
}
