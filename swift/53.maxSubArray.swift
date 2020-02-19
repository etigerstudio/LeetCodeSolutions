// Brute iterating
func maxSubArray1(_ nums: [Int]) -> Int {
    var max = nums[0]
    for i in 0..<nums.count {
        var sum = 0
        for j in i..<nums.count {
            sum += nums[j]
            if sum > max {
                max = sum
            }
        }
    }
    
    return max
}

// DP
func maxSubArray2(_ nums: [Int]) -> Int {
    var max = Int.min, sum = 0
    for n in nums {
        sum = sum > 0 ? sum + n : n
        max = sum > max ? sum : max
    }
    
    return max
}
