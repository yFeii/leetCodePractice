//
//  ViewController.swift
//  95. Unique Binary Search Trees II
//
//  Created by yFeii on 2019/8/15.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        s.generateTrees1(3);
    }


}

/**
 * Definition for a binary tree node.
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
    
    //动态规划
    func generateTrees1(_ n: Int) -> [TreeNode?] {
        var pre = Array<TreeNode?>()
        //添加为0的第一个根节点
        pre.append(nil)
        if (n == 0) {
            return pre as! [TreeNode?]
        }

        //因为N个数，所以遍历n次
        for i in 1...n {
            
            //新建第i个数组
            var current = Array<TreeNode?>()
            
            //遍历前一轮所有结果
            for root in pre {
                //因为遍历是从0开始（即根节点开始），所以会漏掉直接把当前数作为根节点的情况
                var insert = TreeNode.init(i)
                insert.left = root
                current.append(insert);
                //找出插入的位置,最多的情况是找N次，一趟线，每次循环都是以 root 为基本情况，继续向下一个节点找
                for j in 0...n {
                    
                    let root_copy = copyTree(tree: root); //复制当前的树
                    var right = root_copy; //找到要插入右孩子的位置
                    if j > 0 {
                        //每次循环都是以 root 为基本情况，继续向下一个节点找，最多是 J种情况
                        for k in 0...j-1 {
                            
                            if right == nil {
                                break
                            }
                            right = right?.right
                        }
                    }
                    if right == nil {
                        break
                    }
                    //交换节点
                    let rightTree = right?.right
                    let insertT = TreeNode.init(i)
                    right?.right = insertT
                    insertT.left = rightTree
                   current.append(root_copy)
                }
            }
         pre = current
        }
    
        return pre as! [TreeNode?]
    }
    
    func copyTree(tree:TreeNode?)->TreeNode?{
    
        if tree == nil {
            return nil
        }
        let new = TreeNode.init(tree!.val)
        //这里要递归复制左右的子树，不然可能出现 子树的内存重用的情况
        new.left = copyTree(tree: tree!.left)
        new.right = copyTree(tree: tree!.right)
        return new
    }
    
    //递归
    func generateTrees(_ n: Int) -> [TreeNode?] {
        let ans = Array<TreeNode>()
        if (n == 0) {
            return ans
        }
        return getAns(1, n) as! [TreeNode?]
    }
    
    func getAns(_ start:Int, _ end:Int) -> [Any?] {
        
        var ans = Array<Any>()
        //此时没有数字，将 null 加入结果中
        if (start > end) {
            ans.append(NSNull());
            return ans
        }
        //只有一个数字，当前数字作为一棵树加入结果中
        if (start == end) {
            let vertex = TreeNode.init(start)
            ans.append(vertex)
            return ans
        }
        for i in start...end {
            //取出i为根节点 左子树的种类
            let leftAns = getAns(start, i-1)
            let rightAns = getAns(i+1, end)
            
            for leftTree in leftAns{
                
                for rightTree in rightAns {
                    //给i为根节点的 数 拼上左右节点
                    let root = TreeNode.init(i);
                    root.left = leftTree as? TreeNode;
                    root.right = (rightTree as? TreeNode);
                    //加入到最终结果中
                    ans.append(root);
                }
            }
        }
        return ans
    }
}
