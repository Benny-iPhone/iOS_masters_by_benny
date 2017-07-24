//
//  DrawView.swift
//  DrawProject
//
//  Created by Benny Davidovitz on 24/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

@IBDesignable class DrawView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        guard let context = UIGraphicsGetCurrentContext() else{
            return
        }
        
        let w = bounds.width
        let h = bounds.height
        
        context.move(to: CGPoint(x: w * 0.5, y: h * 0.1))
        context.addLine(to: CGPoint(x: w * 0.1, y: h * 0.9))
        context.addLine(to: CGPoint(x: w * 0.9, y: h * 0.9))
        context.closePath()
        
        context.setLineWidth(3)
        UIColor.red.setStroke()
        //context.setStrokeColor(UIColor.red.cgColor)
        
        UIColor.blue.setFill()
        //context.setFillColor(UIColor.blue.cgColor)
        
        //context.strokePath() === context.drawPath(using: .stroke)
        context.drawPath(using: .fillStroke)
        
    }
    

}

















