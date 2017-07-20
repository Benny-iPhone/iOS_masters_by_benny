//
//  Utils.swift
//  ViewProperties
//
//  Created by Benny Davidovitz on 20/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

extension UIView{
    
    @IBInspectable var borderColor : UIColor{
        set{
            self.layer.borderColor = newValue.cgColor
        }
        get{
            if let color = layer.borderColor{
                return UIColor(cgColor: color)
            } else {
                return .clear
            }
        }
    }
    
 
    @IBInspectable var borderWidth : CGFloat{
        set{
            layer.borderWidth = newValue
        }
        get{
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat{
        set{
            layer.cornerRadius = newValue
        }
        get{
            return layer.cornerRadius
        }
    }
}
















