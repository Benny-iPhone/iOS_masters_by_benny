//: Playground - noun: a place where people can play

import UIKit
/*
var str : String = "Hello, playground"
let str1 = "b"
let c1 : Character = "a"
let c2 : Character = "+"
let c3 : Character = "א"
let c4 : Character = "\u{1f42}"
let c5 : Character = "\u{1f42a}"
let c6 : Character = "\u{1f600}"

str.isEmpty
str.lowercased()
str.uppercased()
str.characters.count

for i in 0..<str.characters.count{
    let ch = str[index(str.startIndex, offsetBy: i)]
}

for ch in str{
    
}


let num = 5

switch num {
case 0:
    print("zero")
case 1,2:
    print("1 or 2")
case 100...200:
    print("100 to 200")
case Int.min..<0:
    print("negative")
default:
    break
}


*/
func countVowels(_ str : String) -> Int{
    var sum = 0
    
    for ch in str.characters{//.lowercased(){
        switch ch {
        case "a","A","e","E","i","I","o","O","u","U":
            sum += 1
        default:
            continue
        }
    }
    
    return sum
}

countVowels("AbcE")


//binary gap
let myStr = String(4, radix: 2)
let myStr1 = String(529, radix: 2)








