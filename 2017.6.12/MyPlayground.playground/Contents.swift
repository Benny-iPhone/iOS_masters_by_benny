//: Playground - noun: a place where people can play

import UIKit
/*
var str = "Hello, playground"

let a = 3
var b = 4
a + b

b = 5
//a = 2
//b = 4.0

var c : Int = 6
var d : Double = 3
let e : UInt8 = 50

//let ee = Double(e)
let f = d + Double(e)// ee



//let r : UInt32 = arc4random()
//let x = Int32(r)


var num1 = 3
var num2 = 2

num2 - num1
num2 / num1
num2 % num1
num1 * num2




print("something")


for i in 1...10{
    
}

for i in 1..<10{
    
}

for i in stride(from: 1, to: 100, by: 3){
    print(i)
}

for i in stride(from: 100, to: 1, by: -1){
    
}

var n = 1
while n == 1{
    
}


if num1 > 0{
    print("\(num1) is bigger than 0")
} else {
    
}
*/
/*
 * 7 BOOM
 */

var sum = 0

for i in 1...999{
    if i % 7 == 0{
        sum += 1
        continue
    }
    
    var num = i
    
    while num != 0{
        let d = num % 10
        if d == 7{
            sum += 1
            num = 0
        }
        
        num /= 10 // num = num / 10
    }
 
    /*
    let d1 = i % 10
    let d2 = i / 10
    
    if d1 == 7 || d2 == 7{
        sum += 1
    }*/
}

sum












