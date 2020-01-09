//
// Created by ALuier Bondar on 2019/12/26.
//

int* twoSum(int* nums, int numsSize, int target, int* returnSize){
    for (int i = 0; i < numsSize; ++i) {
        int difference = target - nums[i];
        for (int j = 0; j < numsSize; ++j) {
            if (j != i && difference == nums[j]) {
                *returnSize = 2;
                int* result = malloc(2 * sizeof(int));
                result[0] = i;
                result[1] = j;
                return result;
            }
        }
    }
    return 0;
}