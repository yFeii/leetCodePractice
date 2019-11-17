//
//  ViewController.swift
//  983. Minimum Cost For Tickets（最低票价） ）
//
//  Created by yFeii on 2019/9/10.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let s = Solution()
        s.mincostTickets([1,4,6,7,8,20]
            ,[2,7,15])
        // Do any additional setup after loading the view.
    }


}

class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        //日票的价格
        let cost1 = costs[0]
        //周票的价格
        let cost2 = costs[1]
        //月票的价格
        let cost3 = costs[2]
        
        //初始化一年的天数， days 中为第几天是旅行日。以为是可能是跨天的，所以要按天数递增来，然后在看当天(dp[i])是否
        //为days中的一天即：是否为旅行日,396为避免减法判断
        var dp = Array.init(repeating: 0, count: 396)

        //获得所以旅行日
        for i in 0...days.count-1{
            
            dp[days[i]+30] = -1
        }
        
        for i in 30...395 {
            
            //如果已经超出计划旅行日的最后一天，则退出循环
            if i > days[days.count-1]+30 {
                break
            }
            if dp[i] == 0 {
                //当天不需要旅行，价格为前一天
                dp[i] = dp[i-1]
            }else{
                
                //当天需要旅行，价格为三种票价 取最小值
                let c1 = dp[i-1]+cost1
                let c2 = dp[i-7]+cost2
                let c3 = dp[i-30]+cost3

                dp[i] = min(c1, c2, c3)
            }
        }
        return dp[days[days.count-1] + 30]
    }
}
