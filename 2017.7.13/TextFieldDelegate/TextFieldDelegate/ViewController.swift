//
//  ViewController.swift
//  TextFieldDelegate
//
//  Created by Benny Davidovitz on 13/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        firstnameTextField.delegate = self
        lastnameTextField.delegate = self
        
    }
    
    @IBAction func tapAction(_ sender: Any) {
        
        firstnameTextField.resignFirstResponder()
        lastnameTextField.resignFirstResponder()
        
    }
    

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .yellow
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = .white
    }
    

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case firstnameTextField:
            return true
        case lastnameTextField:
            let text = firstnameTextField.text ?? ""
            return !text.isEmpty
        default:
            return true
        }
    }
}














