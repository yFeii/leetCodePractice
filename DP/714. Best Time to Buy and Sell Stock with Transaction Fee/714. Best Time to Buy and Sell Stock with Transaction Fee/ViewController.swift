//
//  ViewController.swift
//  714. Best Time to Buy and Sell Stock with Transaction Fee
//
//  Created by yFeii on 2019/8/16.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution();
        s.maxProfit([1, 3, 2, 8, 4, 9], 2)
        
    }
}

class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        
        let count = prices.count
        var dp = Array.init(repeating: Array.init(repeating: 0, count: 2), count: count)
        
        if count == 1 || count == 0{
            return 0
        }
        
        dp[0][0] = 0;
        dp[0][1] = -prices[0]
        for i in 1...prices.count-1 {
            
            dp[i][0] = max(dp[i-1][0], dp[i-1][1]+prices[i]-fee)
            dp[i][1] = max(dp[i-1][1], dp[i-1][0]-prices[i])
        }
        return dp[count-1][0]
    }
}

