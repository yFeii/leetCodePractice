//
//  ViewController.swift
//  700. Search in a Binary Search Tree(二叉搜索树中的搜索)
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
 700. Search in a Binary Search Tree
 二叉搜索树的特性：root 左边的值小于 root，右边的值大于root，根据次特性得出：
 当val > root.val时
 //则继续查找右边的下一个节点  searchBST(root.right,val)
 当val < root.val时
 //则继续查找左边的下一个节点  searchBST(root.left,val)
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
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        
        if let target = root {
            //相等返回树
            if target.val == val {
                return target
            }else{
                if target.val > val {
                    //如果当前节点的值大于目标值，则继续查找左边的下一个节点
                    let next = target.left
                    return searchBST(next, val)
                }else{
                    //如果当前节点的值小于目标值，则继续查找右边的下一个节点
                    let next = target.right
                    return searchBST(next, val)
                }
            }
        }else{
            return nil
        }
    }
}
