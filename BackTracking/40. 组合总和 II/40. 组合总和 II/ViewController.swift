//
//  ViewController.swift
//  40. 组合总和 II
//
//  Created by yFeii on 2019/8/22.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let s = Solution()
        s.combinationSum2([1,2],3)
    }
}

class Solution {
    
    var candidates1:[Int]!;
    var res:[[Int]]!;
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        self.res = Array<Array<Int>>.init()
        // 优化添加的代码1：先对数组排序，可以提前终止判断
        self.candidates1 = candidates.sorted()
        var newStack = Array<Int>.init()
        dfs(target, 0, &newStack)
        return self.res
    }
    
    func dfs(_ residue:Int, _ start :Int,_ stack:inout [Int])  {

        if residue == 0{
            let newArr = Array<Int>.init(stack)
            self.res.append(newArr)
            //放入解集
            return
        }
        let len = self.candidates1.count-1
        
        if start > len {return}
        for i in start...len {

            if residue - self.candidates1[i] < 0  {
                // 优化添加的代码2：在循环的时候做判断，尽量避免系统栈的深度
                // residue - candidates[i] 表示下一轮的剩余，如果下一轮的剩余都小于 0 ，就没有必要进行后面的循环了
                
                break
            }
            if i > start {
                //首先，判断重复的条件一定是 v[i] = v[i-1]，而不是v[i] = v[i+1]，后者会跳过第一个轮的解
                //其次看前置条件（这句话什么时候该生效。）
                //所以跳过的条件为 前后两个值相等 && 在解集数组的位置也相同。
                // i > start 表明剪枝的分支一定不是当前层的第 1 个分支 ，如果当前选的数和前一个分支选的数一样，就得剪枝
                if (self.candidates1[i] == self.candidates1[i-1]) {
                    continue
                }
            }
            
            stack.append(self.candidates1[i]);
            //对于每一个数（下一个剩余数），如果从0开始，则每次新的节点都从0开始，会有重复解，这里从i开始，剪枝
            dfs(residue - self.candidates1[i], i+1, &stack)
            stack.removeLast()
        }
        
    }
}

