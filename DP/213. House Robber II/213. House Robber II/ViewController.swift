//
//  ViewController.swift
//  213. House Robber II
//
//  Created by yFeii on 2019/8/16.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        s.rob1([2,3,2])
    }


}


class Solution {
//    func rob(_ nums: [Int]) -> Int {
//
//        let count = nums.count
//        var dp = Array.init(repeating: Array.init(repeating: 0, count: 2), count: count)
//
//        dp[0][0] = 0
//        dp[0][1] = nums[0]
//
//        dp[1][0] = 0
//        dp[1][1] = nums[1]
//
//        for i in 2...count-1 {
//
//            dp[i][0] = max(dp[i-1],dp[i-2]+nums[i])
//            dp[i] = max(dp[i-1],dp[i-2]+nums[i])
//
//        }
//        return dp[count-1]
//    }
    
    //因为首尾相斥（要么取第一个，要么取最后一个），所以分成两个数组，最后max比较
    func rob1(_ nums: [Int]) -> Int {
        
        let count = nums.count
        var nums1 = nums
        var nums2 = nums

        if count == 0 {
            return 0
        }
        if count == 1 {
            
            return nums[0]
        }
        if count == 2 {
            
            return 0
        }
        nums1.remove(at: 0)
        nums2.remove(at: count-1)
        
        var dp1 = Array.init(repeating: 0, count: count-1)
        var dp2 = Array.init(repeating: 0, count: count-1)
        dp1[0] = nums1[0]
        dp1[1] = max(dp1[0], nums1[1])
        
        dp2[0] = nums2[0]
        dp2[1] = max(dp2[0], nums2[1])

        if nums1.count > 2 {
            for i in 2...nums1.count-1 {
                
                    dp1[i] = max(dp1[i-1],dp1[i-2]+nums1[i])
                    dp2[i] = max(dp2[i-1],dp2[i-2]+nums2[i])
            }
        }
        return max(dp1[nums1.count-1],dp2[nums1.count-1])
    }
}
