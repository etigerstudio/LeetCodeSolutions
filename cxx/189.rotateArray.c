
void rotate(int* nums, int numsSize, int k){
    int copy[numsSize];
    for (int i = 0; i < numsSize; i++) {
        copy[(i + k) % numsSize] = nums[i];
    }
    memcpy(nums, copy, sizeof(copy));
}
