//
// Created by ALuier Bondar on 2019/12/26.
//

class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int n = 0;
        for (auto &i: nums) {
            n ^= i;
        }
        return n;
    }
};