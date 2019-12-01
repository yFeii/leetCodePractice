//
//  ViewController.swift
//  104. Maximum Depth of Binary Tree（最大深度）
//
//  Created by yFeii on 2019/12/1.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let n1 = TreeNode.init(2);
        let n2 = TreeNode.init(1);
        let n3 = TreeNode.init(3);
        n1.left = n2
        n1.right = n3
        let s = Solution()
        s.maxDepth(n1)
        
    }
    
    
}


//Definition for a binary tree node.
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

//二叉树的 前序 后序 中序 都是深度优先
class Solution {
    //前序遍历，记录 每一个节点的当前深度
    func maxDepth_pre(_ root: TreeNode?) -> Int {
        var result = 0
        var stack = Array<[TreeNode:Int]>.init()
        if root != nil {
            stack.append([root!:1])
            while !stack.isEmpty {
                
                //pop 一个节点，每次pop就是当前的最大深度
                let top = stack.popLast()
                let node = top?.keys.first
                let depth = top![node!]!
                result = max(result, depth)
                if let right = node?.right {
                    //如果有下一个节点节点，则深度加1
                    stack.append([right:depth+1])
                }
                
                if let left = node?.left {
                    stack.append([left:depth+1])
                }
                
            }
        }
        return result
    }
    //中序遍历
    
    func maxDepth(_ root: TreeNode?) -> Int {
        var depth = 0
        var result = 0
        var stack = Array<[TreeNode:Int]>.init()
        var cur = root
        while cur != nil || !stack.isEmpty {
            
            while cur != nil{
                //说明存在左节点，则深度+1
                stack.append([cur!:depth+1])
                cur = cur?.left
                //深度+1
                depth+=1
            }
            //左节点获取完毕，开始尝试右节点，要把深度重置为当前(右节点的上一个)节点深度
            let pair = stack.popLast()
            let node = pair?.keys.first
            //重置当前深度
            depth = pair![node!]!
            result = max(result, depth)
            cur = node?.right
        }
        return result
    }
    
    //递归
    func maxDepth1(_ root: TreeNode?) -> Int {
        
        if root == nil {
            return 0;
        }
        let left = maxDepth1(root?.left)
        let right = maxDepth1(root?.right)
        let depth = max(left, right) + 1
        return depth
    }
    
}
