//
//  ViewController.swift
//  416. 分割等和子集(搜索+dp)
//
//  Created by yFeii on 2019/9/21.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let s = Solution()
        s.canPartition([1,5,11,5,4])
        
    }


}

/*
 
 给定一个只包含正整数的非空数组。是否可以将这个数组分割成两个子集，使得两个子集的元素和相等。
 
 注意:
 
 每个数组中的元素不会超过 100
 数组的大小不会超过 200
 示例 1:
 
 */

class Solution {
    
    var K:Int!
    var used:Array<Bool>!
    func canPartition(_ nums: [Int]) -> Bool {
        K = 2
        used = Array.init(repeating: false, count: nums.count)
        let sum = nums.reduce(0) { (r, n) -> Int in
            return r + n
        }
        //如果和不能被2整除 直接返回false
        if sum % 2 != 0 {
            return false
        }
        //如果只有1个数 直接返回false
        if nums.count <= 1 {

            return false
        }
        return dp(nums, sum / 2)
//        return dfs(0, 0 ,sum / 2, nums)
    }
    /*
     给定一个只包含正整数的非空数组。是否可以将这个数组分割成两个子集，使得两个子集的元素和相等。

     注意:

     每个数组中的元素不会超过 100
     数组的大小不会超过 200

     因为此题目 只要求分成两个子集，所以，可以演变为
     -> 给出一组数，能否找到一些列数（子集合），使得这一些列的数的和 等于 全部数组的和的一半
     -> 因为如果一个数组的和固定(S)，如果能找出某个子集(dp)满足 sum(dp) = S / 2，
     -> 那么剩余的子集一定也满足和 = S / 2，
     */
    
    func dp(_ nums: [Int], _ avg:Int) -> Bool{
        let size = nums.count;
        //dp[i][j] 当前数字0到i,能否组成和为J 的子集
        //横坐标为 和J
        //纵坐标为 i
        var dp = Array.init(repeating: Array.init(repeating: false, count: avg+1), count: size)
        
        //因为所有响 都关联前一项，为了避免 i-1 的判断，
        //这里预先计算所有i = 0 的情况
        for j in 0...avg {
            
            let num = nums[0]
            if num == j {
                dp[0][j] = true
            }
        }
        //因为所有响 都关联前一项，为了避免 i-1 的判断，这里总1开始
        for i in 1...size-1 {
            
            for j in 0...avg {
                let num = nums[i]
                
                if num <= j {
                    //如果当前的数字小于当前和
                    //则当前是否可以组成子集的条件为：
                    //前一项（不取当前项）|| 前一项能否组成j-num(当前和减去当前值)
                    dp[i][j] = dp[i-1][j] || dp[i-1][j-num]
                }else{
                    dp[i][j] = dp[i-1][j]
                }
            }
        }
        return dp[size-1][avg];
    }
    
    // 已当前数为起点能否组成 和为 avg 的集合
    func dfs(_ start:Int, _ curSum:Int, _ avg:Int, _ nums: [Int]) -> Bool {
        
        if K == 1 {
            return true
        }
        
        if (curSum == avg){
            
            K = K - 1
            return dfs(0, 0 , avg, nums)
        }
        if (start > nums.count-1){
            return false
        }
        for i in start...nums.count-1{
            let num = nums[i]
            let sum  = num + curSum
            if used[i] == false && sum <= avg {
                
                
                used[i] = true
                if (dfs(start + 1, sum , avg, nums)) {
                    return true
                }
                used[i] = false
            }
        }
        return false
    }
}
