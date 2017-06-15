//
//  ViewController.swift
//  HelloWorld
//
//  Created by Benny Davidovitz on 15/06/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonPressed(_ sender: Any) {

        guard let text = textField.text, //not nil
            text.isEmpty == false //not empty
            else {
            return
        }
        
        label.text = "hello " + text + "😇"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = nil
        textField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






