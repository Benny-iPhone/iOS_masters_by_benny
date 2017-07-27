//
//  TraingleView.swift
//  TriangleHomework
//
//  Created by Benny Davidovitz on 27/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

@IBDesignable class TraingleView: UIView {

    private var _strokeWidth : CGFloat = 1
    /*
    func setStrokeWidth(_ newValue : CGFloat){
        guard newValue >= 1 && newValue <= 20 else {
            return
        }
        
        _strokeWidth = newValue
    }
    
    func getStrokeWidth() -> CGFloat{
        return _strokeWidth
    }*/
    
    @IBInspectable var strokeWidth : CGFloat{
        set{
            guard newValue >= 1 && newValue <= 20 else {
                return
            }
            
            _strokeWidth = newValue
            //re-draw
            setNeedsDisplay()
        }
        get{
            return _strokeWidth
        }
    }
    
    @IBInspectable var strokeColor : UIColor = .black{
        didSet{
            //re-draw
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var fillColor : UIColor = .clear{
        didSet{
            //re-draw
            setNeedsDisplay()
        }
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        //config shape
        let w = bounds.width
        let h = bounds.height
        
        context.move(to: CGPoint(x: w * 0.5, y: h * 0.1))
        context.addLine(to: CGPoint(x: w * 0.9, y: h * 0.9))
        context.addLine(to: CGPoint(x: w * 0.1, y: h * 0.9))
        
        context.closePath()
        
        //config properties
        context.setLineWidth(strokeWidth)
        strokeColor.setStroke()
        fillColor.setFill()
        
        //draw
        context.drawPath(using: .fillStroke)
        
        
    }
    

}

















