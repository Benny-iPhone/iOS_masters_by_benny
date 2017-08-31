//
//  CandyCell.swift
//  CandyShop
//
//  Created by Benny Davidovitz on 31/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class CandyCell: UITableViewCell {

    @IBOutlet weak var pictureImageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(with candy : Candy){
        
        nameLabel.text = candy.name
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "ILS"
        
        priceLabel.text = formatter.string(from: (candy.price ?? 0) as NSNumber)
        
        if let url = candy.imageURL{
            pictureImageview.sd_setImage(with: url)
        } else {
            pictureImageview.image = nil
            pictureImageview.sd_cancelCurrentImageLoad()
        }
    }
    
}

















