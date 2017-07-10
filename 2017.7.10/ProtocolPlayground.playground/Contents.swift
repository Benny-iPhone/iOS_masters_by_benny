//: Playground - noun: a place where people can play

import UIKit
/*
protocol MyProtocol{
    func doSomething()
}
*/

protocol PizzaDelegate{
    func pizzaDidFinish(_ pizza : Pizza)
}

class Pizza{
    var slices : Int = 8
    var delegate : PizzaDelegate?
    
    func eatSlice(){
        guard slices > 0 else {
            return
        }
        
        slices -= 1
        
        if slices == 0{
            delegate?.pizzaDidFinish(self)
        }
    }
}

class Person{
    let name : String
    
    init(name : String) {
        self.name = name
    }
}

class Counter : Person, PizzaDelegate{
    func pizzaDidFinish(_ pizza: Pizza) {
        print(name + " making new pizza")
    }
    
}

class Bot : NSObject, PizzaDelegate{
    func pizzaDidFinish(_ pizza: Pizza) {
        
    }
}

let piz = Pizza()
let yossi = Counter(name: "yossi")
piz.delegate = yossi

for _ in 0..<8{
    piz.eatSlice()
}

piz.slices















