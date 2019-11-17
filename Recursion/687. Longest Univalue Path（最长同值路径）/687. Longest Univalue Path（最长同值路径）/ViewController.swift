//
//  ViewController.swift
//  687. Longest Univalue Path（最长同值路径）
//
//  Created by yFeii on 2019/9/11.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit


/*
 
 Given a binary tree, find the length of the longest path where each node in the path has the same value. This path may or may not pass through the root.
 
 The length of path between two nodes is represented by the number of edges between them.
 
 
 给定一个二叉树，找到最长的路径，这个路径中的每个节点具有相同值。 这条路径可以经过也可以不经过根节点。
 
 注意：两个节点之间的路径长度由它们之间的边数表示。
 */

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

/*
 设计一个递归函数，返回以该节点为根节点，向下走的最长同值路径
 知道这个值以后
 以某个节点为根节点的最长同值路径就是，
 如果该节点的值等于其左子树的值，则最长同值路径要加上左子树的最长同值路径，如果不等，左子树的路径为0
 如果该节点的值等于其右子树的值，则最长同值路径要加上右子树的最长同值路径，如果不等，右子树的路径为0
 */
class Solution {
    
    var res = 0
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        
        currentNodeLength(root)
        return res
    }
    
    func currentNodeLength(_ root: TreeNode?) -> Int {
        
        if root == nil {return 0}
        
        var left = currentNodeLength(root?.left)
        var right = currentNodeLength(root?.right)
        // 如果该节点的值等于其左子树的值，则最长同值路径要加上左子树的最长同值路径，如果不等，左子树的路径为0
        left = root?.val == root?.left?.val ? left + 1 : 0
        // 如果该节点的值等于其右子树的值，则最长同值路径要加上右子树的最长同值路径，如果不等，右子树的路径为0
        right = root?.val == root?.right?.val ? right + 1 : 0
        //如果左边等于右边，最大路径为和
        res = max(res, left+right)
        return max(left, right)
    }
}
