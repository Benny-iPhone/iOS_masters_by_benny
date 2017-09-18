//
//  MenuCell.swift
//  Cinema
//
//  Created by Benny Davidovitz on 18/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var label : UILabel!
    
    func configure(with endpoint : APIManager.Endpoint){
        label.text = endpoint.name
    }

}
