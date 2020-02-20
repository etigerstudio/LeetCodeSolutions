// Recursion
func maxDepth1(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    
    return max(maxDepth1(root.left), maxDepth1(root.right)) + 1
}

// Non-recursive (faux queue)
func maxDepth2(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    
    struct TreePair {
        var depth: Int
        var node: TreeNode
    }
    
    var maxDepth = 0
    var queue = [TreePair]()
    queue.append(TreePair(depth: 1, node: root))
    while queue.count > 0 {
        let pair = queue.removeFirst()
        maxDepth = pair.depth
        
        if let left = pair.node.left {
            queue.append(TreePair(depth: pair.depth + 1, node: left))
        }
        
        if let right = pair.node.right {
            queue.append(TreePair(depth: pair.depth + 1, node: right))
        }
    }
    
    return maxDepth
}