//
//  ViewController.swift
//  746. Min Cost Climbing Stairs
//
//  Created by yFeii on 2019/8/7.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        let r = s.minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1])
        print(r)
    }


}


class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        
        let count = cost.count
        if count == 0 {return 0}
        var sum = Array.init(repeating: 0, count: count)
        
        for i in 0...cost.count-1{
            var l1 = 0
            var l2 = 0
            if i>0 {l1 = sum[i-1]}
            if i>1 {l2 = sum[i-2]}
            sum[i] = min(l1, l2) + cost[i]
        }
        let r = min(sum[count-1], sum[count-2])
        return r
    }
}
