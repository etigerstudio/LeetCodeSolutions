//
// Created by ALuier Bondar on 2020/1/9.
//

class Solution {
public:
    void rotate(vector<vector<int>>& matrix) {
        int n = matrix.size();
        auto m = vector<bool>(n * n, false);

        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < n; ++j) {
                if (!m[i * n + j]) {
                    int row = i, col = j;
                    int orphan = matrix[row][col];
                    do {
                        int new_row = col, new_col = n - row - 1;
                        int tmp = matrix[new_row][new_col];
                        matrix[new_row][new_col] = orphan;
                        orphan = tmp;
                        m[row * n + col] = true;
                        row = new_row; col = new_col;
                    } while (row != i || col != j);
                }
            }
        }
    }
};