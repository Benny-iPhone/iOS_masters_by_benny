//
//  ViewController.swift
//  LongPressProject
//
//  Created by Benny Davidovitz on 24/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func longPressGestureAction(_ sender: UILongPressGestureRecognizer) {
        print(#function)
        guard sender.state == .ended else{
            return
        }
        
        func fadeOut(){
            sender.view?.alpha = 0.1
        }
        
        func fadeIn(){
            sender.view?.alpha = 1
        }
        
        func completion(_ v : Bool){
            UIView.animate(withDuration: 0.6, animations: fadeIn)
        }
        
        UIView.animate(withDuration: 0.6, animations: fadeOut, completion: completion)
        
        /*
        UIView.animate(withDuration: 0.5, animations: {
            sender.view?.alpha = 0.1
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, animations: {
                sender.view?.alpha = 1
            })
            
        }*/
        
    }
    


}






