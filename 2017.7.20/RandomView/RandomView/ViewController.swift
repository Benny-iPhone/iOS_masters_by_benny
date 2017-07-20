//
//  ViewController.swift
//  RandomView
//
//  Created by Benny Davidovitz on 20/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

extension UIColor{
    class var randomColor : UIColor{
        get{
            let redVal = CGFloat(arc4random_uniform(256))
            let blueVal = CGFloat(arc4random_uniform(256))
            let greenVal = CGFloat(arc4random_uniform(256))
            
            return UIColor(red: redVal / 255,
                           green: greenVal / 255,
                           blue: blueVal / 255,
                           alpha: 1)
            
        }
    }
}

class ViewController: UIViewController {

    @IBAction func createAction(_ sender: UIButton) {
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        let x = CGFloat(arc4random_uniform(UInt32(width)))
        let y = CGFloat(arc4random_uniform(UInt32(height)))
        let w = CGFloat(arc4random_uniform(UInt32(width * 0.3))) + 1
        let h = CGFloat(arc4random_uniform(UInt32(height * 0.3))) + 1
        
        let rect = CGRect(x: x, y: y, width: w, height: h)
        let subView = UIView(frame: rect)
        
        subView.backgroundColor = .randomColor

        self.view.addSubview(subView)
        view.bringSubview(toFront: sender)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
            subView.removeFromSuperview()
        }
        
    }
    


}










