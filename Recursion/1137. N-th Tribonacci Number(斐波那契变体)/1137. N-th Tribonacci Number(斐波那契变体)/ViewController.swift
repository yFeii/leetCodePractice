//
//  ViewController.swift
//  1137. N-th Tribonacci Number(斐波那契变体)
//
//  Created by yFeii on 2019/9/15.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

/*
 
 The Tribonacci sequence Tn is defined as follows:
 
 T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0.
 
 Given n, return the value of Tn.
 
 斐波那契数列
 */

class Solution {
    var res = 0
    //递归  n = 1+2+3+...n，理解错题意了
    func tribonacci1(_ n: Int) -> Int {
        
        if n == 0 {return 0}
        if n == 1 {return 1}
        let lastV = tribonacci(n-1)
        res += lastV
        return res
    }
    //递归 超时
    func tribonacci2(_ n: Int) -> Int {
        
        if n == 0 {return 0}
        if n == 1 {return 1}
        if n == 2 {return 1}
        
        return tribonacci2(n-1) + tribonacci2(n-2) + tribonacci2(n-3)
        
    }
    
    //伪动态规划，记录3前三个值
    func tribonacci(_ n: Int) -> Int {

        if n == 0 {return 0}
        if n == 1 {return 1}
        if n == 2 {return 1}

        var a = 0
        var b = 1
        var c = 1
        var res = 0;
        for _ in 3...n {
            
            res = a + b + c
            a = b
            b = c
            c = res;
        }
        return res
    }
}
