//
//  ViewController.swift
//  647. Palindromic Substrings
//
//  Created by yFeii on 2019/8/26.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        s.countSubstrings("fdsklf")
    }


}


/*
 给定一个字符串，你的任务是计算这个字符串中有多少个回文子串。
 
 具有不同开始位置或结束位置的子串，即使是由相同的字符组成，也会被计为是不同的子串。
 
 示例 1:
 
 输入: "abc"
 输出: 3
 解释: 三个回文子串: "a", "b", "c".
 
 */

/*
 
 对于字符串str，假设dp[i,j]=1表示str[i...j]是回文子串，
 那个必定存在dp[i+1,j-1]=1。这样最长回文子串就能分解成一系列子问题，
 可以利用动态规划求解了。首先构造状态转移方程
 
 上面的状态转移方程表示，当str[i]=str[j]时，如果str[i+1...j-1]是回文串，
 则str[i...j]也是回文串；如果str[i+1...j-1]不是回文串，则str[i...j]不是回文串。
 
 初始状态
 
 dp[i][i]=1
 dp[i][i+1]=1 if str[i]==str[i+1]
 上式的意义是单个字符，两个相同字符都是回文串。
 */

class Solution {
    func countSubstrings(_ s: String) -> Int {
        
        var strArr = Array(s)
        let length = strArr.count
        if strArr.count < 2 {return length}
        var dp = Array.init(repeating: Array.init(repeating: 0, count: length), count: length)
        var count = 0;
        for i in 0...length-1 {
            
            dp[i][i] = 1
            count += 1
            if i < length-1 {
                
                if strArr[i] == strArr[i+1] {
                    
                    dp[i][i+1] = 1
                    count += 1
                }
            }
        }
        //递推出以k 为长度的最大回文子串
        if strArr.count >= 3 {
            
            for k in 3...length {
                
                for j in 0...length {
                    
                    //子串的结束 位置。
                    let end = j + k - 1
                    //因为有这个判断，所以上面j不用 < strArr.count-1
                    if end > strArr.count-1 {
                        break
                    }
                    // 如果起始 和结束位置想等 且他们的子串也是回文，则本身也是回文
                    if  strArr[j] == strArr[end] && dp[j+1][end-1] == 1 {
                        
                        dp[j][end] = 1
                        count += 1
                        
                    }
                }
            }
        }
        return count
    }
}
