//
//  ViewController.swift
//  94. Binary Tree Inorder Traversal
//
//  Created by yFeii on 2019/11/3.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


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
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        var res = Array<Int>.init()
        if root == nil {
            return res
        }
        if root?.left != nil {
            
            let arr = inorderTraversal(root?.left)
            res.append(contentsOf: arr)
        }
        res.append(root!.val)
        let arr = inorderTraversal(root?.right)
        res.append(contentsOf: arr)
        return res;
    }
    func inorderTraversal3(_ root: TreeNode?) -> [Int] {
        var stack = Array<TreeNode>.init()
        var res = Array<Int>.init()
        var cur = root;
        while cur != nil || !stack.isEmpty {
            
            while cur != nil {
                stack.append(root!)
                cur = cur?.left
            }
            let top = stack.popLast()
            res.append(top!.val)
            cur = cur?.right
        }
        return res;
    }
    //栈
    /*
     *思路，中序遍历的顺序：先左，再中，最后右
     *当获得一个节点(current)，先把当前节点入栈，再查看是否有左子节点，如果有，则一直入栈直到没有左节点
     *出栈第一个左节点，如果这个节点存在右节点(b)，则继续查看b的所有左节点，如果不存在，则获取下一个栈顶元素。
     */
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack = Array<TreeNode>.init()
        var res = Array<Int>.init()
        var cur = root;
        //获取当前结节，如果当前节点存在，或者栈内有元素,则继续查找，
        //如果当前节点不为空，则说明该节点应该可能存在左节点。
        //如果节点为空，但是栈存在值，则说明上一轮的节点不存在右节点，
        while cur != nil || !stack.isEmpty {
            //查看当前节点是否存在
            while cur != nil {
                //如果存在一个节点，则节点先入栈，在查看左节点，
                stack.append(cur!)
                cur = cur?.left
            }
            //获取栈顶元素，
            let top = stack.popLast()
            res.append(top!.val)
            //获取栈顶元素的右元素，因为如果可能节点存在左子节点
            cur = top?.right
        }
        return res;
    }
}
