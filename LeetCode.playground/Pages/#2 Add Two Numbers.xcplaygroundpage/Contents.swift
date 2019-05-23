/*:
 You are given two **non-empty** linked lists representing two non-negative integers. The digits are stored in **reverse order** and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 ```
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.´
 ```
 */

import Foundation

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    switch (l1, l2) {
    case let (l1?, l2?):
        let sum = l1.val + l2.val
        let node = ListNode(sum % 10)
        if sum >= 10 { node.next = ListNode(1) }
        node.next = addTwoNumbers(node.next, addTwoNumbers(l1.next, l2.next))
        return node
    case let (nil, l2?):
        return l2
    case let (l1?, nil):
        return l1
    default:
        return nil
    }
}

extension ListNode: CustomStringConvertible {
    var description: String {
        var string = "\(val)"
        var nextNode = next
        while nextNode != nil {
            string.append(" -> \(nextNode!.val)")
            nextNode = nextNode?.next
        }
        return string
    }
}

let l1 = ListNode(2, next: ListNode(4, next: ListNode(3)))
let l2 = ListNode(5, next: ListNode(6, next: ListNode(4)))
addTwoNumbers(l1, l2)
