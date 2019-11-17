//
//  ViewController.swift
//  894. All Possible Full Binary Trees（所有可能的满二叉树）
//
//  Created by yFeii on 2019/9/17.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let s = Solution1()
        s.allPossibleFBT(7)
    }


}
/**
 * Definition for a binary tree node.
 
 满二叉树是一类二叉树，其中每个结点恰好有 0 或 2 个子结点。
 
 返回包含 N 个结点的所有可能满二叉树的列表。 答案的每个元素都是一个可能树的根结点。
 
 答案中每个树的每个结点都必须有 node.val=0。
 
 你可以按任何顺序返回树的最终列表。
 
 
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


/*
 
 思路
 如果你要构造一颗有 N 个节点的二叉树，你会怎么做？
 
 首先，你肯定会先 new 一个根结点对象 root，然后为它构造左子树，再为它构造右子树。
 
 那么对它的左子树 root.left 而言，它同样需要构造左子树和右子树。右子树 root.right 亦然。
 
 因此，你的所有子树都是一棵满二叉树。
 
 「给你一个整数 N，构造出一棵包含 N 个节点的满二叉树」。这句话是题目本身，也是无数个被拆分出的子问题。
 
 满二叉树如何构造？
 满二叉树是一类二叉树，其中每个结点恰好有 0 或 2 个子结点。
 
 如果你要为某节点分配一个左节点，那么一定也要为它分配一个右节点。因此，如果 N 为偶数，那一定无法构成一棵满二叉树。
 
 为了列出所有满二叉树的排列，我们可以为左子树分配 x 节点，为右子树分配 N - 1 - x（其中减 1 减去的是根节点）节点，然后递归地构造左右子树。
 
 x 的数目从 1 开始，每次循环递增数目 2（多增加 2 个节点，等于多增加 1 层）。
 
 递归过程
 递归最关心的两个问题是：
 
 结束条件
 自身调用
 对于这个问题来说，结束条件为：
 
 当 N 为偶数时：无法构造满二叉树，返回空数组
 当 N == 1 时：树只有一个节点，直接返回包含这个节点的数组
 当完成 N 个节点满二叉树构造时：返回结果数组
 当需要构造左右子树时，就进行自身调用。具体的看代码吧~
 
 */
class Solution {
    func allPossibleFBT(_ N: Int) -> [TreeNode?] {
        var res = [TreeNode?]()
        
        //结束条件
        //自身调用
        //对于这个问题来说，结束条件为：
        
        //当 N 为偶数时：无法构造满二叉树，返回空数组
        //当 N == 1 时：树只有一个节点，直接返回包含这个节点的数组
        //当完成 N 个节点满二叉树构造时：返回结果数组
        if N == 0 {
            return  []
        }
        if N == 1 {
            return [TreeNode(0)]
        }
        if N % 2 == 0 {
            
            return  []
        }
        // x 的数目从 1 开始，每次循环递增数目 2（多增加 2 个节点，等于多增加 1 层）。
        // 左子树分配一个节点
        var leftNum = 1
        // 右子树可以分配到 N - 1 - 1 = N - 2 个节点
        var rightNum = N - 1 - leftNum
        while rightNum > 0 {
            // 递归构造左子树
            let leftTrees = allPossibleFBT(leftNum)
            // 递归构造右子树
            let rightTrees = allPossibleFBT(rightNum)
            // 具体构造过程
            for leftTree in leftTrees {
                
                for rightTree in rightTrees {
                    
                    let root = TreeNode(0)
                    root.left = leftTree
                    root.right = rightTree
                    res.append(root)
                }
            }
            leftNum = leftNum + 2
            rightNum = rightNum - 2
        }
        return res
    }
}

/*
 令 \text{FBT}(N)FBT(N) 作为所有含 NN 个结点的可能的满二叉树的列表。
 
 每个满二叉树 TT 含有 3 个或更多结点，在其根结点处有 2 个子结点。这些子结点 left 和 right 本身就是满二叉树。
 
 因此，对于 N \geq 3N≥3，我们可以设定如下的递归策略：\text{FBT}(N) =FBT(N)= [对于所有的 xx，所有的树的左子结点来自 \text{FBT}(x)FBT(x) 而右子结点来自 \text{FBT}(N-1-x)FBT(N−1−x)]。
 
 此外，通过简单的计数参数，没有满二叉树具有正偶数个结点。
 
 最后，我们应该缓存函数 \text{FBT}FBT 之前的结果，这样我们就不必在递归中重新计算它们。
 */
class Solution1 {
    //缓存
    var memo = [Int:[TreeNode?]]()
    func allPossibleFBT(_ N: Int) -> [TreeNode?] {
        
        //缓存不存在
        if (memo[N] == nil) {

            //初始化新数组
            var res = [TreeNode?]()
            
            //结束条件
            //自身调用
            //对于这个问题来说，结束条件为：
            //当 N == 1 时：树只有一个节点，直接返回包含这个节点的数组
            if N == 1 {
                res.append(TreeNode(0))
            }else if N % 2 == 1 {
                //当 N 为奇数时：构造满二叉树
                //构造当前第 N 个节点满二叉树
                for leftNum in 0...N {
                    let rightNum = N-leftNum-1
                    if rightNum >= 0 {
                        // 递归构造左子树
                        let leftTrees = allPossibleFBT(leftNum)
                        // 递归构造右子树
                        let rightTrees = allPossibleFBT(rightNum)
                        // 具体构造过程
                        for leftTree in leftTrees {
                            
                            for rightTree in rightTrees {
                                
                                let root = TreeNode(0)
                                root.left = leftTree
                                root.right = rightTree
                                res.append(root)
                            }
                        }
                    }
                }
            }
            //构造结束
            memo[N] = res
        }
        return memo[N]!
    }
}
