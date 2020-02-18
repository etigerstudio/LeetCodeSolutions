// Rotating k times
func rotate1(_ nums: inout [Int], _ k: Int) {
    let n = nums.count
    let k = k % n
    
    for _ in 0..<k {
        let tmp = nums[n - 1]
        for i in (1..<n).reversed() {
            nums[i] = nums[i - 1]
        }
        nums[0] = tmp
    }
}

// Extra array
func rotate2(_ nums: inout [Int], _ k: Int) {
    let n = nums.count
    let k = k % n
    var nums2 = [Int](repeating: 0, count: n)
    
    for i in 0..<n {
        nums2[(i + k) % n] = nums[i]
    }
    for i in 0..<n {
        nums[i] = nums2[i]
    }
}

// Swapping k times
func rotate3(_ nums: inout [Int], _ k: Int) {
    var swap = nums.count
    let k = k % nums.count
    var pos = 0, orphan: Int
    while swap > 0 {
        var cur = pos
        orphan = nums[cur]
        
        repeat {
            cur = (cur + k) % nums.count
            let tmp = orphan
            orphan = nums[cur]
            nums[cur] = tmp
            
            swap -= 1
        } while cur != pos
        
        pos += 1
    }
}

// Flipping 3 times
func rotate4(_ nums: inout [Int], _ k: Int) {
    func reverse(_ nums: inout [Int], from: Int, to: Int) {
        var from = from
        var to = to
        while from < to {
            let tmp = nums[from]
            nums[from] = nums[to]
            nums[to] = tmp
            from += 1
            to -= 1
        }
    }
    
    let k = k % nums.count
    reverse(&nums, from: 0, to: nums.count - 1)
    reverse(&nums, from: 0, to: k - 1)
    reverse(&nums, from: k, to: nums.count - 1)
}