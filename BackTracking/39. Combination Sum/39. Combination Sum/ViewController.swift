//
//  ViewController.swift
//  39. Combination Sum
//
//  Created by yFeii on 2019/8/21.
//  Copyright © 2019 yFeii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = Solution()
        s.combinationSum([2,3,6,7],7)
    }


}

class Solution {
    
    var candidates1:[Int]!;
    var res:[[Int]]!;
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
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
      
        //
        for i in start...len {
            if residue - self.candidates1[i] < 0{
                // 优化添加的代码2：在循环的时候做判断，尽量避免系统栈的深度
                // residue - candidates[i] 表示下一轮的剩余，如果下一轮的剩余都小于 0 ，就没有必要进行后面的循环了
        
                break
            }
            stack.append(self.candidates1[i]);
            //对于每一个数（下一个剩余数），如果从0开始，则每次新的节点都从0开始，会有重复解，这里从i开始，剪枝
            dfs(residue - self.candidates1[i], i, &stack)
            stack.removeLast()
        }
        
    }
}
