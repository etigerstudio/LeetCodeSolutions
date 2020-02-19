// Redudant aux stack
class MinStack1 {
    private var main = [Int](), aux = [Int]()
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        main.append(x)
        if aux.isEmpty || aux[aux.count - 1] > x {
            aux.append(x)
        } else {
            aux.append(aux[aux.count - 1])
        }
    }
    
    func pop() {
        _ = main.popLast()
        _ = aux.popLast()
    }
    
    func top() -> Int {
        return main[main.count - 1]
    }
    
    func getMin() -> Int {
        return aux[aux.count - 1]
    }
}

// Optimized aux stack
class MinStack2 {
    private var main = [Int](), aux = [Int]()
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        main.append(x)
        if aux.isEmpty || aux[aux.count - 1] >= x {
            aux.append(x)
        }
    }
    
    func pop() {
        let n = main.popLast()
        if n == aux[aux.count - 1] {
            _ = aux.popLast()
        }
    }
    
    func top() -> Int {
        return main[main.count - 1]
    }
    
    func getMin() -> Int {
        return aux[aux.count - 1]
    }
}