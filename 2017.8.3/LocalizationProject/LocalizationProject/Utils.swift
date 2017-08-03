//
//  Utils.swift
//  LocalizationProject
//
//  Created by Benny Davidovitz on 03/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

extension String{
    var localized : String{
        get{
            return NSLocalizedString(self, comment: self)
        }
    }
}

class AppLabel : UILabel{
    @IBInspectable var localizeKey : String?
    
    //like viewDidLoad
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let str = localizeKey{
            self.text = str.localized
        }
    }
}


















