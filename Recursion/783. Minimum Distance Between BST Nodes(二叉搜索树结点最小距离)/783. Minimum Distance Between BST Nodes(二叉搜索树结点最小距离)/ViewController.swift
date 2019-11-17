//
//  ViewController.swift
//  783. Minimum Distance Between BST Nodes(二叉搜索树结点最小距离)
//
//  Created by yFeii on 2019/9/16.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit


/*
 给定一个二叉搜索树的根结点 root, 返回树中任意两节点的差的最小值。
 Given a Binary Search Tree (BST) with the root node root, return the minimum difference between the values of any two different nodes in the tree.
 
 
 1. 为什么叫前序、后序、中序
 一棵二叉树由根结点、左子树和右子树三部分组成，若规定 D、L、R 分别代表遍历根结点、
 遍历左子树、遍历右子树，则二叉树的遍历方式有 6 种：DLR、DRL、LDR、LRD、RDL、RLD。
 由于先遍历左子树和先遍历右子树在算法设计上没有本质区别，所以，只讨论三种方式：
 
 DLR–前序遍历（根在前，从左往右，一棵树的根永远在左子树前面，左子树又永远在右子树前面 ）
 
 LDR–中序遍历（根在中，从左往右，一棵树的左子树永远在根前面，根永远在右子树前面）
 
 LRD–后序遍历（根在后，从左往右，一棵树的左子树永远在右子树前面，右子树永远在根前面）
 
 2. 需要注意几点
 根是相对的，对于整棵树而言只有一个根，但对于每棵子树而言，又有自己的根。

 
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let t1 = TreeNode.init(4)
        
        let t2 = TreeNode.init(2)

        t1.left = t2
        
        let s = Solution()
        s.minDiffInBST(t1);
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
    var sortArray:Array<Int>!
    func minDiffInBST(_ root: TreeNode?) -> Int {
     
        sortArray = Array.init()
        midSort(root)
        var res = NSIntegerMax
        for i in 0...sortArray.count-1{
            if i < sortArray.count-1 {
                res = min(res, sortArray[i+1]-sortArray[i])
            }
        }
        return res
    }
    //中序遍历： 利用二叉树 中序遍历结果为递增升序的特性
    // LDR–中序遍历（根在中，从左往右，一棵树的左子树永远在根前面，根永远在右子树前面）
    func midSort(_ root: TreeNode?) {
        
        if root == nil {
            
            return
        }
        //先取左边
        if root?.left != nil {
            
            midSort(root?.left)
        }
        //加入左节点 和 根节点
        sortArray?.append(root!.val)
        //加入右节点
        if root?.right != nil {
            midSort(root!.right)
        }
        
    }
}
