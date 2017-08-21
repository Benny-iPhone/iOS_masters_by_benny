//
//  Utils.swift
//  TextFieldProject
//
//  Created by Benny Davidovitz on 21/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import libPhoneNumber_iOS

extension String{
    //https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
    
    var isValidEmail : Bool{
        get{
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self)
        }
    }
    
    var isValidPhone : Bool{
        get{
            let util = NBPhoneNumberUtil()
            
            guard let number = try? util.parse(self, defaultRegion: "IL") else{
                return false
            }
            
            return util.isValidNumber(number)
        }
    }
}























