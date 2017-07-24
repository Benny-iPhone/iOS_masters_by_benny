//
//  ViewController.swift
//  DoubleTapHomework
//
//  Created by Benny Davidovitz on 24/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var widthLayout: NSLayoutConstraint!
    @IBOutlet weak var heightLayout: NSLayoutConstraint!
    
    
    @IBAction func doubleTapAction(_ sender: UITapGestureRecognizer) {
        //let str = "\(#file)  \(#line)  \(#function)"
        //print(str)
        
        //part 1
        //sender.view?.backgroundColor = .randomColor
        
        //part 2
        
        guard let miniView = sender.view else {
            return
        }
        
        
        //part 3
        heightLayout.constant += 30
        widthLayout.constant += 30
        /*
        UIView.animate(withDuration: 0.7) {
            miniView.backgroundColor = .randomColor
            self.view.layoutIfNeeded()
        }*/
        
        //UIView.animate(withDuration: <#T##TimeInterval#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        
        UIView.animate(withDuration: 0.2, animations: {
            miniView.backgroundColor = .randomColor
            self.view.layoutIfNeeded()
        }) { _ in
            
            self.heightLayout.constant -= 30
            self.widthLayout.constant -= 30
            
            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            })
            
        }

        
    }
    
    


}





