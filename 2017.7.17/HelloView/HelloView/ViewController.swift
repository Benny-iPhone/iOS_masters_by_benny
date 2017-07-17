//
//  ViewController.swift
//  HelloView
//
//  Created by Benny Davidovitz on 17/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = self.view.frame.width
        let rect = CGRect(x: 50, y: 60, width: screenWidth * 0.5, height: 20)
        let orangeView = UIView(frame: rect)
        orangeView.backgroundColor = .orange
        orangeView.tag = 1
        
        self.view.addSubview(orangeView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //refresh orange view width
        let screenWidth = self.view.frame.width
        self.view.viewWithTag(1)?.frame.size.width = screenWidth * 0.5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}







