//
//  AppDelegate.swift
//  494. Target Sum(目标和)
//
//  Created by yFeii on 2019/9/24.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let s = Solution()
        s.findTargetSumWays([1, 2, 3, 4, 5],5)
        // Override point for customization after application launch.
        return true
    }

    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
/*
 原问题等同于：
 找到nums一个正子集和一个负子集，使得总和等于target
 我们假设P是正子集，N是负子集 例如： 假设nums = [1, 2, 3, 4, 5]，target = 3，
 一个可能的解决方案是+1-2+3-4+5 = 3
 这里正子集
 P = [1, 3, 5]
 负子集
 N = [2, 4]

 那么让我们看看如何将其转换为子集求和问题：
                   sum(P) - sum(N) = target
 sum(P) + sum(N) + sum(P) - sum(N) = target + sum(P) + sum(N)
                        2 * sum(P) = target + sum(nums)
                            sum(P) = (target + sum(nums)) / 2
 */

// 参考 377. 组合总和 Ⅳ
//https://leetcode-cn.com/problems/combination-sum-iv/solution/xiang-xi-de-dpsuan-fa-jiang-jie-gua-he-xin-shou-by/


/*
 dp[4] = dp[4-1]+dp[4-2]+dp[4-3] = dp[3]+dp[2]+dp[1]

 dp[1] = dp[0] = 1;
 dp[2] = dp[1]+dp[0] = 2;
 dp[3] = dp[2]+dp[1]+dp[0] = 4;
 dp[4] = dp[4-1]+dp[4-2]+dp[4-3] = dp[3]+dp[2]+dp[1] = 7
 dp[j] = dp[j] + dp[j-num]
 */

class Solution {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        
        let sum = nums.reduce(0) { (r, n) -> Int in
            return r + n
        }
        //如果总和小于 目标数 或者 不是偶数，则不可能组成目标数
        if sum < S || (sum+S)%2 != 0 {
            return 0
        }
        // 子集求和:P
        let P = (sum+S)/2;

        var dp = Array.init(repeating: 0, count: P+1)
        //当和为0时，任意组合都满足，所以为1
        // 377 先遍历 target，后遍历num 因377题意可重复使用数组
        //此题目不可重复使用数字，
        //但是 状态转移方程不变
        dp[0] = 1
        for num in nums {
            
            if P>=num {
                //
                for j in (num...P).reversed() {

                    //dp[i] 的解法数为自身加上dp[i-num]的解法数
                    //这里为什么会如此，可以参考斐波那契数列
                    //这里我可以不放 num 进背包，解法数为 dp[i]
                    //将 num 放进背包，解法数为 dp[i-num]
                    //所以此时的总解法数为 二者和

                    dp[j] = dp[j] + dp[j-num]
                }
            }
        }
        return dp[P]
    }
    
    func dfs()  {
        
        
    }
}
