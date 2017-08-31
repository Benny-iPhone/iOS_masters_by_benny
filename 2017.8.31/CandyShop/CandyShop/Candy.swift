//
//  Candy.swift
//  CandyShop
//
//  Created by Benny Davidovitz on 31/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class Candy: NSObject {
    
    let name : String?
    let price : Double?
    let desc : String?
    let imageURL : URL?
 
    init(_ dict : [String:Any]) {
        self.name = dict["name"] as? String
        self.price = dict["price"] as? Double
        self.desc = dict["desc"] as? String
        
        if let urlString = dict["url"] as? String{
            self.imageURL = URL(string: urlString)
        } else {
            self.imageURL = nil
        }
        
        super.init()
    }
}
























