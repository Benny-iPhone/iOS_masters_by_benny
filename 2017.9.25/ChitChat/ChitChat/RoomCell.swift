//
//  RoomCell.swift
//  ChitChat
//
//  Created by Benny Davidovitz on 25/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class RoomCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    func configure(with room : Room){
        
        label.text = room.name
        
    }
    
    
    
}
