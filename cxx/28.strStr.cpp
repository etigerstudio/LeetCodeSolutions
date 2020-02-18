//
// Created by ALuier Bondar on 2020/1/25.
//

int strStr(string haystack, string needle) {
    if (needle.empty())
        return 0;

    for (int i = 0; i < haystack.size(); ++i) {
        for (int j = 0; j < needle.size(); ++j) {
            if (haystack[i + j] != needle[j])
                break;
            else if (j == needle.size() - 1)
                return i;
        }
    }
    return -1;
}