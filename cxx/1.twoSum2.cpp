//
// Created by ALuier Bondar on 2019/12/26.
//

typedef struct {
    int position;
    int occurrence;
} record;

vector<int> twoSum(vector<int>& nums, int target) {
    auto map = unordered_map<int, record>();

    for (int i = 0; i < nums.size(); ++i) {
        map[nums[i]].position = i; // Last pos will overwrite first pos
        ++map[nums[i]].occurrence;
    }

    for (int i = 0; i < nums.size(); ++i) {
        int current = nums[i];
        int difference = target - current;
        bool matched = false;
        if (difference != current) {
            if (map[difference].occurrence > 0) {
                matched = true;
            }
        } else {
            if (map[difference].occurrence > 1) {
                matched = true;
            }
        }
        if (matched) {
            return vector<int>{i, map[difference].position};
        }
    }
    return {0, 0};
}