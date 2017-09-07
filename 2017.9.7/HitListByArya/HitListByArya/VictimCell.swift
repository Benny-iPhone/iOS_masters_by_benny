//
//  VictimCell.swift
//  HitListByArya
//
//  Created by Benny Davidovitz on 04/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class VictimCell: UITableViewCell {

    @IBOutlet weak var firstnameLabel: UILabel!
    
    @IBOutlet weak var lastnameLabel: UILabel!
    
    
    func configure(with victim : Victim){
        
        firstnameLabel.text = victim.firstName
        lastnameLabel.text = victim.lastName
        
    }
    
}
















