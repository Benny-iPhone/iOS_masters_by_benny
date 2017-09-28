//
//  JSQMessage+init.swift
//  ChitChat
//
//  Created by Benny Davidovitz on 28/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import JSQMessagesViewController

extension JSQMessage{
    
    convenience init?(_ dict : [String:Any]){
        
        guard let uid = dict["uid"] as? String,
            let name = dict["name"] as? String,
            let date = dict["date"] as? TimeInterval,
            let text = dict["text"] as? String else{
                return nil
        }
        
        let d = Date(timeIntervalSince1970: date)
        self.init(senderId: uid, senderDisplayName: name, date: d, text: text)
        
    }
    
    
    
}







