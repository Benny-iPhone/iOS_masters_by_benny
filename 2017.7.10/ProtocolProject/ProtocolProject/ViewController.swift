//
//  ViewController.swift
//  ProtocolProject
//
//  Created by Benny Davidovitz on 10/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , SecondViewControllerDelegate{

    @IBOutlet weak var textField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
        if segue.destination is SecondViewController{
            let nextVC = segue.destination as! SecondViewController
            nextVC.str = ""
        }*/
        
        if let nextVC = segue.destination as? SecondViewController{
            
            nextVC.str = textField.text
            nextVC.delegate = self
            
        }
        
    }

    func secondViewController(_ controller: SecondViewController, didTypeText text: String?) {
        textField.text = text
    }

}












