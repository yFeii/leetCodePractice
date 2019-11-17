//
//  ViewController.swift
//  5. Longest Palindromic Substring
//
//  Created by yFeii on 2019/8/25.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arr : Array<[AnyHashable:Any]>!{
        didSet {
            
            print("didSet")
            print(arr)
            print(oldValue)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        arr = Array<[AnyHashable:Any]>.init()
        // Do any additional setup after loading the view.
        let s = Solution()
        s.longestPalindrome("abcda")
        
        var model = ["name":1]
        arr.append(model)
                
        
    }


}

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
    func longestPalindrome(_ s: String) -> String {
        
        
        let strArr = Array(s)
        if strArr.count < 2 {return s}
        var dp = Array.init(repeating: Array.init(repeating: 0, count: strArr.count), count: strArr.count)

        var start = 0;
        var length = 1
        for i in 0...strArr.count-1 {
            dp[i][i] = 1
            if i < strArr.count-1 {
                if strArr[i] == strArr[i+1] {
                    dp[i][i+1] = 1
                    start = i
                    length = 2
                }
            }
            
        }
        //递推出以k 为长度的最大回文子串
        if strArr.count >= 3 {
            for k in (3...strArr.count) {
                
                for i in 0...strArr.count {
                    
                    let j = i+k-1;
                    //子串的结束 位置。
                    if j > strArr.count-1 {
                        break
                    }
                    if strArr[i] == strArr[j] && dp[i+1][j-1] == 1{
                        
                        dp[i][j] = 1
                        start = i
                        length = k
                        
                    }
                }
            }
        }
        let index1 = s.index(s.startIndex, offsetBy: start)
        let index2 = s.index(s.startIndex, offsetBy: start+length-1)

        let res = String(s[index1...index2])
        return res
        
    }
}
