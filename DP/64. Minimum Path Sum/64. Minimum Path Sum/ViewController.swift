//
//  ViewController.swift
//  64. Minimum Path Sum
//
//  Created by yFeii on 2019/8/10.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        let r = s.minPathSum([[1,2,5],[3,2,1]]);
    }


}


class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let x = grid.count-1
        let y = grid[0].count-1
        var cache = grid
        
        if x > 0{
            for i in 1...x {
                
                cache[i][0] = cache[i-1][0]+cache[i][0]
            }
        }

        if y > 0{
            for i in 1...y {
                cache[0][i] = cache[0][i-1]+cache[0][i]
            }
        }

        if x > 0{
            for i in 1...x{
                
                if y > 0{
                 
                    for j in 1...y {
                        
                        cache[i][j] = min(cache[i][j-1], cache[i-1][j])+cache[i][j]
                    }
                }
            }
        }

        return cache[x][y]
    }
}
