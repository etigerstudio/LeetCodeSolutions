// Inorder traversing with faux queue
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else {
        return [[Int]]()
    }
    
    struct NodePair {
        let node: TreeNode
        let level: Int
    }
    
    var queue = [NodePair]()
    queue.append(NodePair(node: root, level: 0))
    var currentLevel = 0
    var currentValues = [Int]()
    var allValues = [[Int]]()
    while queue.count > 0 {
        let pair = queue.removeFirst()
        if currentLevel == pair.level {
            currentValues.append(pair.node.val)
        } else {
            allValues.append(currentValues)
            currentValues = [pair.node.val]
            currentLevel = pair.level
        }
        
        if let left = pair.node.left {
            queue.append(NodePair(node: left, level: currentLevel + 1))
        }
        if let right = pair.node.right {
            queue.append(NodePair(node: right, level: currentLevel + 1))
        }
    }
    if currentValues.count > 0 {
        allValues.append(currentValues)
    }
    
    return allValues
}