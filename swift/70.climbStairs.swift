// Binary tree searching
func climbStairs1(_ n: Int) -> Int {
    return climbStairs1Methods(climbed: 0, total: n)
}

func climbStairs1Methods(climbed: Int, total: Int) -> Int {
    switch climbed {
    case let climbed where climbed > total:
        return 0 // Pruning
    case let climbed where climbed == total:
        return 1 // Leaf node
    default:
        return climbStairs1Methods(climbed: climbed + 1, total: total) +
            climbStairs1Methods(climbed: climbed + 2, total: total)
    }
}

// Vanilla Recursive
func climbStairs2(_ n: Int) -> Int {
    switch n {
    case 1:
        return 1
    case 2:
        return 2
    default:
        return climbStairs1(n - 1) + climbStairs1(n - 2)
    }
}

// Recursive with memo
func climbStairs3(_ n: Int) -> Int {
    switch n {
    case 1:
        return 1
    default:
        var memo = [Int](repeating: 0, count: n)
        memo[0] = 1
        memo[1] = 2
        return climbStairs3(count: n, with: &memo)
    }
}

func climbStairs3(count: Int, with memo: inout [Int]) -> Int {
    switch count {
    case let count where memo[count - 1] != 0:
        return memo[count - 1]
    default:
        memo[count - 1] = climbStairs3(count: count - 1, with: &memo) +
            climbStairs3(count: count - 2, with: &memo)
        return memo[count - 1]
    }
}

// Non-recursive
func climbStairs4(_ n: Int) -> Int {
    if n == 1 {
        return 1
    }
    
    var dp = [Int](repeating: 0, count: n)
    dp[0] = 1
    dp[1] = 2
    
    for i in 2..<n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    
    return dp[n - 1]
}