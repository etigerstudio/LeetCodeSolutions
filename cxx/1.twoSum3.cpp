//
// Created by ALuier Bondar on 2020/1/9.
//

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        auto m = unordered_map<int, int>();

        for (int i = 0; i < nums.size(); ++i)
        {
            int pos = m[target - nums[i]];
            if (pos) {
                return {pos - 1, i};
            } else {
                m[nums[i]] = i + 1;
            }
        }
        return {0, 0};
    }
};
