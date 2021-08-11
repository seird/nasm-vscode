#include "main.h"

#if (!defined(TEST) && !defined(BENCHMARK))

extern int64_t double_int(int64_t a);
extern int64_t triple_int(int64_t a);

int
main()
{
    int64_t a = 12;

    printf("%ld * 3 = %ld\n", a, triple_int(a));
    printf("%ld * 2 = %ld\n", a, double_int(a));

    return 0;
}

#endif
