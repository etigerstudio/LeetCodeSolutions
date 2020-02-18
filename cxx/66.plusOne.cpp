//
// Created by ALuier Bondar on 2019/12/29.
//

class Solution {
public:
    vector<int> plusOne(vector<int>& digits) {
        long n = 0;
        int s = digits.size();
        bool carry = true;
        for (int i = s - 1; i >= 0; --i) {
            if (carry) {
                if (digits[i] == 9) {
                    carry = true;
                    digits[i] = 0;
                } else {
                    carry = false;
                    ++digits[i];
                }
            } else {
                break;
            }
        }
        if (carry) {
            vector<int> v(s + 1, 0);
            v[0] = 1;
            return v;
        } else {
            return digits;
        }
    }
};