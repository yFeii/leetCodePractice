//
//  ViewController.swift
//  98. Validate Binary Search Tree
//
//  Created by yFeii on 2019/11/17.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let n1 = TreeNode.init(5);
        let n2 = TreeNode.init(1);
        let n3 = TreeNode.init(4);
        let n4 = TreeNode.init(3);
        let n5 = TreeNode.init(6);

        n1.left = n2
        n1.right = n3
        n3.left = n4
        n3.right =  n5
        let s  = Solution()
        s.isValidBST(n1)
        
    }
    
    
}

//   Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
     
        var stack = Array<TreeNode>.init()
        var cur = root
        var lastValue:TreeNode? = nil
        while cur != nil || !stack.isEmpty {
            
            while cur != nil {
                
                stack.append(cur!)
                cur = cur?.left
            }
            let top = stack.popLast()
            if lastValue != nil && lastValue!.val >= top!.val {
                return false
            }
            lastValue = top!
            cur = top?.right
        }
        return true
    }
}
