//
//  ViewController.swift
//  646. Maximum Length of Pair Chain(最长数对链)
//
//  Created by yFeii on 2019/8/29.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        s.findLongestChain1([[-10,-8],[-6,-4],[-5,0],[-4,7],[1,7],[8,9],[6,10],[9,10]])
    }


}

//此题目与 查找最大增序列 类似，不过用dp 效率 没有 排序后直接遍历一次的效率高
class Solution {
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        
        var sortPairs = pairs
        sortPairs.sort { (a, b) -> Bool in
            
            return a[1] < b[1]
        }
        let count = pairs.count
        var dp = Array.init(repeating: 1, count: count)
        if  count < 1 {
            
            return 0
        }
        //dp[i] 表示以 sortPairs[i] 这个数结尾组成增长对儿数的最长长度。
        for i in 0...sortPairs.count-1 {
            if i > 0 {

                for j in 0...i-1 {
                    
                    let a = sortPairs[i]
                    let b = sortPairs[j]
                    if b[1] < a[0]{
                        
                        dp[i] = max(dp[i], dp[j]+1)
                    }
                    
                }
            }
        }
        var res = 0;
        for v in dp {
            
            res = max(res,v)
        }
        return res
    }
    
    
    func findLongestChain1(_ pairs: [[Int]]) -> Int {
        
        let count = pairs.count
        var sortPairs = pairs
        var res = 1;
        //先排序
        sortPairs.sort { (a, b) -> Bool in
            
            if a[1] == b[1] {
                return a[0] < b[0]
            }
            return a[1] < b[1]
        }
        if  count < 1 {
            
            return 0
        }
        if  count == 1 {
            
            return res
        }
        var last = sortPairs[0]
        for i in 1...sortPairs.count-1 {
            //这里 其实不是跟上一个数比，而是跟上一个加入 增长对 的数里面比，所以不需要j，
            //同时，满足条件后，last 应该被这次满足条件的a赋值。
//            let j = i - 1
            let a = sortPairs[i]
//            let b = sortPairs[j]
            if last[1] < a[0]{
                res += 1
                last = a
//                last = b
            }
        }
        return res
    }
    
}
//[-10,-8],[-6,-4],[1,7],[8,9],
