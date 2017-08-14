//
//  ViewController.swift
//  CustomControl
//
//  Created by Benny Davidovitz on 14/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , CustomControlDelegate{

    @IBOutlet weak var facebookControl: CustomControl!
    @IBOutlet weak var gmailControl: CustomControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        facebookControl.onClick = {
            print("facebook on click")
        }
        
        gmailControl?.delegate = self
        facebookControl.delegate = self
    }

    func controlDidPress(_ control: CustomControl) {
        switch control {
        case facebookControl:
            print("facebook pressed")
        case gmailControl:
            print("gmail pressed")
        default:
            break
        }
    }


}

