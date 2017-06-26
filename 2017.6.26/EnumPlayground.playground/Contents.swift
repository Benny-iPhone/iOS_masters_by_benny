//: Playground - noun: a place where people can play

import UIKit

enum AccessLimit {
    case admin
    case user, guest
    //case guest
    
    func name() -> String{
        return String(describing: self)
    }
}

var a1 = AccessLimit.admin
var a2 : AccessLimit = .guest
a1 = .user
a1.name()
AccessLimit.guest.name()

class User{
    var acl : AccessLimit?
}

let u1 = User()
u1.acl = .user



enum Day : Int{
    case sunday = 1
    case monday //= 10
    case tuesday
    case wednesday
    case thursday
    case friday
    case shabos
    
    func prevDay() -> Day{
        return Day(rawValue: self.rawValue - 1) ?? .shabos
    }
    
    func nextDay() -> Day{
        
        if let next = Day(rawValue: self.rawValue + 1){
            return next
        } else {
            return .sunday
        }
        
        //return Day(rawValue: self.rawValue + 1) ?? .sunday
    }
    
    func niceString() -> String{
        switch self {
        case .sunday: return "רבוטה"
        case .monday: return "לימודים"
        case .tuesday: return "לא נגמר"
        case .wednesday: return "מיותר"
        case .thursday: return "היום יום חמישי"
        case .friday: return "מחר שבת"
        case .shabos: return "שבת מנוחה"
        }
    }
    
}

Day.sunday.rawValue
var d1 = Day.monday
let d2 : Day? = Day(rawValue: 9)
let n = d2?.rawValue
Day.shabos.niceString()
d1.niceString()
d2?.niceString()


d1.nextDay().niceString()



Day.shabos.nextDay().prevDay()
















