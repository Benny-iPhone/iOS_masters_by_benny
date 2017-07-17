//
//  ChessView.swift
//  SubClassView
//
//  Created by Benny Davidovitz on 17/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

@IBDesignable class ChessView: UIView {

    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    //code for storyboard (take a look)
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setup()
    }
    
    private func setup(){
        let q = min(frame.width, frame.height) / 8
        
        var rect = CGRect(x: 0, y: 0, width: q, height: q)
        
        for i in 0..<8{
            
            for j in 0..<8{
                
                //create
                var sub : UIView
                if (i + j) % 2 == 0{
                    sub = BlackView(frame: rect)
                } else {
                    sub = WhiteView(frame: rect)
                }
                
                self.addSubview(sub)
                
                //increment
                rect.origin.x += q
            }
            
            rect.origin.x = 0
            rect.origin.y += q
            
        }
    }


}



























