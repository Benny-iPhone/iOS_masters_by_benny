//: Playground - noun: a place where people can play

import UIKit

class Person{
    let firstName : String
    let middleName : String?
    let lastName : String
    let age : Int
    
    init(_ dict : [String:Any]) {
        self.firstName = dict["first_name"] as? String ?? ""
        self.middleName = dict["middle_name"] as? String
        self.lastName = dict["last_name"] as? String ?? ""
        self.age = dict["age"] as? Int ?? 0
    }
    
    func fullname() -> String{
        var arr : [String] = []
        if firstName.isEmpty == false{
            arr.append(firstName)
        }
        
        if let middleName = middleName,
            middleName.isEmpty == false{
            arr.append(middleName)
        }
        
        if lastName.isEmpty == false{
            arr.append(lastName)
        }
        
        if age != 0{
            arr.append("\(age) years old")
        }
        
        return arr.joined(separator: " ")
    }
}

let num = 10_000_000

let pDict : [String:Any] = [
    "first_name":"David",
    "middle_name":"",
    "last_name":"The King",
    "age":1_049
]

let david = Person(pDict)
david.firstName

david.fullname()








