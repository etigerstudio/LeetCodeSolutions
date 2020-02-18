//
// Created by ALuier Bondar on 2019/12/26.
//

bool containsDuplicate(vector<int>& nums) {
    auto map = unordered_map<int, bool>();

    for(auto &n: nums) {
        if (map[n]) {
            return true;
        } else {
            map[n] = true;
        }
    }
    return false;
}