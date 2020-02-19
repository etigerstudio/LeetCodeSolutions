// Brute iterating
func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    for (i, n) in nums.enumerated() {
        for (j, m) in nums.enumerated() {
            if i != j && n + m == target {
                return[i, j]
            }
        }
    }
    return []
}

// Using dictionary
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var pos = [Int: Int]()
    
    for (i, n) in nums.enumerated() {
        if let j = pos[target - n] {
            return [j, i]
        }
        
        pos[n] = i
    }
    
    return []
}