//
//  ViewController.swift
//  198. House Robber
//
//  Created by yFeii on 2019/8/6.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let s = Solution()
        let r = s.rob([1,2,3,1])
        print(r)
    }

 
}

//地推关系：当前一项的最大值 要么等于前一项，要么等于前2项+当前数字
class Solution {
    func rob(_ nums: [Int]) -> Int {
        
        
        let count = nums.count
        var dp:Array = Array.init(repeating: 0, count: count)
        var maxNum = 0
        for i in 0...nums.count-1 {
            
            let num = nums[i]
            var l1 = 0
            var l2 = 0
            if i>0 {l1 = dp[i-1]}
            if i>1 {l2 = dp[i-2]}
            dp[i] = max(l1, l2+num)
            maxNum = max(maxNum, dp[i])
        }
        return maxNum
    }
}
