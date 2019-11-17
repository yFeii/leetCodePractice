//
//  ViewController.swift
//  516. Longest Palindromic Subsequence
//
//  Created by yFeii on 2019/8/24.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit
// https://blog.csdn.net/zzb5233/article/details/90547852

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let s = Solution()
        s.longestPalindromeSubseq("bbbab")
    }


}

/*
 分析
 对任意字符串，如果头和尾相同，那么它的最长回文子序列一定是去头去尾之后的部分的最长回文子序列加上头和尾。
 如果头和尾不同，那么它的最长回文子序列是去头的部分的最长回文子序列和去尾的部分的最长回文子序列的较长的那一个。
 
 str[0...n-1]是给定的字符串序列，长度为n，假设f(0,n-1)表示序列str[0...n-1]的最长回文子序列的长度。
 
 1.如果str的最后一个元素和第一个元素是相同的，则有：f(0,n-1)=f(1,n-2)+2；
 例如字符串序列“AABACACBA”；第一个元素和最后一个元素相同，其中f(1,n-2)表示红色部分的最长回文子序列的长度；
 
 2.如果str的最后一个元素和第一个元素是不相同的，
 则有：f(0,n-1)=max(f(1,n-1),f(0,n-2))；
 例如字符串序列“ABACACB”，其中f(1,n-1)表示去掉第一元素的子序列，f(0,n-2)表示去掉最后一个元素的子序列。
 
 设字符串为s，f(i,j)表示s[i..j]的最长回文子序列。
 状态转移方程如下：
 
 当i>j时，f(i,j)=0。
 当i=j时，f(i,j)=1。
 当i<j并且s[i]=s[j]时，f(i,j)=f(i+1,j-1)+2。
 当i<j并且s[i]≠s[j]时，f(i,j)=max( f(i,j-1), f(i+1,j) )。
 */


/*
 遍历方向，这里的第一层第二层指的是 for 的层数
 从左上角向右下方向填写：
 对应遍历方向第一层为为从左至右，第二层从右至左；第一个位置上的B与第二个位置上的B比较，然后第二个位置上的B与第三个位置上的A比较，
 接着是第一个位置上的B与第三个位置上的A比较，继续。。。
 
 从右下角向左上方向填写：
 对应遍历方向第一层是从右至左，第二层方向从左至右；倒数第二个位置上的A与倒数第一个位置上的B比较，然后是倒数第三个位置的C和倒数第二个位置的A比较，
 接着是倒数第三个位置的C和倒数第一个位置的B比较，继续。。。
 
 为什么是这个顺序，因为某个点依赖其子问题结果的数据分别是其左侧、下方、左下。所以迭代前必须确保其数据先计算。
 */

class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        
        let length = s.lengthOfBytes(using: .utf8)
        var dp = Array.init(repeating: Array.init(repeating: 0, count: length), count: length)
        let strArr = Array(s)
        //因为 dp[i][j] = dp[i+1][j-1]+2
        //即：i的值依赖i+1,所以这里 i要倒叙
        for i in (0...strArr.count-1).reversed() {
            dp[i][i] = 1
            if i+1 > strArr.count-1 {
                continue
            }
            for j in i+1...strArr.count-1 {
                
                if strArr[j] == strArr[i] {
                    
                    dp[i][j] = dp[i+1][j-1]+2
                }else{
                    dp[i][j] = max(dp[i+1][j],dp[i][j-1]);
                }
            }
        }
        return dp[0][length-1]
    }
}
