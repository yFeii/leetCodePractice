//
//  ViewController.swift
//  Course Schedule II
//
//  Created by yFeii on 2019/8/19.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        let s = Solution()
        let r = s.findOrder(2, [[1,0]])
        print(r)
    }


}

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        
        var indegrees = Array.init(repeating: 0, count: numCourses)
        for a in prerequisites {
            
            indegrees[a[0]] += 1
        }
        var res = Array<Int>.init()
        var q = Array<Int>.init()
        for i in 0...numCourses-1 {
            
            if indegrees[i] == 0 {
                q.append(i)
                res.append(i)
            }
        }
        var numCoursesT = numCourses
        while !q.isEmpty {
            
            let pre = q.removeFirst()
            numCoursesT -= 1
            for a in prerequisites{
                
                if (a[1] != pre) {continue}
                indegrees[a[0]] -= 1
                let r = indegrees[a[0]]
                if (r == 0) {
                    q.append(a[0])
                    res.append(a[0])
                }
            }
        }
        if numCoursesT == 0 {return res}
        return []
    }
}
