//
//  EllipseView.swift
//  DrawProject
//
//  Created by Benny Davidovitz on 24/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

@IBDesignable class EllipseView: UIView {

    @IBInspectable var lineWidth : CGFloat = 1{
        didSet{
            //re-draw
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var strokeColor : UIColor = .black{
        didSet{
            //re-draw
            self.setNeedsDisplay()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        guard let context = UIGraphicsGetCurrentContext() else{
            return
        }
        
        //configure
        var ellipseRect = self.bounds //0,0,w,h
        
        ellipseRect.origin.x += lineWidth * 0.5
        ellipseRect.origin.y += lineWidth * 0.5
        
        ellipseRect.size.width -= lineWidth
        ellipseRect.size.height -= lineWidth
        
        context.addEllipse(in: ellipseRect)
        
        strokeColor.setStroke()
        context.setLineWidth(lineWidth)
        
        //make the draw
        context.strokePath()
    }
    

}
















