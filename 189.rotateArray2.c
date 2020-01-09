int gcd(int a, int b) {
    while (b != 0) {
        int tmp = b;
        b = a % b;
        a = tmp;
    }
    return a;
}

void rotate(int* nums, int numsSize, int k) {
    // Preparation
    if (numsSize == 0 || numsSize == 1) {
        return;
    }
    k %= numsSize;

    // Segmentation
    int rounds = gcd(k, numsSize);

    // Substitution
    for (int i = 0; i < rounds; ++i) {
        int overwrites = numsSize / rounds - 1;
        int orphan = nums[(i + overwrites * k) % numsSize];
        for (int j = overwrites; j > 0; --j) {
            nums[(i + j * k) % numsSize] = nums[(i + (j - 1) * k) % numsSize];
        }
        nums[i] = orphan;
    }
}