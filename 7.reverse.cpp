//
// Created by ALuier Bondar on 2020/1/27.
//

class Solution {
public:
    int reverse(int x) {
        int num = 0;

        while (x != 0) {
            long tmp = (long) num * 10 + x % 10;
            if (tmp > INT32_MAX || tmp < INT32_MIN)
                num = 0;
            else
                num = tmp;
            x /= 10;
        }

        return num;
    }
};
