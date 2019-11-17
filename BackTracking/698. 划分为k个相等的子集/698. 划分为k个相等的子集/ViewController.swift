//
//  ViewController.swift
//  698. 划分为k个相等的子集
//
//  Created by yFeii on 2019/9/20.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        
        let r = s.canPartitionKSubsets([4, 3, 2, 3, 5, 2, 1]
            ,4)
        print(r);
        
    }


}

class Solution {
    var used:[Bool]!
    var numsT:[Int]!
    var K:Int!

    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        K = k
        used = Array.init(repeating: false, count: nums.count)
        
        var sortedNums = nums
//        var sortedNums = nums.sorted()
//        sortedNums.reverse()
        let sum = sortedNums.reduce(0) { (r, n) -> Int in
            return r + n
        }
        if sum % k != 0 {
            return false
        }else{
            numsT = sortedNums;
//            return dfs(0, 0, sum/k)
            return dfs(k, sum / k, 0, 0)
        }
    }
    
    // 给定一个数组，找出所有等于5的数组合
    // 给定一个数组，找出所有等于i的数
    func dfs(_ k:Int, _ avg:Int, _ curNum:Int, _ start:Int) -> Bool {
        
        if k == 0 {
            return true
        }
        
        if curNum == avg {
            //构建下一集合
            return dfs(k-1, avg ,0, 0)
        }
        if start > numsT.count-1 {
            return false
        }
        for i in start...numsT.count-1 {
            
            //获取当前数
            let num = numsT[i]

            //获取当前数 + 当前的总和
            let sum = num + curNum;
            //如果 总和 比平均值小 则需要继续从当前数开始的下一位查找
            //如果当前数被使用 则跳过
            if used[i] == false && sum <= avg {
                
                // 下一位，当前的总和，平均值
                used[i] = true
                if (dfs(k, avg,sum,i+1)) {
                    return true
                }
                used[i] = false
            }
        }
        return false
    }
    
    
    // 给定一个数组，找出所有等于5的数组合
    // 给定一个数组，找出所有等于i的数
    func dfs1( _ curIndex:Int , _ curNum:Int,_ avg:Int) -> Bool {
        
        if K == 0 {
            return true
        }
        
        if curNum == avg {
            
            K -= 1
            return (dfs1(0, 0, avg))
        }
        if curIndex > numsT.count-1 {
            return false
        }
        for i in curIndex...numsT.count-1 {
            
            //获取当前数
            let num = numsT[i]
            //如果当前数被使用 则跳过
            //获取当前数 + 当前的总和
            let sum = num + curNum;
            //如果 总和 比平均值小 则需要继续从当前数开始的下一位查找
            if used[i] == false && sum <= avg {
                
                // 下一位，当前的总和，平均值
                used[i] = true
                if (dfs1(i+1, sum, avg)) {
                    return true
                }
                used[i] = false
            }
        }
     return false
    }
}
