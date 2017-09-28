//
//  Room.swift
//  ChitChat
//
//  Created by Benny Davidovitz on 25/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

class Room{
    let id : String
    let uid : String

    let name : String?
    let date : Date?
    
    var avatar : StorageReference?
    
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
        
        if let filename = value["avatar"] as? String{
            self.avatar = Storage.storage().reference().child(key).child(filename)
        } else {
            self.avatar = nil
        }
        
    }
    
    var canDelete : Bool{
        get{
            return self.uid == DBManager.manager.uid
        }
    }
    
    func removeFromDB(){
        avatar?.delete(completion: nil)
        
        let ref = DBManager.manager.roomsRef.child(self.id)
        ref.setValue(nil)
    }
    
    
    
    
}



















