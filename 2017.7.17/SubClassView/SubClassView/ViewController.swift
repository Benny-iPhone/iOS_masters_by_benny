//
//  ViewController.swift
//  SubClassView
//
//  Created by Benny Davidovitz on 17/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let oView = OrangeView(frame: CGRect(x: 30, y: 30, width: 50, height: 50))
        self.view.addSubview(oView)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

