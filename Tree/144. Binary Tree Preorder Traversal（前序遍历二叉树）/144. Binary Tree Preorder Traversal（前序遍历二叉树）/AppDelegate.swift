//
//  AppDelegate.swift
//  144. Binary Tree Preorder Traversal（前序遍历二叉树）
//
//  Created by yFeii on 2019/10/25.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

/*
 二叉树的前序遍历
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
    
    var res = Array<Int>.init()
    func preorderTraversal1(_ root: TreeNode?) -> [Int] {
        var current = Array<Int>.init()
        let node = root
        if node != nil {
            //递归:就是依次输出根,左,右,递归下去
            current.append(node!.val)
            let left = preorderTraversal(node?.left)
            let right = preorderTraversal(node?.right)
            current.append(contentsOf: left)
            current.append(contentsOf: right)
        }
        return current;
    }
    //栈
    /*
     *使用栈进行迭代，利用栈的先进后出，先把有节点入栈，然后左节点，这样可以保证先遍历最节点
     */
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack = Array<TreeNode>.init()
        var res = Array<Int>.init()
        if let root = root {
            stack.append(root)
            while !stack.isEmpty {
                
                let t = stack.popLast()
                res.append(t!.val)
                if let right = t?.right {
                    stack.append(right)
                }
                if let left = t?.left {
                    stack.append(left)
                }
            }
        }
        return res
    }
    
    //错误做法：这样遍历 就漏掉了 root 为根节点的情况
    func preorderTraversal2(_ root: TreeNode?) -> [Int] {
        
        var node = root
        if node != nil {
            res.append(node!.val)
        }
        if node?.left != nil {
            return preorderTraversal(node?.left)
        }else if node?.right != nil{
            return preorderTraversal(node?.right)
        }else{
            return res
        }

    }
    
    
    
}
