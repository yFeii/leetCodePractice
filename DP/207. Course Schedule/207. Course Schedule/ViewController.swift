//
//  ViewController.swift
//  207. Course Schedule
//
//  Created by yFeii on 2019/8/18.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let s = Solution()
        s.canFinish(4
            ,[[2,0],[1,0],[3,1],[3,2],[1,3]])
    }


}
class Solution {
    func canFinish(_  numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var numCoursesT = numCourses
        let count = prerequisites.count;
        if count == 0 {return true}
        //初始化入度数组
        var indegrees = Array.init(repeating: 0, count: numCourses)
//        var map = Dictionary<Int,Array<Int>>.init(minimumCapacity: 0)
        // 统计节点的入度数
        for a in prerequisites {
   
            indegrees[a[0]]+=1
        }
        var q = Array<Int>.init()
        for i in 0...numCourses-1 {
            
            // indegrees 存储的为 第几个节点的入度，所以队列要存i,
            if indegrees[i] == 0 {q.append(i)}
        }
        
        while !q.isEmpty {
            
            //拿掉第一个节点
            let pre = q.removeFirst()
            //说明有一个课 是被上完了
            numCoursesT-=1;
            for a in prerequisites {
                //如果pre的临近节点（指向Pre）的节点，因为Pre为0,所以下个可能为0的就是指向pre的节点
                if a[1] != pre {continue}
                //把找到临近节点，获取临近节点的依赖（前置）点
                indegrees[a[0]] -= 1
                //如果前置点为0 则加入 队列
                if indegrees[a[0]]  == 0 {
                    q.append(a[0])
                }
            }
        }
        
        //要是等于0 就说明课都上完了
        return numCoursesT == 0
    }
}
