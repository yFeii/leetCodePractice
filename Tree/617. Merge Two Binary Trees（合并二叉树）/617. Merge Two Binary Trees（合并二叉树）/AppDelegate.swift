//
//  AppDelegate.swift
//  617. Merge Two Binary Trees（合并二叉树）
//
//  Created by yFeii on 2019/10/11.
//  Copyright © 2019 yFeii. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let t1 = TreeNode.init(2)
//        let tl = TreeNode.init(3)
        let t1r = TreeNode.init(3)
        t1.right = t1r
                let t2 = TreeNode.init(2)
                let t2l = TreeNode.init(3)
                let t2r = TreeNode.init(3)
        t2.left = t2l
        t2.right = t2r

        let c = Solution()
        let res = c.mergeTrees(t1, t2)
        print(res)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
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
 给定两个二叉树，想象当你将它们中的一个覆盖到另一个上时，两个二叉树的一些节点便会重叠。

 你需要将他们合并为一个新的二叉树。合并的规则是如果两个节点重叠，那么将他们的值相加作为节点合并后的新值，
 否则不为 NULL 的节点将直接作为新二叉树的节点。

 AB两棵树 同步递归 用B更新A并返回A
 递归过程:
 如果A当前节点为空 返回B的当前节点
 如果B当前节点为空 返回A的当前节点
 (此情况已经包含在上述两种)AB的两个当前节点都为空 返回null
 都不为空 则将B的val 加到A的val上 返回当前节点

 */
class Solution {
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        // 如果A当前节点为空 返回B的当前节点
        if t1 == nil {
            
            return t2
        }
        // 如果B当前节点为空 返回A的当前节点
        if t2 == nil {
            
            return t1
        }
        //如果都为空，在第一个判断中就会返回nil
        
        //如果都不为空则把值相加，放在t1
        t1?.val = (t1 == nil ? 0 : t1!.val) + (t2 == nil ? 0: t2!.val)
        t1?.left = mergeTrees(t1?.left, t2?.left)
        t1?.right = mergeTrees(t1?.right, t2?.right)
        return t1
    }
}
