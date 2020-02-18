//
// Created by ALuier Bondar on 2020/1/22.
//

class Solution {
public:
    int myAtoi(string str) {
        int i = 0, n = 0;
        bool negative = false;

        // Trim whitespaces
        for (; i < str.size(); ++i) {
            if (str[i] != ' ') break;
        }

        // Detect symbol
        if (str[i] == '-') {
            negative = true;
            ++i;
        }
        else if (str[i] == '+')
            ++i;
        else if (!(str[i] >= '0' && str[i] <= '9'))
            return 0;

        // Concatenate numbers
        for (; i < str.size(); ++i) {
            if (str[i] >= '0' && str[i] <= '9') {
                long tmp = (long) n * 10 +
                           (negative ? - (str[i] - '0') : str[i] - '0');
                if (tmp > INT32_MAX)
                    return INT32_MAX;
                else if (tmp < INT32_MIN)
                    return INT32_MIN;
                else
                    n = tmp;
            }
            else
                break;
        }

        return n;
    }
};