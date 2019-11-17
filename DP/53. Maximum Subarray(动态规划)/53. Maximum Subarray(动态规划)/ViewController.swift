//
//  ViewController.swift
//  53. Maximum Subarray(动态规划)
//
//  Created by yFeii on 2019/7/30.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let s = Solution();
        let a = [-2,1,-3,4,-1,2,1,-5,4];
        s.maxSubArray3(a);
    }
    class Solution {
        
        func maxSubArray3(_ nums: [Int]) -> Int {

            var sumOfbeforeCurrentNum = nums[0]
            var maxN = nums[0]
            for num in nums{
                
                sumOfbeforeCurrentNum = max(num, sumOfbeforeCurrentNum+num)
                maxN = max(maxN, sumOfbeforeCurrentNum)
            }
            return maxN
            
        }
        func maxSubArray2(_ nums: [Int]) -> Int {
        
            var temp = nums[0];
            var maxN = temp
            if nums.count<=1 {return maxN};
            for i in 1...nums.count-1{
                
                let a = nums[i];
                if temp+a>a{
                    
                    maxN = max(maxN, a+temp);
                    temp = temp+a;
                }else{
                    
                    maxN = max(maxN,a,temp)
                    temp = a;
                }
            }
            return maxN;
        }
        
        //增益
        func maxSubArray1(_ nums: [Int]) -> Int {
        
            var ans = nums[0];
            var sum = 0;
            for num in nums {
                // if(sum > 0) { 可以写成这样
                if(sum + num > num ){
                    sum = sum + num;
                } else {
                    sum = num;
                }
                ans = max(ans, sum);
            };
            return ans;
        }
        
        
    
        
        //建表
        func maxSubArray(_ nums: [Int]) -> Int {
            let count = nums.count;
            var form = [Any](repeating: 0, count: count);
            var result = 0;
            if count>0 {result = nums[0]};
            for i in 0...nums.count-1 {
                var row = [Int](repeating: 0, count: count);
                row[i] = nums[i];
                for j in i...nums.count-1{
                    
                    let a = nums[j];
                    var lastSum = 0;
                    if (i != j){
                        if(row.count>j){
                            lastSum = row[j-1];
                        }
                    }
                    let r = a+lastSum;
                    row[j] = r;
                    result = max(result, r);
                }
                form[i] = row
            }
            return result;
        }
    }

}

