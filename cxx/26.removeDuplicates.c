
int removeDuplicates(int* nums, int numsSize){
    if(numsSize == 0)
        return 0;

    int n = 1, last = nums[0];
    for(int i = 0; i < numsSize; i++) {
        if(nums[i] != last) {
            last = nums[n] = nums[i];
            n++;
        }
    }
    return n;
}