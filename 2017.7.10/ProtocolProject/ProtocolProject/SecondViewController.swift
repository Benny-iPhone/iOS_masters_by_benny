//
//  SecondViewController.swift
//  ProtocolProject
//
//  Created by Benny Davidovitz on 10/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
    
    func secondViewController(_ controller : SecondViewController, didTypeText text : String?)
    
}

class SecondViewController: UIViewController {

    var str : String?
    var delegate : SecondViewControllerDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editingChangedAction(_ sender: Any) {
                
        delegate?.secondViewController(self, didTypeText: textField.text)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.text = str
    }


}













