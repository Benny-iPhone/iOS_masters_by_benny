//: Playground - noun: a place where people can play

import UIKit

func doNothing(){
    
}

doNothing()

func giveMeNumber() -> Int{
    return 5
}


giveMeNumber()


func giveMeRandomNumber() -> Int{
    return Int(arc4random_uniform(10)) + 1
}

giveMeRandomNumber()

//
//Int(arc4random()) % 10 + 1
//      0...2^32
//Int: -2^31..<2^31
// 2^31<x<2^32

func multiNumber(_ num : Int) -> Int{
    return num * 2
}

multiNumber(4)

func multi(number num : Int) -> Int{
    return num * 2
}

multi(number: 5)

func multi(num : Int) -> Int{
    return num * 2
}

multi(num: 6)

func sum(a : Int, b : Int) -> Int{
    return a + b
}

sum(a: 3, b: 1)

func multiNumber2(_ num : Int, x : Int = 2) -> Int{
    return num * x
}

multiNumber2(4, x: 2)
multiNumber2(4)

func isBoom(_ num : Int, digit : Int /*1...9*/) -> Bool{
    
    if num % digit == 0{
        return true
    }
    
    var num = num
    while num != 0 {
        
        let d = num % 10
        if abs(d) == abs(digit){
            return true
        }
        
        num = num / 10
    }
    
    return false
}

isBoom(0, digit: 7)

func isBoomRecursive(_ num : Int, check : Bool = true) -> Bool{
    
    if check && num % 7 == 0{
        return true
    }
    
    if num == 0{
        return false
    }
    
    if abs(num % 10) == 7{
        return true
    }
    
    return isBoomRecursive(num / 10, check: false)
    
}

isBoomRecursive(0)


func pitagoras(a : Double, b : Double, c : Double) -> Bool{
    //return pow(a, 2) + pow(b, 2) == pow(c, 2)
    return sqrt(pow(a, 2) + pow(b, 2)) == c
}

pitagoras(a: 3, b: 4, c: 5)

func sumNumbers(_ numbers : Int...) -> Int{
    var sum = 0
    for n in numbers{
        sum += n
    }
    return sum
}

sumNumbers(1,2,3,4,5)
let str1 = String(format: "%.2f %d", 3.144,2)

let t = (4, "four")
t.0
t.1

enum CardKind{
    case spade, heart, diamond, leaf
}
let card = (value:13, name:"king", kind: CardKind.diamond)
card.name

func findBiggerIn(_ arr : [Int]) -> Int{
    var val = arr[0]
    for x in arr{
        val = max(x, val)
    }
    
    return val
}

findBiggerIn([-1,-2,-3])


/*
 1,1,2,3,5,8,13,21,34
 f(0) = 1
 f(1) = 1
 f(n) = f(n-1) + f(n-2)
 */

func fibo(_ i : UInt) -> UInt{
    switch i {
    case 0,1:
        return 1
    default:
        return fibo(i-1) + fibo(i-2)
    }
}

fibo(8)

func getCheckFunc(_ level : Int) -> ((Int) -> Bool){
    var targetGrade = 0
    switch level {
    case 4:
        targetGrade = 90
    case 3:
        targetGrade = 80
    case 2:
        targetGrade = 70
    default:
        targetGrade = 60
    }
    
    func checkFunc(_ g : Int) -> Bool{
        return g >= targetGrade
    }
    
    return checkFunc
}

let myFunc = getCheckFunc(2)
myFunc(81)
myFunc(63)



func orAction(_ b1 : Bool, _ b2 : Bool) -> Bool{
    return b1 || b2
}

func andAction(_ b1 : Bool, _ b2 : Bool) -> Bool{
    return b1 && b2
}

typealias Day = Int
let n : Day = 5

typealias BoolFunc = (Bool,Bool)-> Bool


func makeBinaryAction(_ b1 : Bool, _ b2 : Bool, f : BoolFunc) -> Bool{
    return f(b1,b2)
}

makeBinaryAction(true, false, f: andAction)


var arr : [Int] = [1,7,13,55,-100]

func mySortFunc(_ a : Int, _ b : Int) -> Bool{
    return a > b
}
//arr.sort(by: <#T##(Int, Int) -> Bool#>)
arr.sort(by: mySortFunc)
arr.sort { (a, b) -> Bool in
    return a < b
}

arr.sort {
    $0 < $1
}

let arr2 = arr.sorted()

func doSomething(_ n : Int){
    
}

let myNum = 5
doSomething(myNum)
doSomething(5)

//Timer.scheduledTimer(withTimeInterval: <#T##TimeInterval#>, repeats: <#T##Bool#>, block: <#T##(Timer) -> Void#>)
Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (timer) in
    //code will be executed after
}


//URLSession.shared.dataTask(with: <#T##URL#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)


func changeNum(_ num : inout Int){
    num = 5
}

var num1 = 4
changeNum(&num1)
num1

func mySwap(_ a : inout Int, _ b : inout Int){
    a = a + b
    b = a - b
    a = a - b
}

var nnum1 = 4
var nnum2 = -3
mySwap(&nnum1, &nnum2)
nnum1
nnum2





func solution(_ A : [Int]) -> Int{
    var result = 0
    for n in A{
        result ^= n //xor
    }
    
    return result
}

solution([10000,-2,3,-2,10000,3,3,4,3])
















