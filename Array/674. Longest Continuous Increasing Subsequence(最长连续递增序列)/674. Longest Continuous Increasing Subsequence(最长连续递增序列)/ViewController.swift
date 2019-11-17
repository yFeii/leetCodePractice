//
//  ViewController.swift
//  674. Longest Continuous Increasing Subsequence(最长连续递增序列)
//
//  Created by yFeii on 2019/8/31.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        
    }

}
class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        
        if nums.count < 1 {
            
            return 0
        }
        
        var curMax = 1;
        if nums.count == 1 {
            return curMax
        }
        
        var res = 0
        for i in 1...nums.count-1 {
            
            let j = i-1;
            if nums[j] < nums[i] {
                
                curMax += 1
            }else{
                curMax = 1
            }
            res = max(curMax, res)
        }
        return res
    }
}
