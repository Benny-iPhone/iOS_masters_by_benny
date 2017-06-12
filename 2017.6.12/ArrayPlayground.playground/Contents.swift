//: Playground - noun: a place where people can play

import UIKit


var arr1 : Array<Int> = [1,2,3]
var arr2 : [Int] = [1,2,3]
var arr3 = [1,2,3]

var twoDim : [[Int]] = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]

var emptyArray : [Int] = []
var arr4 = [Int](repeatElement(0, count: 5))

let arr5 : [Any] = [1,2,"hello",arr1]


let value = arr1[0]
arr1[0] = 4

emptyArray.append(33)
arr2.insert(9, at: 1)

arr2 += emptyArray

let oldValue = arr2.remove(at: 0)

var arr = [1,1,1]
arr[0...1] = [2,2]
arr

arr[0...0] = [3,4,5]
arr

arr[1...3] = []
arr

arr[0...1] = [9]
arr


for num in arr1{
    
}

for i in 0..<arr1.count{
    let num = arr1[i]
}




























