//
//  DBManager.swift
//  ChitChat
//
//  Created by Benny Davidovitz on 25/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import Firebase

class DBManager{
    
    static let manager = DBManager()
    
    let rootRef : DatabaseReference
    let roomsRef : DatabaseReference
    let messagesRef : DatabaseReference
    
    var uid : String?{
        get{
            return Auth.auth().currentUser?.uid
        }
    }
    
    private init(){
        rootRef = Database.database().reference()
        roomsRef = rootRef.child("rooms")
        messagesRef = rootRef.child("messages")
    }
    
    func createRoom(with name : String){
        
        guard let uid = self.uid else {
            return
        }
        
        let dict : [String:Any] = [
            "name":name,
            "uid":uid,
            "date":Date().timeIntervalSince1970
        ]
        
        //rooms/asnlksdnflskdnf/{}
        roomsRef.childByAutoId().setValue(dict)
        
    }
 
    func observeAllRooms(_ callback : @escaping ([Room])->Void)
    {
        
        roomsRef.observe(.value, with: { (snapshot) in
            guard let dict = snapshot.value as? [String:[String:Any]] else{
                return
            }
                        
            let arr = dict.flatMap{Room(key: $0.key,value: $0.value)}
            callback(arr)
        })
        
    }
    
    
    
}



















