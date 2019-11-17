//
//  ViewController.swift
//  938. Range Sum of BST（二叉搜索树的范围和）
//
//  Created by yFeii on 2019/9/12.
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

/*
 
 我们对树进行深度优先搜索，对于当前节点 node，
 如果 node.val 小于等于 L，那么只需要继续搜索它的右子树；
 如果 node.val 大于等于 R，那么只需要继续搜索它的左子树；如果 node.val 在区间 (L, R) 中，则需要搜索它的所有子树。
  */

class Solution {
    var ans = 0;
    
    func rangeSumBST1(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
    
        if root == nil {
            return 0
        }
        // 如果 node.val 小于等于 L，那么只需要继续搜索它的右子树；
        if root!.val < L {
            return rangeSumBST1(root?.right,L,R)
        }else if root!.val > R {
            // 如果 node.val 大于等于 R，那么只需要继续搜索它的左子树；

            return rangeSumBST1(root?.left,L,R)
        }else{
            // 如果 node.val 在区间 (L, R) 中，则需要搜索它的所有子树。

            return root!.val + rangeSumBST1(root?.right,L,R)+rangeSumBST1(root?.left,L,R)
        }
    }

    
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        
        dfs(root, L, R)
        return ans;
    }
    
    func dfs(_ root: TreeNode?, _ L: Int, _ R: Int) {
        
        if root == nil {
            return
        }
        
        if root!.val >= L && root!.val <= R{
            //如果 node.val 在区间 (L, R) 中，先加入当前的值，
            //则需要搜索它的所有子树。
            //如果满足当前条件，则下面的条件一定也满足：达到遍历所以左右子树的目的
            ans += root!.val
        }
        if root!.val < R {
            
            dfs(root?.right, L, R)
        }
        if root!.val > L {
            
            dfs(root?.left, L, R)
        }
    }
        
//        if root!.val >= L && root!.val <= R{
//            ans += root!.val
//            return;
//        }
//        if root!.val < L {
//
//            dfs(root?.right, L, R)
//            return;
//        }
//        if root!.val > R {
//
//            dfs(root?.left, L, R)
//            return;
//        }
    }
}
