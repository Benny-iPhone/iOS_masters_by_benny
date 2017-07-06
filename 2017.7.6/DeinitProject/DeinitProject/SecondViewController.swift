//
//  SecondViewController.swift
//  DeinitProject
//
//  Created by Benny Davidovitz on 06/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    deinit {

        let defaults = UserDefaults.standard
        defaults.set(textField.text, forKey: "text")
        defaults.synchronize()
        
    }

}
