//: Playground - noun: a place where people can play

import UIKit

var dict1 : Dictionary<String,Int>/*[String:Int]*/ = [
    "benny":30,
    "zeev":31,
    "moran":21
]

let age1 = dict1["zeev"]
let age2 = dict1["yoav"]

dict1["root"] = 18
dict1

dict1["benny"] = 33

let t = (13,"king")
let t2 = (value : 12, name : "dama")
t.0
t2.name
t2.1

var str = ""  //key=value&key=value
for (key,val) in dict1{
    str += key + "=\(val)&"
}

for d in dict1{
    d.key
    d.value
}

let allKeys = Array(dict1.keys)
let allValues = Array(dict1.values)


var dict2 : [String:String] = [:]
dict2["itay"] = "sviri"
dict2["itay_"] = "feldman"
dict2["yakir"] = "raiby"

var counter = 0
for (key,val) in dict2{
    for ch in (key + val).characters{
        switch ch {
        case "a","A","e","E","i","I","o","O","u","U":
            counter += 1
        default:
            continue
        }
    }
}

counter


let person : [String:Any] = [
    "name":"John Doe",
    "age":40,
    "male":true
]

let name : String = person["name"] as? String ?? ""
let middelName : String? = person["middle_name"] as? String
let male = person["male"] as? String



func countAnysArray(_ arr : [Any]) -> Int{
    
    var sum = 0
    
    for i in 0..<arr.count{
        if let num = arr[i] as? Int{
            sum += num
        } else if let str = arr[i] as? String,
            let num = Int(str)
            {
            sum += num
        }
    }
    
    return sum
}

let sample : [Any] = [1,2,"3","4","a",UILabel()]
countAnysArray(sample)

let n : Int = 4
let n1 = n as? Double
Double(n)
let aa = Int(3.14)

/*
if let num = arr[0] as? Int{
    
}

if let st = arr[2] as? String, let num = Int(st){
    
}*/


func countDoubles(_ arr : [Any]) -> Double{
    var sum : Double = 0
    
    for n in arr{
        guard let d = n as? Double else {
            continue
        }
        
        sum += d
//        if let d = n as? Double{
//            sum += d
//        }
        
//        if n is Double{
//            sum += n as! Double
//        }
    }
    
    return sum
}

func sumInts(_ arr : [Any]) -> Int{
    var sum = 0
    
    for i in 0..<arr.count{
        if let num = arr[i] as? Int{
            sum += num
        } else if let subArr = arr[i] as? [Any]{
            sum += sumInts(subArr)
        }
    }
    return sum
}

let samp : [Any] = [1,2,3,[4,[5]],6]
sumInts(samp)





class Product{
    let id : Int
    let name : String?
    let price : Double
    let desc : String?
    
    init(_ dict : [String:Any]) {
        self.id = dict["id"] as! Int
        self.name = dict["name"] as? String
        self.price = dict["price"] as? Double ?? 0
        self.desc = dict["description"] as? String
    }
}

let d : [String:Any] = [
    "id":4,
    "name":"coffee",
    "price":6.0
]

let p = Product(d)



















