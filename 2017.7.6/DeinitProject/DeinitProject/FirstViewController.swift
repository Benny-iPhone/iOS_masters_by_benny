//
//  FirstViewController.swift
//  DeinitProject
//
//  Created by Benny Davidovitz on 06/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonPressed(_ sender: Any) {
        let defaults = UserDefaults.standard
        label.text = defaults.object(forKey: "text") as? String
    }
}
