//
// Created by ALuier Bondar on 2020/1/9.
//

class Solution {
public:
    void rotate(vector<vector<int>>& matrix) {
        int n = matrix.size();
        auto result = vector<vector<int>>(n, vector<int>(n));

        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < n; ++j) {
                result[j][n - i - 1] = matrix[i][j];
            }
        }

        matrix = result;
    }
};
