// Recursion
func rob1(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    
    return rob1(currentMoney: 0, prevRob: nil, currentPostion: 0, nums: nums)
}

func rob1(currentMoney: Int, prevRob: Int?, currentPostion: Int, nums: [Int]) -> Int {
    guard currentPostion < nums.count else {
        // No more houses
        return currentMoney
    }
    
    let moneyWhenNoAction = rob1(currentMoney: currentMoney, prevRob: prevRob, currentPostion: currentPostion + 1, nums: nums)
    if let prevRob = prevRob, currentPostion == prevRob + 1 {
        // Cannot rob in current position
        return moneyWhenNoAction
    } else {
        // Can rob or not
        let moneyWhenRob = rob1(currentMoney: currentMoney + nums[currentPostion], prevRob: currentPostion, currentPostion: currentPostion + 1, nums: nums)
        return max(moneyWhenNoAction, moneyWhenRob)
    }
}

// DP
func rob2(_ nums: [Int]) -> Int {
    var prevMoney = 0
    var curMoney = 0
    
    for i in 0..<nums.count {
        let tmp = prevMoney
        prevMoney = curMoney
        curMoney = max(tmp + nums[i], curMoney)
    }
    
    return curMoney
}