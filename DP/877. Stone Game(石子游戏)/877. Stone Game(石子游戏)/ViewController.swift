//
//  ViewController.swift
//  877. Stone Game(石子游戏)
//
//  Created by yFeii on 2019/9/3.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let s = Solution()
        s.stoneGame([5,3,4,5])
    }

}

/*
 动态规划，建立二维数组dp[N][N],其中N为piles数组长度。
 dp[ i ][ j ]表示在piles中下标 i 至下标 j 之间的亚力克斯所拿石子总数和李所拿石子总数之差
 dp[ i ][ j ] > 0 时亚历克斯拿的石子数目大于李，亚力克斯胜利，否则李胜利
 dp的初始状态是 i = j 即只有一个石子堆，由于亚历克斯先拿，则 dp[ i ][ j ] = piles[ i ]
 当亚历克斯拿了最左边下标为 i 的石子后，
 亚历克斯和李的石子数之差为 piles[ i ] - dp[ i+1 ][ j ],
 当亚历克斯拿了最右边下标为j的那堆石子后，
 亚历克斯和李的石子数之差为 piles[ j ] - dp[ i ][ j-1 ], 取其中较大者为新的最优解。
 动态转移方程: 
 dp[ i ][ j ] = max( piles[ i ] - dp[ i+1 ][ j ], piles[ j ] - dp[ i ][ j-1 ])
 本题递归求解存在超时问题故用非递归方法实现
 */

class Solution {
    func stoneGame(_ piles: [Int]) -> Bool {
        
        let count = piles.count
        var dp = Array.init(repeating: Array.init(repeating: 0, count: count), count: count)
        
        for i in 0...piles.count-1 {
            
            for j in i...piles.count-1 {
                
                if i == j{
                    //base code
                    dp[i][j] = piles[i]
                }else{
                    dp[i][j] = max(piles[i]-dp[i+1][j], piles[i]-dp[i][j-1])
                }
            }
        }
        if dp[0][count-1] >= 0 {
            return true
        }
        return false
    }
}
