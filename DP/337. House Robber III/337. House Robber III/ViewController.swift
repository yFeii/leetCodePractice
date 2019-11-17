//
//  ViewController.swift
//  337. House Robber III
//
//  Created by yFeii on 2019/8/18.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution.init()
        let a = TreeNode.init(3)
        let l = TreeNode.init(2)
        let r = TreeNode.init(1)
        a.left = l
        a.right = r
        let r1 =  s.rob(a)
        print(r1);
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
    //解法1
    //新建缓存（没缓存无法通过leetcode）
    var cache = Dictionary<TreeNode,Int>.init(minimumCapacity: 0)
    func rob1(_ root: TreeNode?) -> Int {
        
        if root == nil {
            
            return 0
        }
        //命中缓存
        if cache[root!] != nil {
            return cache[root!]!;
        }
        //如果包含根节点 则先拿出root
        var include = (root != nil) ? root!.val:0
        
        //如果不包含包含根节点  最大值为 左孩子+右孩子
        let except = rob1(root?.left)+rob1(root?.right)
        
        if root?.left != nil {
            //包含 root + 左孩子的左孩子  +  左孩子的右孩子（抢了 root 要跨越相邻）
           include += rob1(root?.left?.left)+rob1(root?.left?.right)
        }
        if root?.right != nil {
            //包含 root + 右孩子的左孩子  +  右孩子的右孩子（抢了 root 要跨越相邻）
            include += rob1(root?.right?.left)+rob1(root?.right?.right)
        }
//        let p = &root
        cache[root!] = max(except, include);
        return  cache[root!]!
    }
    
    func rob(_ root: TreeNode?) -> Int {
//        return rob1(root)
        let ans = helper(root);
        return max(ans.0,ans.1)
    }
    
    
    //解法二N
    // 对于一个节点的最大值，分为 包含max(包含root，不包含root)
    func helper(_ root: TreeNode?) -> (Int, Int) {

        if root == nil {
            return (0, 0)
        }
        //拿到左孩子，右孩子
        let left = helper(root?.left)
        let right = helper(root?.right)
        //不抢root 的最大值为，左孩子（抢或不抢以左孩子为root的节点）最大值 + 右孩子（抢或不抢以右孩子为root的节点）
        let noCur = max(left.0, left.1) + max(right.0, right.1)
        //抢 root ，root+（N不抢以左孩子为root的节点）+ 不抢以右孩子为root的节点）
        let cur = root!.val + left.0 + right.0
        return (noCur, cur)
    }
}

extension TreeNode:Hashable {
    
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
}
