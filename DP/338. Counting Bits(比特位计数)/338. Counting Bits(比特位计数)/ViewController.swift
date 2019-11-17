//
//  ViewController.swift
//  338. Counting Bits(比特位计数)
//
//  Created by yFeii on 2019/9/2.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        s.countBits(3)
    }


}

/*
 
 给定一个非负整数 num。对于 0 ≤ i ≤ num 范围中的每个数字 i ，计算其二进制数中的 1 的数目并将它们作为数组返回。
 
 对于求解一个十进制数转化为二进制时里面1的个数，可以先看一下概况：
 
 十进制数　　　　　　　　二进制数　　　　　　　　1的个数
 
 　　　　1　　　　　　　　　　　　1　　　　　　　　　　   1
 
 　　　　2　　　　　　　　　　　　10　　　　　　　　　　 1
 
 　　　　3　　　　　　　　　　　　11　　　　　　　　　　  2
 
 　　　　4　　　　　　　　　　　　100　　　　　　　　　　1
 
 　　　　5　　　　　　　　　　　　101　　　　　　　　　　 2
 
 　　　　6　　　　　　　　　　　　110　　　　　　　　　　  2
 
 　　　　7　　　　　　　　　　　　111　　　　　　　　　　  3
 
 
 
 看上面的一系列数字的二进制中1的个数：
 
 对于一个偶数 n ；其二进制组成最低位为0，所以其1的位数就是除了最低位之外前面那一部分中1的位数，即是i/2中1的位数。
 
 对于一个奇数n，其末位的数一定是1，那么对于n-1，一定是个偶数，并且只需要将n-1的末位0改成1就可以变成 n，因为   a[n] = a[n - 1] +1
 */

class Solution {
    func countBits(_ num: Int) -> [Int] {
        
        var dp = Array.init(repeating: 0, count: num+1);
        //初始化dp初始值
        if num < 1 {
            return [0]
        }
        if num >= 1 {
            dp[0] = 0
            dp[1] = 1
        }
        if num >= 2 {
            dp[2] = 1
        }
        if num >= 3 {
            for i in 3...num {
                //看奇数还是偶数，套用递推公式
                if i%2 == 0 {
                    dp[i] = dp[i/2]
                }else{
                    dp[i] = dp[i-1]+1
                }
            }
        }
        return dp
    }
}

