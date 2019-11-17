//
//  ViewController.swift
//  300. Longest Increasing Subsequence(最长上升子序列)
//
//  Created by yFeii on 2019/8/27.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        s.lengthOfLISDP([10,9,2,5,3,4])
    }


}

class Solution {
    
    /*
    最简单的方法是找到所有增加的子序列，然后返回最长增加的子序列的最大长度。为了做到这一点，我们使用递归函数 \text length of lislengthoflis 返回从当前元素（对应于 curposcurpos）开始可能的 lis 长度（包括当前元素）。在每个函数调用中，我们考虑两种情况：
    
    当前元素大于包含在 lis 中的前一个元素。在这种情况下，我们可以在 lis 中包含当前元素。因此，我们通过将其包含在内，得出了 lis 的长度。此外，我们还通过不在 lis 中包含当前元素来找出 lis 的长度。因此，当前函数调用返回的值是两个长度中的最大值。
    当前元素小于包含在 lis 中的前一个元素。在这种情况下，我们不能在 lis 中包含当前元素。因此，我们只通过不在 lis 中包含当前元素（由当前函数调用返回）来确定 lis 的长度。
     */
    //递归解法
    func lengthOfLIS(_ nums: [Int]) -> Int {
        
        return recursion(nums, Int(INT8_MIN), 0)
    }

    //返回从当前元素（对应于 curposcurpos）开始可能的 lis 长度（包括当前元素）
    func recursion(_ nums: [Int], _ pre:Int ,_ currentIndex:Int) -> Int {
        
        if currentIndex == nums.count {
            
            return 0
        }
        var take = 0
        //如果当前的数大于前一个数
        if nums[currentIndex] > pre {
            //则 当前长度 = 1(加上当前数) + 下一个数的升序长度
            take = 1 + recursion(nums, nums[currentIndex], currentIndex+1)
        }
        let notTake = recursion(nums, pre, currentIndex+1)
        return max(take, notTake)
    }
    
    //递归解法+备忘录
    
//    func lengthOfLISMOM(_ nums: [Int]) -> Int {
//
//        let mom = Array.init(repeating: 0, count: <#T##Int#>)
//        return recursion(nums, Int(INT8_MIN), 0)
//    }
//
//    func recursion(_ nums: [Int], _ pre:Int ,_ currentIndex:Int) -> Int {
//
//        if currentIndex == nums.count {
//
//            return 0
//        }
//        var take = 0
//        if nums[currentIndex] > pre {
//            take = 1 + recursion(nums, nums[currentIndex], currentIndex+1)
//        }
//        let notTake = recursion(nums, pre, currentIndex+1)
//        return max(take, notTake)
//    }
    
    //动态规划
    
    func lengthOfLISDP(_ nums: [Int]) -> Int {

        //dp[i] 表示以 nums[i] 这个数结尾的最长递增子序列的长度。
        //为什么dp[i]不能代表到[i]为止最长递增子序列？因为dp[i]跟dp[i-1]是没有递推关系的。
        //也就是说，当前数字的最大值并不是由前一个递推出来，而是有前面所有的最大值比较之后得出
        var dp = Array.init(repeating: 1, count: nums.count)
        if  nums.count < 1 {
            
            return 0
        }
        for i in 0...nums.count-1 {
            
            if i > 0 {
                for j in 0...i-1{
                    
                    //如果前面的数（nums[j] ）比 nums[i] 小，说明可以组成升序序列，所以 要比较 dp[i] 与dp[j]+1的大小
                    if nums[j] < nums[i] {
                        //dp[i] = max(dp[i] ，)
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

}
