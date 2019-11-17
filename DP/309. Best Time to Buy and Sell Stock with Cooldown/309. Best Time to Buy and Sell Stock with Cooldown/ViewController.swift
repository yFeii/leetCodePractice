//
//  ViewController.swift
//  309. Best Time to Buy and Sell Stock with Cooldown
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
        s.maxProfit([2,1,4])
    }
}

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        let count = prices.count
        var dp = Array.init(repeating: Array.init(repeating: 0, count: 2), count: count)
        if count == 0 {return 0}
        if count == 1 {return 0}
        
        //初始化0状态
        dp[0][0] = 0
        //第一天就买入 亏损 -prices[0]
        dp[0][1] = -prices[0]
        
        dp[1][0] = max(dp[0][0], dp[0][1]+prices[1])
        //因为 0-2不存在 ，所以买入为  -prices[1]
        dp[1][1] = max(dp[0][1], -prices[1])
        if count > 2{
            for i in 2...count-1 {
                
                dp[i][0] = max(dp[i-1][0], dp[i-1][1]+prices[i])
                dp[i][1] = max(dp[i-1][1], dp[i-2][0]-prices[i])
            }
        }

        return dp[count-1][0];
    }
}

