//
//  GenderResult.swift
//  GenderAPI
//
//  Created by Benny Davidovitz on 11/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation

class GenderResult{
    let name : String
    let gender : String
    let accuracy : Float
    
    init(_ dict : [String:Any]) {
        self.name = dict["name"] as? String ?? ""
        self.gender = dict["gender"] as? String ?? ""
        let ac = dict["accuracy"] as? Int ?? 0
        self.accuracy = Float(ac) / 100
    }
}














