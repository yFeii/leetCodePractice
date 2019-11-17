//
//  ViewController.swift
//  188. Best Time to Buy and Sell Stock IV
//
//  Created by yFeii on 2019/8/13.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let s = Solution()
        s.maxProfit(2
            ,[2,4,1])
    }

}

class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let count = prices.count
        if count == 0 {return 0}
        if k == 0 {return 0}
        if k > count/2 {return maxProfit_k_inf(prices)}
        let max_k = k
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
    
    func maxProfit_k_inf(_ prices: [Int]) ->  Int{

        let n = prices.count;
        var dp_i_0 = 0
        var dp_i_1 = Int.min
        
        for i in 0...n-1{
            let temp = dp_i_0
            dp_i_0 = max(dp_i_0, dp_i_1 + prices[i]);
            dp_i_1 = max(dp_i_1, temp - prices[i]);
        }
        return dp_i_0;
    }
}
