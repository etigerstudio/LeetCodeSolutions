//
// Created by ALuier Bondar on 2020/1/21.
//

int firstUniqChar(string s) {
    int map[256] = {};
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
