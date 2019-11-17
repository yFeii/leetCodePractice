//
//  ViewController.swift
//  303. Range Sum Query - Immutable
//
//  Created by yFeii on 2019/8/6.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let n = NumArray.init( [])
        let r = n.sumRange(2, 5)
        print(r)
    }


}


class NumArray {
    
    var sumCache = [0]
    var cache = [0]
    init(_ nums: [Int]) {
        
        cache = nums;
        sumCache = Array.init(repeating: 0, count: nums.count)
        var sum = 0
        if nums.count == 0 {return}
        for i in 0...nums.count-1{
            
            let curNum = nums[i]
            sum += curNum
            sumCache[i] = sum
        }
    }
    
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        
        if cache.count == 0 {return 0}

        let iv = sumCache[i]
        let jv = sumCache[j]
        return jv - iv + cache[i]
    }
}
