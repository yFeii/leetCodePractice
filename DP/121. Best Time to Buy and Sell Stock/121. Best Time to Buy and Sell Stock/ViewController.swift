//
//  ViewController.swift
//  121. Best Time to Buy and Sell Stock
//
//  Created by yFeii on 2019/8/2.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit


/*
 dp[i][k][0] = max(dp[i-1][k][0], dp[i-1][k][1] + prices[i])
 max(   选择 rest  ,           选择 sell      )
 
 解释：今天我没有持有股票，有两种可能：
 要么是我昨天就没有持有，然后今天选择 rest，所以我今天还是没有持有；
 要么是我昨天持有股票，但是今天我 sell 了，所以我今天没有持有股票了。
 
 dp[i][k][1] = max(dp[i-1][k][1], dp[i-1][k-1][0] - prices[i])
 max(   选择 rest  ,           选择 buy         )
 
 解释：今天我持有着股票，有两种可能：
 要么我昨天就持有着股票，然后今天选择 rest，所以我今天还持有着股票；
 要么我昨天本没有持有，但今天我选择 buy，所以今天我就持有股票了。

 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution.init()
        s.maxProfit1([7,1,5,3,6,4])
    }

   
}
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        if prices.isEmpty {return 0}
        var max = 0
        var min = prices[0]
        for v in prices{
            
            if min>v{
                min = v
                continue;
            }
            if v - min > max{
                max = v-min
            }
        }
        return max
    }
    
    func maxProfit1(_ prices: [Int]) -> Int {
        
        let count = prices.count
        var dp =  [[Int]](repeating: [Int](repeating: 0, count: 2), count: count)
        for i in 0...count-1 {
            
            if (i - 1 == -1) {
                dp[i][0] = 0;
               
                dp[i][1] = -prices[i];
                continue;
            }
            //如果没有股票， =  （前一天没有，前一天有的+上当天的售出价）
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i]);
            //如果有股票， =  （前一天有，前一天有的+上当天的售出价）
            dp[i][1] = max(dp[i-1][1], -prices[i]);

        }
        return dp[count - 1][0]
//        int n = prices.length;
//        int[][] dp = new int[n][2];
//        for (int i = 0; i < n; i++) {
//            dp[i][0] = Math.max(dp[i-1][0], dp[i-1][1] + prices[i]);
//            dp[i][1] = Math.max(dp[i-1][1], -prices[i]);
//        }
//        return dp[n - 1][0];
    }
    
}
