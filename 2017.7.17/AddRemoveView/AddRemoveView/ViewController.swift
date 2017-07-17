//
//  ViewController.swift
//  AddRemoveView
//
//  Created by Benny Davidovitz on 17/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func addAction(_ sender: Any) {
        
        let rect = CGRect(x: 250, y: 20, width: 60, height: 70)
        let newView = UIView(frame: rect)
        newView.backgroundColor = .blue
        newView.tag = 1
        
        self.view.addSubview(newView)
        
    }

    @IBAction func removeAction(_ sender: Any) {
        
        //self.view.viewWithTag(1)?.removeFromSuperview()
        
        for sub in self.view.subviews{
            if sub.tag == 1{
                sub.removeFromSuperview()
            }
        }
        
    }
    
}













