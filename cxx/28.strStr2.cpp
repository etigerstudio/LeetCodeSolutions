//
// Created by ALuier Bondar on 2020/1/25.
//

class Solution {
public:
    vector<int> getNext(string s){
        int n = s.size();
        vector<int> next(n);
        next[0] = 0;
        if (n == 1)
            return next;
        next[1] = 0;
        int k = 0;
        for (int i = 2; i < n; i++){
            while (k > 0 && s[i-1] != s[k])
                k = next[k];
            if (s[i-1] == s[k])
                k += 1;
            next[i] = k;
        }
        return next;
    }

    int strStr(string s1, string s2){
        int i = 0;
        int j = 0;
        int len1 = s1.size();
        int len2 = s2.size();
        if (len2 == 0)
            return 0;
        vector<int> next = getNext(s2);
        while (i < len1 && j < len2){
            if (len1 - i < len2 - j)
                break;
            if (s1[i] == s2[j]){
                ++i;
                ++j;
            }
            else{
                if (j == 0)
                    ++i;
                else
                    j = next[j];
            }
        }
        if (j == len2)
            return i - len2;
        else
            return -1;
    }
};