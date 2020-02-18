//
// Created by ALuier Bondar on 2019/12/26.
//
class Solution {
public:
    vector<int> intersect(vector<int>& nums1, vector<int>& nums2) {
        auto map = unordered_map<int, int>();
        auto nums = vector<int>();

        for (auto &n: nums1) {
            ++map[n];
        }

        for (auto &n: nums2) {
            if (map[n] > 0) {
                --map[n];
                nums.push_back(n);
            }
        }

        return nums;
    }
};
