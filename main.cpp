#include <iostream>
#include "vector_add.h"

int main(){
    int n = 1<<20; // 1M elements

    float *a, *b, *out;

    // Run kernel
    vector_add(&out, &a, &b, n);

    // Fill host arrays
    for(int i = 0; i < n; i++){
        a[i] = i;
        b[i] = i;
    }

    for(int i = 0; i < 10; i++){
        std::cout << out[i] << std::endl;
    }

    // Free device memory
    deallocate(a, b, out);

    return 0;
}
