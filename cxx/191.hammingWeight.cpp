// AND with 1
int hammingWeight(uint32_t n) {
    int w = 0;
    for (int i = 0; i < 32; i++) {
        w += n & 1;
        n = n >> 1;
    }
    
    return w;
}