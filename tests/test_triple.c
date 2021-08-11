#include "tests.h"

#include <stdint.h>


extern int64_t triple_int(int64_t);


MU_TEST(test_triple)
{
    MU_CHECK_INT_EQ(triple_int(10), 3*10);
    MU_CHECK_INT_EQ(triple_int(22), 3*22);
    MU_CHECK_INT_EQ(triple_int(33), 3*33);
}
