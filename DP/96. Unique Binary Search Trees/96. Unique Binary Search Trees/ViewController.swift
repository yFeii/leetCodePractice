//
//  ViewController.swift
//  96. Unique Binary Search Trees
//
//  Created by yFeii on 2019/8/10.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let s = Solution()
        let r = s.numTrees(3);

    }
}


class Solution {
    func numTrees(_ n: Int) -> Int {
        
        var dp = Array.init(repeating: 0, count: n+1)
        dp[0]=1
        dp[1]=1
        if n > 1 {
            for i in 2...n {
                for j in 1...i {
                    
                    let a = dp[j-1]
                    let b = dp[i-j]
                    let c = dp[i]
                    dp[i] = dp[i]+a*b
                }
                
            }
        }
        return dp[n]
    }
}
