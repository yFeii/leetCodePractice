//
//  ViewController.swift
//  70. Climbing Stairs
//
//  Created by yFeii on 2019/8/1.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let s = Solution.init()
        let res =  s.climbStairs1(3)
        print(res)
    }

}

class Solution {
    func climbStairs(_ n: Int) -> Int {
        
        if n == 1 {return 1}
        if n == 2 {return 2}
        return climbStairs(n-1) + climbStairs(n-2)
    }
    
    func climbStairs1(_ n: Int) -> Int {
        
        if n == 1 {return 1}
        if n == 2 {return 2}
        let c = n + 1
        var dp:Array<Int> = Array.init(repeating: 0, count: c);
        dp[1] = 1
        dp[2] = 2
        for i in 3...n {
            
            dp[i] = dp[i-1]+dp[i-2]
        }
        return dp[n]
    }

    
    
    
    
}
