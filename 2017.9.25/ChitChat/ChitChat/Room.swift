//
//  Room.swift
//  ChitChat
//
//  Created by Benny Davidovitz on 25/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation

class Room{
    let id : String
    let uid : String

    let name : String?
    let date : Date?
    
    init?(key : String, value : [String:Any]) {
        
        guard let uid = value["uid"] as? String else{
            return nil
        }
        
        self.id = key
        self.uid = uid
        self.name = value["name"] as? String
        
        if let timestamp = value["date"] as? TimeInterval{
            self.date = Date(timeIntervalSince1970: timestamp)
        } else {
            self.date = nil
        }
        
    }
}



















