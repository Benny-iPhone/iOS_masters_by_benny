//
//  SecondViewController.swift
//  PinchAndRotation
//
//  Created by Benny Davidovitz on 24/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
        
        guard let miniView = sender.view else {
            return
        }
        
        var transform = miniView.transform
        transform = transform.scaledBy(x: sender.scale, y: sender.scale)
        
        miniView.transform = transform
        
        sender.scale = 1
        
    }
    


}












