// Recursion
func maxProfit1(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else {
        return 0
    }
    
    return maxProfit1(currentProfit: 0, currentDay: 0, buyPrice: nil, prices: prices)
}

func maxProfit1(currentProfit: Int, currentDay: Int, buyPrice: Int?, prices: [Int]) -> Int {
    if currentDay == prices.count {
        // Market closed
        return currentProfit
    }
    
    if let buyPrice = buyPrice {
        // Already bought
        let profitWhenNoAction = maxProfit1(currentProfit: currentProfit, currentDay: currentDay + 1, buyPrice: buyPrice, prices: prices)
        if prices[currentDay] > buyPrice {
            let newProfit = currentProfit + prices[currentDay] - buyPrice
            let profitWhenSell = maxProfit1(currentProfit: newProfit, currentDay: currentDay + 1, buyPrice: nil, prices: prices)
            return max(profitWhenSell, profitWhenNoAction)
        } else {
            return profitWhenNoAction
        }
    } else {
        // Not bought yet
        let profitWhenBuy = maxProfit1(currentProfit: currentProfit, currentDay: currentDay + 1, buyPrice: prices[currentDay], prices: prices)
        let profitWhenNoAction = maxProfit1(currentProfit: currentProfit, currentDay: currentDay + 1, buyPrice: nil, prices: prices)
        return max(profitWhenBuy, profitWhenNoAction)
    }
}


// DP
func maxProfit2(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else {
        return 0
    }
    
    var isIncreasing = false
    var prevValley = 0
    var profit = 0
    
    for i in 1..<prices.count {
        if isIncreasing && prices[i] < prices[i - 1] {
            isIncreasing = false
            profit += prices[i - 1] - prevValley
        } else if !isIncreasing && prices[i] > prices[i - 1] {
            isIncreasing = true
            prevValley = prices[i - 1]
        }
    }
    
    if isIncreasing {
        profit += prices[prices.count - 1] - prevValley
    }
    
    return profit
}