//
//  ViewController.swift
//  PanGestureProject
//
//  Created by Benny Davidovitz on 20/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLayout: NSLayoutConstraint!
    @IBOutlet weak var myView: UIView!
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: self.view)
        //myView.center = point
        //self.view.viewWithTag(9)?.center = point
        sender.view?.center = point
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.layer.cornerRadius = heightLayout.constant / 2
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

