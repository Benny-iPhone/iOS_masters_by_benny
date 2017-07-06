//: Playground - noun: a place where people can play

import UIKit

class Chair{
    let legs : Int
    let date : Date
    
    init(legs : Int) {
        self.legs = legs
        date = Date() //now
    }
}

class MenuItem{
    let name : String
    let price : Double
    let desc : String?
    let currency : String
    
    init(_ dict : [String:Any]) {
        self.name = dict["name"] as? String ?? ""
        self.price = dict["price"] as? Double ?? 0
        self.desc = dict["desc"] as? String
        self.currency = dict["currency"] as? String ?? "$"
    }
    /*
    init(name : String, price : Double, desc : String, currency : String, currency : String = "$") {
        self.name = name
        self.price = price
        self.desc = desc
    }*/
}

let arr : [[String:Any]] = [
    ["name":"coffee","price":5.0,"desc":"latte"],
    ["name":"ice coffee","price":6.0,"currency":"¥"],
    ["name":"water","price":3.0,"desc":"minerals"],
]

var itemsArray : [MenuItem] = []
for dict in arr{
    let item = MenuItem(dict)
    itemsArray.append(item)
}

itemsArray


//let m1 = MenuItem(name: "Coffee", price: 5, desc: "Latte")
//let m2 = MenuItem(



class User {
    let firstName : String
    let lastName : String
    
    var fullName : String{
        get{
            return firstName + " " + lastName
        }
    }
    
    init (_ dict : [String:Any]){
        self.firstName = dict["first_name"] as? String ?? ""
        self.lastName = dict ["last_name"] as? String ?? ""
    }

}

let userDict : [String:Any] = ["first_name":"Itay", "last_name":"Sviri"]

let u : User = User (userDict)
u.fullName

class Square{
    var zela : Double
    
    var area : Double{
        get{
            return pow(zela, 2)
        }
        set{
            zela = sqrt(newValue)
        }
    }
    
    init(zela : Double = 0) {
        self.zela = zela
    }
    
    deinit {
        
    }
}


let s1 = Square()
let s2 = Square(zela: 5)
s2.area = 36
s2.zela

class Dog{
    let name : String
    let birthDate : Date
    
    init(name : String, birthDate : Date) {
        self.name = name
        self.birthDate = birthDate
    }
    
    convenience init(name : String) {
        self.init(name: name, birthDate: Date(timeIntervalSince1970: 0))
    }
    
    func bark(){
        
    }
}


let color = UIColor(red: 37.0/255.0, green: 98.0/255.0, blue: 196.0/255.0, alpha: 1)

//UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

let color2 = UIColor(red: 2, green: 20, blue: 51)
let color3 = UIColor(rgb: 0x1359d3) //hex

class Singleton{
    
    static let singleton = Singleton()
    
    private init() {
        //do init steps
    }
    
    func doSomething() {
        
    }
}


Singleton.singleton.doSomething()
//let ssss = Singleton()

class DBManager{
    
    static var shared = DBManager()
    
    func createNewUser() -> User?{
        return nil
    }
    
    func save(){
        
    }
    
    static func supportMultiThread() -> Bool{
        return true
    }
    
    class func fileExtention() -> String{
        return "sqlite"
    }
    
    class var maxHeight : Double{
        get{
            return 10_000
        }
    }
}

DBManager.maxHeight


DBManager.shared.createNewUser()
DBManager.shared.save()















