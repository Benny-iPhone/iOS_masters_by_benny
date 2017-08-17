//
//  ViewController.swift
//  TextFieldProject
//
//  Created by Benny Davidovitz on 17/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var stackTopLayout: NSLayoutConstraint!

    @IBOutlet weak var nameTextField: UITextField!
    
    var defaultTopLayout : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultTopLayout = stackTopLayout.constant
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: .main) { (note) in
            self.changeBy(y: 0)
        }
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @IBAction func didEndOnExitAction(_ sender: UITextField) {
        
        if let nextField = self.view.viewWithTag(sender.tag + 1) as? UITextField{
            nextField.becomeFirstResponder()
        } else {
            tapAction(sender)
        }
        
    }
    
    
    @IBAction func tapAction(_ sender: Any) {
        //nameTextField.resignFirstResponder()
        self.view.endEditing(true)
        //changeBy(y: 0)
    }
    
    func changeBy(y : CGFloat){
        stackTopLayout.constant = defaultTopLayout - y
        
        UIView.animate(withDuration: 0.28) { 
            self.view.layoutIfNeeded()
        }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        changeBy(y: textField.frame.origin.y)
    }
   
}








