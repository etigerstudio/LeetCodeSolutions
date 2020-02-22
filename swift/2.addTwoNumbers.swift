// Using carry flag
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let head = ListNode(0)
    var current = head
    var carry = false
    var l1 = l1
    var l2 = l2
    
    while let v1 = l1?.val, let v2 = l2?.val {
        let sum = v1 + v2 + (carry ? 1 : 0)
        carry = sum >= 10
        let new = ListNode(sum % 10)
        current.next = new
        current = new
        
        l1 = l1?.next
        l2 = l2?.next
    }
    while let v1 = l1?.val {
        let sum = v1 + (carry ? 1 : 0)
        carry = sum >= 10
        let new = ListNode(sum % 10)
        current.next = new
        current = new
        
        l1 = l1?.next
    }
    while let v2 = l2?.val {
        let sum = v2 + (carry ? 1 : 0)
        carry = sum >= 10
        let new = ListNode(sum % 10)
        current.next = new
        current = new
        
        l2 = l2?.next
    }
    if carry {
        let new = ListNode(1)
        current.next = new
    }
    
    
    return head.next
}
