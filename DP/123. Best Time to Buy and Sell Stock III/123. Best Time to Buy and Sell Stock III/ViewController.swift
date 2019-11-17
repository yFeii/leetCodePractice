//
//  ViewController.swift
//  123. Best Time to Buy and Sell Stock III
//
//  Created by yFeii on 2019/8/12.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let s = Solution()
        let r = s.maxProfit([2,4,1])
        
    }
}

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let count = prices.count
        let max_k = 2
        var dp = Array.init(repeating: Array.init(repeating: Array.init(repeating: 0, count: 2), count: max_k+1), count: count)
        
        for i in 0...count-1{
            
            for k in (1...max_k).reversed() {
                
                if (i - 1 == -1) {
                    dp[i][k][0] = 0;
                    dp[i][k][1] = -prices[i];
                    continue;
                }
                
                dp[i][k][0] = max(dp[i-1][k][0], dp[i-1][k][1]+prices[i])
                dp[i][k][1] = max(dp[i-1][k][1], dp[i-1][k-1][0]-prices[i])
            }
        }
        return dp[count - 1][max_k][0];
    }
}
//class Solution {
//    public int maxProfit(int[] prices) {
//    int max_k = 2;
//    int n = prices.length;
//
//    int[][][] dp = new int[n][max_k + 1][2];
//    for (int i = 0; i < n; i++) {
//    for (int k = max_k; k >= 1; k--) {
//    if (i - 1 == -1) { /*处理 base case */
//    /* 处理 base case */
//    dp[i][k][0] = 0;
//    dp[i][k][1] = -prices[i];
//    continue;
//    }
//    dp[i][k][0] = Math.max(dp[i-1][k][0], dp[i-1][k][1] + prices[i]);
//    dp[i][k][1] = Math.max(dp[i-1][k][1], dp[i-1][k-1][0] - prices[i]);
//    }
//    }
//    // 穷举了 n × max_k × 2 个状态，正确。
//    return dp[n - 1][max_k][0];
//    }
//}
