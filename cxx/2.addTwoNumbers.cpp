//
// Created by ALuier Bondar on 2020/10/5.
//

class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode* head = new ListNode(0);
        ListNode* cur = head;
        bool carry = false;
        while (l1 != nullptr && l2 != nullptr) {
            char sum = l1->val + l2->val + (carry ? 1 : 0);
            carry = sum >= 10;
            cur->next = new ListNode(sum % 10);
            cur = cur->next;
            l1 = l1->next;
            l2 = l2->next;
        }
        while (l1 != nullptr) {
            char sum = l1->val + (carry ? 1 : 0);
            carry = sum >= 10;
            cur->next = new ListNode(sum % 10);
            cur = cur->next;
            l1 = l1->next;
        }
        while (l2 != nullptr) {
            char sum = l2->val + (carry ? 1 : 0);
            carry = sum >= 10;
            cur->next = new ListNode(sum % 10);
            cur = cur->next;
            l2 = l2->next;
        }
        if (carry) {
            cur->next = new ListNode(1);
        }
        return head->next;
    }
};