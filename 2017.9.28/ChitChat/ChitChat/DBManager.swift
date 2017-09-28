//
//  DBManager.swift
//  ChitChat
//
//  Created by Benny Davidovitz on 25/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage
import JSQMessagesViewController

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
    
    var username : String?{
        get{
            return Auth.auth().currentUser?.displayName
        }
    }
    
    
    private init(){
        rootRef = Database.database().reference()
        roomsRef = rootRef.child("rooms")
        messagesRef = rootRef.child("messages")
    }
    
    func createRoom(with name : String, image : UIImage?){
        
        guard let uid = self.uid else {
            return
        }
        
        let dict : [String:Any] = [
            "name":name,
            "uid":uid,
            "date":Date().timeIntervalSince1970
        ]
        
        //rooms/asnlksdnflskdnf/{}
        let ref = roomsRef.childByAutoId()
        ref.setValue(dict)
        
        if let image = image{
            let filename = UUID().uuidString + ".jpg"
            let data = UIImageJPEGRepresentation(image, 0.7)!
            
            let storageRef = Storage.storage().reference().child(ref.key).child(filename)
            
            storageRef.putData(data, metadata: nil, completion: { (_, error) in
                if error == nil{
                    ref.child("avatar").setValue(filename)
                }
                
            })
        }
        
        
        
        
    }
 
    func observeAllRooms(_ callback : @escaping ([Room])->Void)
    {
        
        roomsRef.observe(.value, with: { (snapshot) in
            
            guard let dict = snapshot.value as? [String:[String:Any]] else{
                callback([])
                return
            }
                        
            let arr : [Room] = dict.flatMap{Room(key: $0.key,value: $0.value)}
            callback(arr)
        })
        
    }
    
    func observeNewMessageIn(room : Room, callback : @escaping (JSQMessage)->Void){
        
        messagesRef.child(room.id).observe(.childAdded, with: { (snapshot) in
            guard let dict = snapshot.value as? [String:Any],
                let msg = JSQMessage(dict) else{
                    return
            }
            
            callback(msg)
        })
        
    }
    
    
    func sendNewMessage(with text : String, room : Room)
    {
        guard let uid = self.uid, let name = self.username else{
            return
        }
        
        let dict : [String:Any] = [
            "text":text,
            "uid":uid,
            "name":name,
            "date":Date().timeIntervalSince1970
        ]
        
        messagesRef.child(room.id).childByAutoId().setValue(dict)
        
    }
    
    
    
    
    
    
    
}



















