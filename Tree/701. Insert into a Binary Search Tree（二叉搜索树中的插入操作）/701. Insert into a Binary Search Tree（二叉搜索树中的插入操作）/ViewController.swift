//
//  ViewController.swift
//  701. Insert into a Binary Search Tree（二叉搜索树中的插入操作）
//
//  Created by yFeii on 2019/10/18.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

/*
 Given the root node of a binary search tree (BST) and a value to be inserted into the tree,
 insert the value into the BST. Return the root node of the BST after the insertion.
 It is guaranteed that the new value does not exist in the original BST.

 Note that there may exist multiple valid ways for the insertion,
 as long as the tree remains a BST after insertion. You can return any of them.
 
 
 给定二叉搜索树（BST）的根节点和要插入树中的值，将值插入二叉搜索树。
 返回插入后二叉搜索树的根节点。 保证原始二叉搜索树中不存在新值。

 注意，可能存在多种有效的插入方式，只要树在插入后仍保持为二叉搜索树即可。
 你可以返回任意有效的结果。

 利用二叉搜索数的特性   a<root.val<b
 此题有多种解法：
 1.按特性一直查找，知道找到为空的节点，然后把目标值生成节点，根据目标值的大小关系 插入last 的左或右
 
 
 */

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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
     
        var target = root
        var last = root
        //根据特性 直到找到一个为空的位置，并记录上一个几点（以为val 节点需要根据上一个节点的大小关系来判断该插入左边还是右边）
        while target != nil {
            last = target
            if target!.val > val {
                target = target?.left
            }else {
                target = target?.right
            }
        }
        //生成val 节点
        target = TreeNode.init(val)
        //判断该在目标节点的左边还是右边
        if last!.val > val {
            last?.left = target;
        }else{
            last?.right = target;
        }
        return root
    }
}
