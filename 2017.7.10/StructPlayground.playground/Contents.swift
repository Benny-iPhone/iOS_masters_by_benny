//: Playground - noun: a place where people can play

import UIKit

struct Point{
    var x : Double = 0
    var y : Double = 0
    
    func distance(from point : Point) -> Double{
        let a = abs(self.x - point.x)
        let b = abs(self.y - point.y)
        
        return sqrt(pow(a, 2) + pow(b, 2))
    }
    
    mutating func right(){
        //self.x += 1
        self = Point(x: self.x + 1, y: self.y)
    }
}

var p3 = Point()
p3.right()
p3.x
var p1 = Point(x: 3, y: 4)
var p2 = Point()

let dist = p1.distance(from: p2)

class Person{
    var name : String
    init(name : String) {
        self.name = name
    }
}

var point1 = Point(x: 4, y: 5)
var person1 = Person(name: "benny")
person1.name = "Danny"
point1.x = -4

var point2 = point1
var person2 = person1

point2.x = 0
person2.name = "Shmuel"

person1.name
point1.x

var arr1 = [person1,Person(name: "")]
var arr2 = arr1

arr2[1].name = "a"
arr1[1].name

var arr3 = [1,2,3]
var arr4 = arr3
arr4[0] = -1
arr3[0]

let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
var rect = label1.frame
rect.origin.y += 100

let label2 = UILabel(frame: rect)














