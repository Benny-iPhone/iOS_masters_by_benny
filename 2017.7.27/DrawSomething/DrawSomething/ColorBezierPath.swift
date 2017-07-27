//
//  ColorBezierPath.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 27/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ColorBezierPath: UIBezierPath {
    var strokeColor : UIColor?
    
    override func stroke() {
        //UIGraphicsGetCurrentContext()?.setStrokeColor(strokeColor!.cgColor)
        
        strokeColor?.setStroke()
        
        super.stroke()
    }
}
