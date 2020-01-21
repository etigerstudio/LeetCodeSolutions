//
// Created by ALuier Bondar on 2020/1/21.
//

class Solution {
public:
    int firstUniqChar(string s) {
        auto map = unordered_map<char, int>();
        for (char c: s) {
            ++map[c];
        }
        for (int i = 0; i < s.size(); ++i) {
            if (map[s[i]] == 1) {
                return i;
            }
        }

        return -1;
    }
};