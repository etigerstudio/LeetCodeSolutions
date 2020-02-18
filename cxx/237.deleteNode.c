//
// Created by ALuier Bondar on 2020/1/28.
//

void deleteNode(struct ListNode* node) {
    node->val = node->next->val;
    node->next = node->next->next;
}