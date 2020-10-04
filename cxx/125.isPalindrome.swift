// Double pointer from two ends
func isPalindrome(_ s: String) -> Bool {
    let string = [Character](s)
    var low = 0, high = string.count - 1
    
    while low < high {
        while low < high && !(string[low].isNumber || string[low].isLetter) {
            low += 1
        }
        while low < high && !(string[high].isNumber || string[high].isLetter) {
            high -= 1
        }
        if string[low].lowercased() != string[high].lowercased() {
            return false
        }
        low += 1
        high -= 1
    }
    return true
}