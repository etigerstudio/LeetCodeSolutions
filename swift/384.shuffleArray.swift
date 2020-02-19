class Solution {
    private let nums: [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return nums
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var shuffled = nums
        
        for i in 0..<nums.count {
            let r = Int.random(in: i..<nums.count)
            shuffled.swapAt(r, i)
        }
        
        return shuffled
    }
}