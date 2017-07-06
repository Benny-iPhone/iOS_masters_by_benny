//: Playground - noun: a place where people can play

import UIKit

/*
 n - array size
 i - index in array 0..<n
 p - number of steps
 newIndex = (i + p) % n
 */
func solution(_ A : [Int], _ K : Int) -> [Int]{
    let n = A.count
    var B = [Int](repeatElement(0, count: n))
    
    for i in 0..<n{
        let newIndex = (i + K) % n
        B[newIndex] = A[i]
    }
    
    return B
}

var myArr = [1,2,3,4,5,6,7,8,9,10]
let steps = 1
solution(myArr, steps)










