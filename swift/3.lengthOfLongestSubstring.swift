// Iterating with set
func lengthOfLongestSubstring1(_ s: String) -> Int {
    var chars = Set<Character>()
    
    var maxLength = 0
    for index in s.indices {
        chars = []
        var i = index
        while i != s.endIndex {
            if chars.contains(s[i]) {
                break
            } else {
                chars.insert(s[i])
            }
            i = s.index(after: i)
        }
        
        maxLength = max(chars.count, maxLength)
    }
    
    return maxLength
}

// Skipping with dict
func lengthOfLongestSubstring2(_ s: String) -> Int {
    var prevPositions = [Character: String.Index]()
    var maxLength = 0
    var prevIndex = s.startIndex
    
    for i in s.indices {
        let char = s[i]
        if let pos = prevPositions[char], pos >= prevIndex {
            let length = s.distance(from: prevIndex, to: i)
            maxLength = max(maxLength, length)
            prevIndex = s.index(after: pos)
        }
        
        prevPositions[char] = i
    }
    maxLength = max(maxLength, s.distance(from: prevIndex, to: s.endIndex))
    
    return maxLength
}