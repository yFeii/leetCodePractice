//
//  AppDelegate.swift
//  801. Minimum Swaps To Make Sequences Increasing（使序列递增的最小交换次数）
//
//  Created by yFeii on 2019/9/23.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let s = Solution.init()
         s.minSwap([1,3,5,4],[1,2,3,7])
        return true
    }

    // MARK: UISceneSession Lifecycle

  


}


/*
 我们有两个长度相等且不为空的整型数组 A 和 B 。
 我们可以交换 A[i] 和 B[i] 的元素。 注意这两个元素在各自的序列中应该处于相同的位置。
 在交换过一些元素之后，数组 A 和 B 都应该是严格递增的
 （数组严格递增的条件仅为A[0] < A[1] < A[2] < ... < A[A.length - 1]）。

 给定数组 A 和 B ，请返回使得两个数组均保持严格递增状态的最小交换次数。
 假设给定的输入总是有效的。

 因为题目限制 一定可组成 递增的数组，所以 两个数组第i个元素，
 则两数组的第i个元素一定满足如下条件，
 b1 = (A[i] > A[i-1] && B[i] > B[i-1])        A和B的第i个元素和i-1呈递增
 b2 = (A[i] > B[i-1] && B[i] > A[i-1])        A和B 的前一个元素呈递增&&B和A 的前一个元素呈递增

 当 b1&&b2 说明 两数组都是递增，则
 no_swap = min(swap, no_swap) //如果不换，就取最小值
 swap = no_swap + 1           //如果换，就取做小情况的+1，因为跟前一个的最小值有关

 如果只满足 b1  说明 存在A数组内的第A[i-1]>=B[i]或者B[i-1]>=A[i]
 这种情况下如果交换 当前A[i],B[i],则A[i-1]和B[i-1]也要换，
 才能继续组成递增关系，这样否则这个数组不合法（违背题意）
 swap = swap + 1
 //no_swap 不变

 如果只满足 b2  说明 存在A数组内的不成递增关系
 如果第 i 个元素交换，那么第 i - 1 个元素一定是没有交换的；
 change[ i ]=noChange[ i - 1 ] +1
 swap = no_swap + 1

 如果第 i 个元素没有交换，那么第 i - 1个元素一定是交换的。
 noChange[ i ]=change[ i - 1 ]。
  
 let t = swap
 swap = no_swap + 1
 no_swap = t
 */


/*


 对于任意的第 i 个元素（i>0），最终的元素排列有两种情况，（1）A[ i ]>A[ i - 1 ] && B[ i ]>B[ i - 1 ]；（2）A[ i ]>B[ i - 1 ] && B[ i ]>A[ i - 1 ]。由题目描述可知这两种情况至少有一种成立，也可以均成立。

 对于情况（1），如果第 i 个元素交换，那么第 i - 1 个元素一定是交换的；如果第 i 个元素没有交换，那么第 i - 1个元素一定没有交换。由此可以得到：change[ i ]=change[ i - 1 ]+1，noChange[ i ]=noChange[ i - 1 ]；

 对于情况（2），如果第 i 个元素交换，那么第 i - 1 个元素一定是没有交换的；如果第 i 个元素没有交换，那么第 i - 1个元素一定是交换的。由此可以得到：change[ i ]=noChange[ i - 1 ] +1，noChange[ i ]=change[ i - 1 ]。
 两种情况均成立时取较小值。


 */
class Solution {
    func minSwap(_ A: [Int], _ B: [Int]) -> Int {
        
        var swap = 1
        var no_swap = 0
        
        for i in 1...A.count-1 {
                       
            let b1 = (A[i] > A[i-1] && B[i] > B[i-1])
            let b2 = (A[i] > B[i-1] && B[i] > A[i-1])

            if b1 && b2 {
                // 两种情况均成立时取较小值。
                no_swap = min(swap, no_swap)
                // 选择交换 就用最小值 + 这次交换
                swap = no_swap + 1
            }else if (b1){
                //如果第 i 个元素交换，那么第 i - 1 个元素一定是交换的；
                //如果第 i 个元素没有交换，那么第 i - 1个元素一定没有交换。
                //由此可以得到：
                //change[ i ]=change[ i - 1 ]+1，
                //noChange[ i ]=noChange[ i - 1 ]；
                //no_swap 不变
                swap = swap + 1
            }else if (b2){
                
                //如果第 i 个元素交换，那么第 i - 1 个元素一定是没有交换的；
                //如果第 i 个元素没有交换，那么第 i - 1个元素一定是交换的。
                //由此可以得到：
                //change[ i ]=noChange[ i - 1 ] +1，
                //noChange[ i ]=change[ i - 1 ]。
                let t = swap
                swap = no_swap + 1
                no_swap = t
            }
        }
        return min(swap, no_swap)
    }
    
}
