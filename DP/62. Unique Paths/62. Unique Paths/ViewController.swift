//
//  ViewController.swift
//  62. Unique Paths
//
//  Created by yFeii on 2019/8/9.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let s = Solution()
//        let r = s.uniquePaths(19, 13)
//        let r2 = s.uniquePaths1(19, 13)
//        let r1 = s.recursion(19, 13)
        let n = s.uniquePathsWithObstacles1([
            [0],
            [0],
            [0]
            ])
        print(n)
    }
    
}

class Solution {
    
    
    func uniquePathsWithObstacles1(_ obstacleGrid: [[Int]]) -> Int {
        
        var result = obstacleGrid
       
        let x = result.count-1
        let y = result[0].count-1
        if (obstacleGrid[0][0] == 1) {
            return 0;
        }

        result[0][0] = 1
        if x >= 1 {
            for i in 1...x{
                if(result[i][0] == 1){
                    result[i][0] = 0
                }else{
                    result[i][0] = result[i-1][0]
                }
            }
        }

        if y >= 1 {
            for i in 1...y{
                
                if (result[0][i] == 1){
                    result[0][i] = 0
                }else{
                    result[0][i] = result[0][i-1]
                }
            }
        }
       
        if x >= 1 {

        for i in 1...x {
            if y >= 1 {

            for j in 1...y{
                
                if result[i][j] == 1 {
                    result[i][j] = 0
                }else{
                    result[i][j] = result[i][j-1]+result[i-1][j]
                }
            }
            }
        }
        }
        return result[x][y]
    }
    
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        
        var result = obstacleGrid
        var x = 0
        var y = 0
        for i in 0...result.count-1 {
            
            let row = result[i]
            for j in 0...row.count-1 {
                
                var c = 0;
                var a = 0
                if j > 0{
                    
                    a = result[i][j-1]
                }
                
                var b = 0
                if i > 0 {
                    
                    b = result[i-1][j]
                }
                c = a + b
                //(0,0)坐标要补1，
                if a == 0 && b == 0 && i == 0 && j == 0 {
                    c = 1
                }
                if obstacleGrid[i][j] == 1{
                    c = 0
                }
                result[i][j] = c
                y = j
            }
            x = i
        }
    
        return result[x][y]
    }
    
    func recursion(_ m: Int, _ n: Int) -> Int {

        if(m <= 0 || n <= 0){
        return 0;
        }else if(m == 1  || n == 1){//只能一直向右走或者一直向下走，所以路径数为 1
        return 1;
        }else if(m == 2 && n == 2){
        return 2;
        }else if((m == 3 && n == 2) || (m == 2 && n == 3)){

            return 3;
            
        }
        var path = 0
         path += recursion(m-1,n)
         path += recursion(m,n-1)

        return path
    }
    func uniquePaths(_ m: Int, _ n: Int) -> Int {

        var res = Array.init(repeating: [0], count: m+1)
        let row0 = Array.init(repeating: 0, count: n+1);
        res[0] = row0
        for i in 1...m{
            
            var row = Array.init(repeating: 0, count: n+1);
            var lastRow = res[i-1];
            for j in 1...n{
                
                var c = lastRow[j]+row[j-1];
                if i == 1 && j == 1{
                    c = 1
                }
                row[j] = c

                if j == n && i == m {return c}
            }
            res[i] = row;
        }
        return 0
    }
    
    //动态规划
    func uniquePaths1(_ m: Int, _ n: Int) -> Int {
        
        
        var result = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        var x = 0
        var y = 0
        for i in 1...m {
            
            for j in 1...n {
                
                var a = 0;
                if j > 0{
                    a = result[i][j-1]
                }
                
                var b = 0;
                if i > 0{
                    b = result[i-1][j]
                }
                result[i][j] = a + b
                y = j
            }
            x = i
        }
        
        return result[x][y]
    }
    
}

