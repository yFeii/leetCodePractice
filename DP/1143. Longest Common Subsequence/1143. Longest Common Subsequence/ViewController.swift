//
//  ViewController.swift
//  1143. Longest Common Subsequence
//
//  Created by yFeii on 2019/8/23.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        s.longestCommonSubsequence("abcde"
            ,"ace")
    }
}

//最长公共子序列及其应用
// Longest Common Subsequence（LCS）

class Solution {
    func longestCommonSubsequence1(_ text1: String, _ text2: String) -> Int {
     
        var x = text1.lengthOfBytes(using: .utf8)
        if x <= 0 {return 0}
        x+=1
        let y = text2.lengthOfBytes(using: .utf8)+1
        //+1为空出0区
        var dp = Array.init(repeating: Array.init(repeating: 0, count: y), count: x)
        
        //因为遍历为已X 为基准:x=1, y=1  x=1,y=2,所以建表要Y为二维数组子数组。
        for i in 1...x-1 {
            if y <= 1 {return 0}
            for j in 1...y-1 {
                // 要从首字母比较所以要减1
                let indexA = text1.index(text1.startIndex, offsetBy: i-1)
                let indexB = text2.index(text2.startIndex, offsetBy: j-1)
                let a = text1[indexA]
                let b = text2[indexB]
                //当我们扫描到text1的第i个字符，text2的第j个字符时，需要考虑这两个字符是否相等，如果这两个字符相等
                //计算出的结果应该是text1的前i−1和text2的前j−1个计算出的最长子字符串的长度加1，即：
                //dp[i][j]=dp[i−1][j−1]+1
                //当两个字符不相等时，我们就需要考虑
                //dp[i - 1][j] 以及dp[i][j−1]
                //因为当前的两个字符已经不相等了，所以我们没有办法在原有的基础上更进一步，
                //只能在dp[i−1][j] 以及dp[i][j−1]中选择一个最大值，
                //即：dp[i][j]=max(dp[i−1][j],dp[i][j−1])
                if a == b {
                    dp[i][j] = dp[i-1][j-1]+1
                }else {
                    dp[i][j]=max(dp[i-1][j],dp[i][j-1])
                }
            }
        }
        return dp[x-1][y-1]
    }
    
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text1.count == 0 || text2.count == 0 { return 0 }
        //字符串转数组。节省字符串截取花费的时间
        let s1 = Array(text1)
        let s2 = Array(text2)

        var dp = Array.init(repeating: Array.init(repeating: 0, count: s2.count+1), count: s1.count+1)
        //因为遍历为已X 为基准:x=1, y=1  x=1,y=2,所以建表要Y为二维数组子数组。
        for i in 1...s1.count {
            
            for j in 1...s2.count {
                
                //当我们扫描到text1的第i个字符，text2的第j个字符时，需要考虑这两个字符是否相等，如果这两个字符相等
                //计算出的结果应该是text1的前i−1和text2的前j−1个计算出的最长子字符串的长度加1，即：
                //dp[i][j]=dp[i−1][j−1]+1
                //当两个字符不相等时，我们就需要考虑
                //dp[i - 1][j] 以及dp[i][j−1]
                //因为当前的两个字符已经不相等了，所以我们没有办法在原有的基础上更进一步，
                //只能在dp[i−1][j] 以及dp[i][j−1]中选择一个最大值，
                //即：dp[i][j]=max(dp[i−1][j],dp[i][j−1])
                
                if s1[i-1] == s2[j-1] {
                    
                    dp[i][j] = dp[i-1][j-1]+1

                }else{
                    dp[i][j]=max(dp[i-1][j],dp[i][j-1])
                }
            }
        }
        return dp[s1.count][s2.count]
    }
}
