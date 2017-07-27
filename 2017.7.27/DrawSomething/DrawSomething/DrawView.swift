//
//  DrawView.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 27/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class DrawView: UIView {

    private var beziers : [UIBezierPath] = []
    var strokeWidth : CGFloat = 1
    var strokeColor : UIColor = .black
    
    func clear(){
        beziers = []
        setNeedsDisplay()
    }
    
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
    
    private func setup(){
        isMultipleTouchEnabled = false
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let t = touches.first!
        let point = t.location(in: self)
        
        let b = ColorBezierPath()
        b.lineWidth = strokeWidth
        b.move(to: point)
        b.strokeColor = strokeColor
        
        beziers.append(b)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        let t = touches.first!
        let point = t.location(in: self)
        beziers.last?.addLine(to: point)
        setNeedsDisplay()
    }

    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
       
        for b in beziers{
            b.stroke()
        }
    }
    

}










