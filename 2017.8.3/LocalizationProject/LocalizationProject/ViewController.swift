//
//  ViewController.swift
//  LocalizationProject
//
//  Created by Benny Davidovitz on 03/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //label.text = NSLocalizedString("greeting", comment: "greeting")
        label.text = "greeting".localized
        
        let buttonText = NSLocalizedString("login_vc_button", comment: "login_vc_button")
        button.setTitle(buttonText, for: .normal)
    }

    @IBAction func buttonAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "alert_title".localized, message: "alert_message".localized, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "alert_ok_button".localized, style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }


}












