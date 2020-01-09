//
// Created by ALuier Bondar on 2019/12/29.
//

class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        bool stable = false;
        for (int i = 0; i < nums.size() - 1; ++i) {
            if (stable) break;
            stable = true;
            for (int j = 0; j < nums.size() - i - 1; ++j) {
                if (nums[j] == 0 && nums[j + 1] != 0) {
                    swap(nums[j], nums[j + 1]);
                    stable = false;
                }
            }
        }
    }
};