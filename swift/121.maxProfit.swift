// Brute iterating
func maxProfit1(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else {
        return 0
    }
    
    var maxProfit = 0
    
    for i in 0..<prices.count - 1 {
        for j in i + 1..<prices.count {
            if prices[j] > prices[i] {
                let profit = prices[j] - prices[i]
                maxProfit = profit > maxProfit ? profit : maxProfit
            }
        }
    }
    
    return maxProfit
}

// DP
func maxProfit2(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else {
        return 0
    }
    
    var minPrice = prices[0]
    var maxProfit = 0
    for p in prices {
        if p < minPrice {
            minPrice = p
        } else if p - minPrice > maxProfit {
            maxProfit = p - minPrice
        }
    }
    
    return maxProfit
}