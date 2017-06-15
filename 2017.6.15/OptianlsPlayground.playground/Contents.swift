//: Playground - noun: a place where people can play

import UIKit

var num : Int? = Int("123a")
var num1 : Int? = Int("123")
var num2 : Int = Int("144")!
/*
num + num1

let textField : UITextView?
let label : UILabel?

label?.text = "hello" + textField?.text
*/

var arr : [Int]? = [1,2,3]
var arr2 : [Int] = []

if num1 != nil{
    arr2.append(num1!)
}

if let val = num1{
    arr2.append(val)
}

if let num1 = num1, let arr = arr, !arr2.isEmpty{
    arr2.append(num1)
}

arr2


func doSomething(str : String) -> Bool{
    guard let numValue = Double(str) else{
        return false
    }
    
    return numValue > 0
}

let st1 = "a,b,c"
let arr4 = st1.components(separatedBy: ",")

"1.3,4,58,a"

func solution(str : String?) -> Int{
    guard let str = str else {
        return 0
    }
    
    let strs = str.components(separatedBy: ",")
    var sum = 0
    
    for obj in strs{
        if Double(obj) != nil{
            sum += 1
        }
    }
    
    return sum
}

//solution(str: nil)
//solution(str: "")
//solution(str: "1")
solution(str: "1,2,f")


func findIndex(intArr : [Int], value : Int) -> Int?{
    
    for i in 0..<intArr.count{
        if intArr[i] == value{
            return i
        }
    }
    
    return nil
}



















