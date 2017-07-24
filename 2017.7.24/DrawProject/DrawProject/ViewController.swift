//
//  ViewController.swift
//  DrawProject
//
//  Created by Benny Davidovitz on 24/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ellipseView: EllipseView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        
        ellipseView.lineWidth = CGFloat(sender.value)
    
    }
    

}












