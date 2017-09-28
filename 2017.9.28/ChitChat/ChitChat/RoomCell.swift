//
//  RoomCell.swift
//  ChitChat
//
//  Created by Benny Davidovitz on 25/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import FirebaseStorageUI

class RoomCell: UITableViewCell {

    @IBOutlet weak var avatarImageView : UIImageView!
    @IBOutlet weak var label: UILabel!
    
    //like viewDidLoad
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        avatarImageView.layer.borderWidth = 1
    }
    
    func configure(with room : Room){
        
        label.text = room.name

        avatarImageView.image = #imageLiteral(resourceName: "icon_chat_placeholder")

        if let avatar = room.avatar{
            avatarImageView.sd_setImage(with: avatar)
        } else {
            avatarImageView.sd_cancelCurrentImageLoad()
        }
    }
    
    
    
}





