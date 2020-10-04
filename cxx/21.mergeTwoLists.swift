// Using dummy header
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1
    var l2 = l2
    let list = ListNode(0)
    var cur = list
    
    while let n1 = l1, let n2 = l2 {
        if n1.val < n2.val {
            cur.next = l1
            cur = n1
            l1 = n1.next
        } else {
            cur.next = l2
            cur = n2
            l2 = n2.next
        }
    }
    while let n = l1 {
        cur.next = n
        cur = n
        l1 = n.next
    }
    while let n = l2 {
        cur.next = n
        cur = n
        l2 = n.next
    }
    
    return list.next
}
