//
//  ViewController.swift
//  145. Binary Tree Postorder Traversal
//
//  Created by y on 2019/11/7.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let n1 = TreeNode.init(3)
        let n2 = TreeNode.init(2)
        let n3 = TreeNode.init(4)
        let n4 = TreeNode.init(1)
        let n5 = TreeNode.init(1)

        n1.right = n3
        n1.left = n2
        n3.left = n4

        let s = Solution.init()
        s.postorderTraversal(n1)
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

extension TreeNode:Hashable,Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        let l = Unmanaged<AnyObject>.passUnretained(lhs as AnyObject).toOpaque()
        let r = Unmanaged<AnyObject>.passUnretained(rhs as AnyObject).toOpaque()
        if l == r {
            return (lhs.hashValue == rhs.hashValue)
        }
        return false
       }

    public func hash(into hasher: inout Hasher) {

        hasher.combine(self.val)
    }
}

//我现在有个 类，这个类不继承NSObject的，我把这个类对象存在了 一个Set里，set 要求实现Hashable，
class Solution {
    
    //递归
    func postorderTraversal1(_ root: TreeNode?) -> [Int] {
        
        var res = Array<Int>.init()
        if let left = root?.left {
            
            let leftRes = postorderTraversal1(left)
            res.append(contentsOf: leftRes)
        }
        if let right = root?.right {
            
            let rightRes = postorderTraversal1(right)
            res.append(contentsOf: rightRes)
        }
        if let root = root {
            res.append(root.val)
        }
        return res
    }
    
    //栈
    func postorderTraversal(_ root: TreeNode?) -> [Int] {

        var stack = Array<TreeNode>.init()
        var res = Array<Int>.init()
        var cache = Set<TreeNode>.init()
        if let root = root {

            stack.append(root)
        }
        while !stack.isEmpty {
            let top = stack.last
            var rightHasVisit = true
            var leftHasVisit = true
            if let right = top?.right{
                if !cache.contains(right){
                    rightHasVisit = false
                    stack.append(right)
                }
            }

            if let left = top?.left{
                if !cache.contains(left){
                    leftHasVisit = false
                    stack.append(left)
                }
            }
            if rightHasVisit && leftHasVisit {

                let t = stack.popLast()
                res.append(t!.val)
                cache.insert(t!)
            }
        }
      return res
    }
}
