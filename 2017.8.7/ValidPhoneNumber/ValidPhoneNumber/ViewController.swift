//
//  ViewController.swift
//  ValidPhoneNumber
//
//  Created by Benny Davidovitz on 07/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import libPhoneNumber_iOS

class ViewController: UIViewController {

    @IBOutlet weak var label : UILabel!
    
    @IBAction func editingChangedAction(_ sender : UITextField){
        
        let phoneUtil = NBPhoneNumberUtil()
        
        guard let number = try? phoneUtil.parse(sender.text, defaultRegion: "IL") else{
            label.text = nil
            return
        }
        
        let str = try? phoneUtil.format(number, numberFormat: .INTERNATIONAL)
        label.text = str
        
        let isValid = phoneUtil.isValidNumber(number)
        
        sender.textColor = isValid ? .black : .red
        
    }
    
    


}














