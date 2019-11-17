//
//  ViewController.swift
//  120. Triangle
//
//  Created by yFeii on 2019/8/11.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let s = Solution()
        let r = s.minimumTotal([[-1],[2,3],[1,-1,-3]])
    }

}
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        
        var rt = triangle
        for i in 0...triangle.count-1{
            
            let arr = triangle[i]
            var lastRowMin = 0;
            for j in 0...arr.count-1{
                
                var ll = 0
                if j == 0{
                    if i == 0 {
                        rt[i][j] = triangle[i][j]
                    }else{
                        rt[i][j] = rt[i-1][j]+triangle[i][j]
                    }
                    lastRowMin = rt[i][j];
                }else if j == arr.count-1 {
                    rt[i][j] = rt[i-1][j-1]+triangle[i][j]
                }else{
                    rt[i][j] = min(rt[i-1][j-1],rt[i-1][j])+triangle[i][j]
                }
                lastRowMin = min(lastRowMin, rt[i][j]);
                if i == triangle.count-1 && j == arr.count-1 {
                    return lastRowMin
                }
            }
        }
        return 1;
    }
}

