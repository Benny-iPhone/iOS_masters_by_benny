//
//  ChatViewController.swift
//  ChitChat
//
//  Created by Benny Davidovitz on 28/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class ChatViewController: JSQMessagesViewController {
    
    var room : Room!
    var messages : [JSQMessage] = []
    
    var incomingBubble : JSQMessagesBubbleImage!
    var outgointBubble : JSQMessagesBubbleImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let factory = JSQMessagesBubbleImageFactory()
        incomingBubble = factory?.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleRed())
        outgointBubble = factory?.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
        
        navigationItem.title = room.name
        
        self.senderId = DBManager.manager.uid
        self.senderDisplayName = DBManager.manager.username
        
        collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize(width: 32, height: 32)
        collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize(width: 32, height: 32)
        
        DBManager.manager.observeNewMessageIn(room: self.room) { (msg) in
            self.messages.append(msg)
            if msg.senderId == self.senderId{
                self.finishSendingMessage()
                JSQSystemSoundPlayer.jsq_playMessageSentSound()
            } else {
                self.finishReceivingMessage()
                JSQSystemSoundPlayer.jsq_playMessageReceivedSound()
            }
        }
    }
    
    override func didPressAccessoryButton(_ sender: UIButton!) {
        
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        guard let text = text, !text.isEmpty else{
            return
        }
        
        DBManager.manager.sendNewMessage(with: text, room: self.room)
        
        /*
         //mocking code
        let msg = JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text)
        messages.append(msg!)
        
        if senderId == self.senderId{
            finishSendingMessage()
            JSQSystemSoundPlayer.jsq_playMessageSentSound()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { 
                self.didPressSend(button, withMessageText: text, senderId: "foo", senderDisplayName: "foo", date: date)
            })
            
        } else {
            finishReceivingMessage()
            JSQSystemSoundPlayer.jsq_playMessageReceivedSound()
        }*/
        
    }
    
    //MARK: - JSQ Support
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        
        return messages[indexPath.item]
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return messages.count
        
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        
        let msg = messages[indexPath.item]
        return msg.senderId == self.senderId ? outgointBubble : incomingBubble
        
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        
        let msg = messages[indexPath.item]
        let image = msg.senderId == self.senderId ? #imageLiteral(resourceName: "icon_avatar_outgoing") : #imageLiteral(resourceName: "icon_avatar_incoming")
        
        return JSQMessagesAvatarImageFactory.avatarImage(with: image, diameter: 30)
     
        
    }

}








