//: Playground - noun: a place where people can play

import UIKit

var num : Int? = 1
let num1 = Int("abc")
let num2 = Int("1212")
let num3 = Int("1a")

let arr1 : [Int] = []
let num4 = arr1.first
let arr2 : [Int]? = nil

let count = arr2?.count
//let count1 = arr2 != nil ? arr2!.count : nil

if num != nil && num2 != nil{
    num! + num2!
}

if let value = num{
    print(value)
}

if let num = num{
    num
}

if let num = num, let num2 = num2, num > 0{
    num + num2
}

func countArray(_ arr : [Int]?) -> Int?{
    
    guard let arr = arr, !arr.isEmpty else {
        return nil
    }
    
    return arr.count
    
}

func second( arr : [Int]?) -> Int?{
    guard let arr = arr, arr.count > 1 else {
        return nil
    }
    
    return arr[2]
}

second(arr: nil)

var arr3 : [Int]? = nil

let count3 : Int = arr3?.count ?? 0
let count4 : Int = arr3?.count != nil ? arr3!.count : 0

arr3?.append(1)

//Dictionary
let person : [String:String] = [
    "first":"reuven",
    "last":"cohen",
    "middle":"j"
]


func fullName(from dict : [String:String]) -> String{
    
    return (dict["first"] ?? "") + " " + (dict["last"] ?? "")
    
    /*
    guard let firstname = dict["first"] else{
        return ""
    }
    
    guard let lastname = dict["last"] else{
        return ""
    }
    
    let fullname = firstname + " " + lastname
    return fullname*/
    
}
/*
fullName(from: person)

func fullName2(from dict : [String:String]) -> String{
    
    var arr : [String] = []
    if let val = dict["first"]{
        arr.append(val)
    }
    
    if let val = dict["middle"]{
        arr.append(val)
    }
    
    if let val = dict["last"]{
        arr.append(val)
    }
    
    return arr.joined(separator: " ")
}

fullName2(from: person)

person

var num = Int("avc") ?? 0

let myStr = String(15, radix: 2)
*/
/*
func binaryString(_ i : Int?) -> String?{
    guard let i = i else { //unwrap
        return nil
    }
    
    return String(i, radix: 2)
}

binaryString(Int("aaa"))
binaryString(9)

func binaryString2(_ i : Int?) -> String?{
    if let i = i{
        return String(i, radix: 2)
    } else {
        return nil
    }
}

func sum(a : String?, b : String?) -> Int?{
    guard let a = a, let b = b
        let n1 = Int(a), let n2 = Int(b) else {
        return nil
    }
    
    return n1 + n2
    
//    if let a = a,
//        let b = b,
//        let n1 = Int(a),
//        let n2 = Int(b){
//        return n1 + n2
//    }
//    
//    return nil
}

sum(a: "4", b: nil)
sum(a: "3", b: "2")
sum(a: "2", b: "a")
*/

func isValidSMSCode(_ s : String?) -> Bool{
    guard let s = s else {
        return false
    }
    
    guard s.characters.count == 4 else {
        return false
    }
    
    guard let _ = Int(s) else {
        return false
    }
    
    return true
}

isValidSMSCode(nil)
isValidSMSCode("123")
isValidSMSCode("as12")
isValidSMSCode("1234")

















