//
// Created by ALuier Bondar on 2020/1/10.
//

void reverseString(vector<char>& s) {
    int n = s.size();
    for (int i = 0; i < n / 2; ++i) {
        swap(s[i], s[n - i - 1]);
    }
}