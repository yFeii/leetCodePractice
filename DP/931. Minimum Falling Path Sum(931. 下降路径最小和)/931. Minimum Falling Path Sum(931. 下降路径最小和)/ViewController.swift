//
//  ViewController.swift
//  931. Minimum Falling Path Sum(931. 下降路径最小和)
//
//  Created by yFeii on 2019/9/5.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        s.minFallingPathSum([[69]]);
    }


}

/*
 给定一个方形整数数组 A，我们想要得到通过 A 的下降路径的最小和。
 
 下降路径可以从第一行中的任何元素开始，并从每一行中选择一个元素。在下一行选择的元素和当前行所选元素最多相隔一列。
 
 我们用 dp(i, j) 表示从位置为 (i, j) 的元素下降路径最小和。根据题目的要求，位置 (i, j) 受3个位置的值影响：左上，上，右上
即： (i - 1, j - 1)，(i - 1, j) 和 (r - 1, j + 1) 三个位置（先不考虑超出数组边界的情况），因此状态转移方程为：
 
 dp(i, j) = A[i][j] + min{dp(i - 1, j - 1), dp(r - 1, j), dp(r - 1, j + 1)}
 
 */

class Solution {
    func minFallingPathSum(_ A: [[Int]]) -> Int {
        
        let count = A.count
        var dp = Array.init(repeating: Array.init(repeating: 0, count: A.count), count:  A.count)
        if count > 0 {
            dp[0] = A[0]
            //兼容leetCode swift不识别NSIntegerMax，根据题意（值不会超过100），设置为111
            var result = 111
            if count > 1 {
                for i in 1...count-1 {
                    
                    for j in 0...count-1 {
                        // dp(i, j) = A[i][j] + min{dp(i - 1, j - 1), dp(r - 1, j), dp(r - 1, j + 1)}

                        var left = 111;
                        if i > 0 && j > 0 {
                            left = dp[i-1][j-1]
                        }
                        
                        var top = 111;
                        if i > 0 {
                            top = dp[i-1][j]
                        }
                        
                        var right = 111;
                        if i > 0 && j < count-1{
                            right = dp[i-1][j+1]
                        }
                        
                        let minV = min(left, top ,right);
                        dp[i][j] = minV + A[i][j]
                    }
                }
            }
            for i in 0...count-1 {
                
                result = min(result, dp[count-1][i])
            }
            return result
        }
        return 0
    }
}
