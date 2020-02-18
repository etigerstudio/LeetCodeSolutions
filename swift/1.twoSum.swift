func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var pos = [Int: Int]()
    
    for (i, n) in nums.enumerated() {
        if let j = pos[target - n] {
            return [j, i]
        }
        
        pos[n] = i
    }
    
    return [0, 0]
}