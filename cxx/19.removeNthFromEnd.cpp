//
// Created by ALuier Bondar on 2020/2/18.
//

// Getting len first
ListNode* removeNthFromEnd1(ListNode* head, int n) {
    ListNode* cur = head;
    int len = 0;
    while (cur != nullptr) {
        cur = cur->next;
        ++len;
    }

    ListNode dummy = ListNode(0);
    dummy.next = head;

    cur = &dummy;
    int pos = len - n;
    while (pos > 0) {
        cur = cur->next;
        --pos;
    }

    cur->next = cur->next->next;

    return dummy.next;
}

// Double pointers
ListNode* removeNthFromEnd2(ListNode* head, int n) {
    ListNode dummy = ListNode(0);
    dummy.next = head;

    ListNode* fast = &dummy;
    ListNode* slow = &dummy;

    while (n > 0) {
        fast = fast->next;
        --n;
    }

    while (fast->next != nullptr) {
        fast = fast->next;
        slow = slow->next;
    }

    slow->next = slow->next->next;

    return dummy.next;
}