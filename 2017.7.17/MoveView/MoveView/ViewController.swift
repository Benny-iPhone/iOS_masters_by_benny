//
//  ViewController.swift
//  MoveView
//
//  Created by Benny Davidovitz on 17/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func createAction(_ sender: Any) {
        
        let testView = UIView(frame: CGRect(x: 3, y: 90, width: 40, height: 40))
        testView.backgroundColor = .red
        testView.tag = 2
        self.view.addSubview(testView)
        
    }
    
    @IBAction func destroyAction(_ sender: Any) {
        
        //self.view.subviews.filter({ $0.tag == 2}).forEach { $0.removeFromSuperview() }
        
        for sub in self.view.subviews{
            if sub.tag == 2{
                sub.removeFromSuperview()
            }
        }
        //self.view.viewWithTag(2)?.removeFromSuperview()
    }
    
    @IBAction func moveXAction(_ sender: Any) {
        //???
        //var y = self.view.viewWithTag(100)?.frame.origin.y
        //y? += 10
        //guard let testView = self.view.viewWithTag(2) else {
        //    return
        //}
        
        for sub in self.view.subviews{
            guard sub.tag == 2 else {
                continue
            }
            
            let step = sub.frame.size.width / 2
            
            sub.frame.origin.x += step
            
            if sub.frame.origin.x > self.view.frame.size.width{
                sub.frame.origin.x = -step
            }
        }
        
    }
    
    var timer : Timer?
    
    @IBAction func moveYAction(_ sender: UIButton) {
        
        if timer != nil{
            timer?.invalidate()
            timer = nil
            return
        }
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (_) in
            
            for sub in self.view.subviews{
                guard sub.tag == 2 else{
                    continue
                }
                let step = sub.frame.size.height / 2
                sub.frame.origin.y += step
                
                if sub.frame.origin.y > self.view.frame.size.height{
                    sub.frame.origin.y = -step
                }
            }
        }
        
        
    }
    
    
    
}










