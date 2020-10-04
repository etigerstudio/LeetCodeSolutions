//
// Created by ALuier Bondar on 2020/9/11.
//

vector<vector<int>> results;

// 1. W/ pruning
void traverse1(vector<int> candidates, int remaining, vector<int> current) {
    for (int i = 0; i < candidates.size(); i++) {
        // De-duplicating
        if (!current.empty() && candidates[i] < current.back()) continue;
        if (remaining < candidates[i]) {
            // Pruning
            return;
        } else if (remaining == candidates[i]) {
            // Reaching an end
            current.emplace_back(candidates[i]);
            results.emplace_back(current);
            return;
        } else {
            // Continue traversing
            auto newNums = current;
            newNums.emplace_back(candidates[i]);
            traverse1(candidates, remaining - candidates[i], newNums);
        }
    }
}

vector<vector<int>> combinationSum1(vector<int>& candidates, int target) {
    // Corner case handling
    if (candidates.size() == 0) return {};
    sort(candidates.begin(), candidates.end());
    traverse1(candidates, target, {});
    return results;
}

// 2. W/O pruning
// Pending