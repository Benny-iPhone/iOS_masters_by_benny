//: Playground - noun: a place where people can play

import UIKit

let date1 = Date(timeIntervalSince1970: 1498494121)
let now = Date()
let date2 = Date(timeIntervalSinceNow: -86_400) //yesterday
let date3 = Date(timeIntervalSince1970: 1487002868)
let calendar = Calendar.current
calendar.component(.weekday, from: now)
calendar.component(.day, from: now)

let comps : DateComponents = calendar.dateComponents([.day,.month,.year], from: date3)

comps.year
comps.month
comps.day
comps.weekday


func isFriday13th(_ date : Date) -> Bool{
    let comps : DateComponents = Calendar.current.dateComponents([.weekday, .day], from: date)
    
    return comps.weekday == 6 && comps.day == 13
}

extension Date{
    func isFriday13th() -> Bool{
        let comps : DateComponents = Calendar.current.dateComponents([.weekday, .day], from: self)
        
        return comps.weekday == 6 && comps.day == 13
    }
    
    func isShabbatRoshHodesh() -> Bool{
        
        let cal = Calendar(identifier: .hebrew)
        let comps = cal.dateComponents([.weekday, .day], from: self)
        
        return comps.weekday == 7 && (comps.day == 30 || comps.day == 1)
        
    }
}

let d2 = Date(timeIntervalSince1970: 1498321268)
d2.isShabbatRoshHodesh()

let d = Date(timeIntervalSince1970: 1484324468)
d.isFriday13th()
isFriday13th(d)

let formatter = DateFormatter()
formatter.dateStyle = .medium
formatter.timeStyle = .medium
formatter.calendar = Calendar(identifier: .hebrew)
formatter.locale = Locale(identifier: "he")
formatter.doesRelativeDateFormatting = true
formatter.string(from: date2)
let str = formatter.string(from: d2)
let d3 : Date? = formatter.date(from: str)

//dd-MM-yyyy
let formatter2 = DateFormatter()
formatter2.dateFormat = "dd-MM-yyyy"

let d4 : Date? = formatter2.date(from: "23-04-2001")














