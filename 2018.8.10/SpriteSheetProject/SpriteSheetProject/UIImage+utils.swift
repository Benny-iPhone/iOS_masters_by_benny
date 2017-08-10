//
//  UIImage+utils.swift
//  SpriteSheetProject
//
//  Created by Benny Davidovitz on 10/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

extension UIImage{
    func crop(rect : CGRect) -> UIImage?
    {
        if let result = self.cgImage?.cropping(to: rect){
            return UIImage(cgImage: result)
        } else {
            return nil
        }
    }
    
    func cropSpriteSheet(columns : UInt, rows : UInt) -> [UIImage]
    {
        let w = self.size.width / CGFloat(columns)
        let h = self.size.height / CGFloat(rows)
        
        var rect = CGRect(x: 0, y: 0, width: w, height: h)
        
        var result : [UIImage] = []
        
        for _ in 0..<rows{
            
            for _ in 0..<columns{
                
                if let image = self.crop(rect: rect){
                    result.append(image)
                }
                
                rect.origin.x += w
            }
            
            rect.origin.y += h
            rect.origin.x = 0
            
        }
        
        return result
    }
    
}

























