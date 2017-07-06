//: Playground - noun: a place where people can play

import UIKit
/*
 Car: name, plateNumber, kilometraz, prodctionDate
 a method to return the car age
 */
class Person /*: NSObject*/{
    var name : String = ""
    
    init(name : String) {
        self.name = name
    }
    
    init() {
        name = ""
    }
    
//    var father : Person?
    
    func walk(){
        
    }
    
}


var p1 : Person = Person(name: "david")
p1.walk()
let p2 = Person()
var arr : [Person] = [p1,p2]
var p3 : Person?

class Student : Person{
    
}

let zeev = Student()
zeev.name

class Car{
    var name : String? = nil
    var plateNumber : String = ""
    var kilometraz : Int = 0
    var productionDate : Date = Date()
    
    func age() -> Int{
        let calendar = Calendar(identifier: .gregorian)
        let now = Date()
        let comps = calendar.dateComponents([.year], from: self.productionDate, to: now)
        
        return comps.year!
    }
    
    func setYear(_ year : Int){
        let calendar = Calendar(identifier: .gregorian)
        self.productionDate = calendar.date(bySetting: .year, value: year, of: self.productionDate)!
    }
}

let herby = Car()
herby.productionDate = Date(timeIntervalSince1970: 1057505544)

herby.age()
herby.setYear(2010)
herby.age()

let c3 = Car()
c3.productionDate
c3.setYear(2020)
c3.productionDate




















