//
//  ViewController.swift
//  673. Number of Longest Increasing Subsequence(最长递增子序列的个数)
//
//  Created by yFeii on 2019/8/30.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        s.findNumberOfLIS([2,2,2,2,2])
    }


}

class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        
        //dp[i] 表示以 nums[i] 这个数结尾的最长递增子序列的长度。
        //为什么dp[i]不能代表到[i]为止最长递增子序列？因为dp[i]跟dp[i-1]是没有递推关系的。
        //也就是说，当前数字的最大值并不是由前一个递推出来，而是有前面所有的最大值比较之后得出
        var dp = Array.init(repeating: 1, count: nums.count)
        var count = Array.init(repeating: 1, count: nums.count)
        if  nums.count < 1 {
            
            return 0
        }
        var maxL = 0;
        for i in 0...nums.count-1 {
            
            if i > 0 {
                for j in 0...i-1{
                    
                    //如果前面的数（nums[j] ）比 nums[i] 小，说明可以组成升序序列，所以 要比较 dp[i] 与dp[j]+1的大小
                    if nums[j] < nums[i] {
                        //如果当前的长度没有j+1长，说明要更新count[i],count[j]之所以不加1 是因为这里统计的是个数。
                        if dp[i] < dp[j]+1 {
                            count[i] = count[j]
                        }else if dp[i] == dp[j]+1 {
                            //说明有相同长度，则更新 count[i] = count[j]+本身
                            count[i] += count[j]
                        }
                        dp[i] = max(dp[i], dp[j]+1)
                    }
                }
            }
            //每次更新最大值
            maxL = max(maxL,dp[i]);
        }
        
        //遍历dp，找出所有长度为 maxL的下标，把count 相加
        var ans = 0;
        for i in (0...dp.count-1).reversed() {
            
            if dp[i] == maxL {
                
                ans += count[i];
            }
            
        }
        return ans
    }
}
