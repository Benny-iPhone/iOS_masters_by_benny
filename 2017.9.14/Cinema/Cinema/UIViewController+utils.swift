//
//  UIViewController+utils.swift
//  Cinema
//
//  Created by Benny Davidovitz on 18/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import RESideMenu

extension UIViewController{
    
    @IBAction func showMenu(){
        
        if isRTL{
            self.sideMenuViewController.presentRightMenuViewController()
        } else {
            self.sideMenuViewController.presentLeftMenuViewController()
        }
        
        
    }
    
}











