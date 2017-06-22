//: Playground - noun: a place where people can play

import UIKit

func binaryGap(_ n : Int) -> Int{
    
    let str = String(n, radix: 2)
    
    var maxCount = 0
    var count = 0
    var shouldSum = false
    
    for ch in str.characters{
        if ch == "0"{
            if shouldSum{
                count += 1
            }
            
        } else if ch == "1"{
            shouldSum = true
            if count > maxCount{
                maxCount = count
            }
            
            count = 0
        }
    }
    
    return maxCount
}


binaryGap(529)
binaryGap(17)











