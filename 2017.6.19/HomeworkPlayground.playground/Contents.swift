//: Playground - noun: a place where people can play

import UIKit

func sumEvens(arr : [Int]) -> Int{
    
    var sum = 0
    /*
    for i in 0..<arr.count{
        if arr[i] % 2 == 0{
            sum += 1
        }
    }*/
    
    for num in arr{
        if num % 2 == 0{
            sum += 1
        }
    }
    
    return sum
    
}

sumEvens(arr: [5,4,-2,-16,0])










func isPoli(array arr : [Int]) -> Bool{
    if arr.isEmpty || arr.count == 1{
        return true
    }
    
    var arr = arr
    let first = arr.removeFirst()
    let last = arr.removeLast()
    
    if first != last{
        return false
    }
    
    return isPoli(array: arr)
    
}







func d(_ a : Int,_ b : Int) -> Int{
    if a < b{
        return 0
    }
    
    return 1 + d(a - b, b)
}

d(13, 4)





















