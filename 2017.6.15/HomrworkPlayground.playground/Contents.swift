//: Playground - noun: a place where people can play

import UIKit

max(4, 5)

func vendingMachine(cost : Double, amount : Double) -> [Int]{
    
    var change = Int(amount * 100 - cost * 100)
    
    let coins = [100,50,25,10,5,1]
    //var result : [Int] = [0,0,0,0,0,0]
    var result = [Int](repeatElement(0, count: coins.count))
    
    for i in 0..<coins.count{
        result[i] = change / coins[i]
        change = change % coins[i]
    }
    
    return result
    
}

vendingMachine(cost: 3.01, amount: 5.0)

//[4,0,0,0,0,1]

func maxInt(array : [Int]) -> Int?{
    if array.isEmpty{
        return nil
    }
    
    var max = array[0]
    for i in 1..<array.count{
        if array[i] > max{
            max = array[i]
        }
    }
    
    return max
}

maxInt(array: [-1,-2,-3,-4,-5,-6])

"abc"












