//
//  FirstViewController.swift
//  PinchAndRotation
//
//  Created by Benny Davidovitz on 24/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBAction func rotationAction(_ sender: UIRotationGestureRecognizer) {
        guard let miniView = sender.view else {
            return
        }
        
        var transform = miniView.transform
        transform = transform.rotated(by: sender.rotation)
        sender.rotation = 0
        
        miniView.transform = transform
        
    }
    


}












