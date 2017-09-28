//
//  FlowController.swift
//  ChitChat
//
//  Created by Benny Davidovitz on 25/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Firebase

class FlowController{
    static let shared = FlowController()
    
    weak var window : UIWindow?
    
    private init(){
        
    }
    
    func determineRoot(){
        let didLogin = Auth.auth().currentUser != nil
        
        let name = didLogin ? "Main" : "Login"
        let storyboard = UIStoryboard(name: name, bundle: .main)
        let rootVC = storyboard.instantiateInitialViewController()
        
        window?.rootViewController = rootVC
    }
}
















