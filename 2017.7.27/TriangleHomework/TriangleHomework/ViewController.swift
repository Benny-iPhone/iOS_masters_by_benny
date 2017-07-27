//
//  ViewController.swift
//  TriangleHomework
//
//  Created by Benny Davidovitz on 27/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tView: TraingleView!
    
    @IBAction func sliderAction(_ sender: UISlider) {
        tView.strokeWidth = CGFloat(sender.value)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

