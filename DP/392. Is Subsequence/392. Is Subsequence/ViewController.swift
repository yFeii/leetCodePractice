//
//  ViewController.swift
//  392. Is Subsequence
//
//  Created by yFeii on 2019/8/8.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution();
        s.isSubsequence("axc","ahbgdc")
    }


}

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        
        var s1 = s
        let length = s.count
        if length <= 0 {return true}
        var letter = s1.first
        var i = 0
        for c in t {
            
            if letter == c {
                i+=1
                if i >= length {return true}
                s1 = String(s1.suffix(length-i))
                letter = s1.first
            }
            print(c)
        }
        return false
    }
}
