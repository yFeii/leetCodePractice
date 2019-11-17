//
//  ViewController.swift
//  377. Combination Sum IV
//
//  Created by yFeii on 2019/8/20.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let r = Solution()
        r.combinationSum4([3,33,333],10000)
    }


}

class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        
        if target == 0 {
            return 0;
        }
        
        var dp = Array<Int>.init(repeating: 0, count: target+1)
        //转移方程初始条件
        dp[0] = 1
        //从i开始计算，每个数 跟num组合
        //如要组成7，那么我们遍历[1,2,5]，
        //就有（1+组成6）+（2+组成5）+（5+组成2）三类方案来组成7。
        //即：i = 7 是 dp[7-num[1]] + dp[7-num[2]], 所以先遍历1到target，在用每一个数i套用转移方程
        //那么只需要将组成6的方案数+组成5的方案数+组成2的方案数加起来即可。
        for i in 0...target {
            
            for num in nums {
                
                if i >= num {
                    //会溢出
                    dp[i] = dp[i] &+ dp[i-num]
                }
            }
        }
        return Int(dp[target])
    }
}
