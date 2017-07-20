//
//  ViewController.swift
//  CenterProject
//
//  Created by Benny Davidovitz on 20/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    

    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        
        let point = sender.location(in: self.view)
        UIView.animate(withDuration: 1.0) { 
            self.redView.center = point
        }
        
        
    }

}






















