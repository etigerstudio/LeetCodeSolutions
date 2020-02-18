//
// Created by ALuier Bondar on 2020/1/9.
//
class Solution {
public:
    bool isValidSudoku(vector<vector<char>>& board) {
        auto rows = vector<unordered_map<char, bool>>(9, unordered_map<char, bool>());
        auto cols = vector<unordered_map<char, bool>>(9, unordered_map<char, bool>());
        auto boxes = vector<unordered_map<char, bool>>(9, unordered_map<char, bool>());

        for (int row = 0; row < 9; ++row) {
            for (int col = 0; col < 9; ++col) {
                char num = board[row][col];
                if (num != '.') {
                    int box = row / 3 + col / 3 * 3;

                    if (rows[row][num] || cols[col][num] || boxes[box][num])
                        return false;

                    rows[row][num] = true;
                    cols[col][num] = true;
                    boxes[box][num] = true;
                }
            }
        }

        return true;
    }
};
