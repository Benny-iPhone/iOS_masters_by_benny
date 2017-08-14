//
//  CustomControl.swift
//  CustomControl
//
//  Created by Benny Davidovitz on 14/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

protocol CustomControlDelegate {
    func controlDidPress(_ control : CustomControl)
}


class CustomControl: UIView {
    typealias CallBack = () -> Void
    
    var onClick : CallBack?
    var delegate : CustomControlDelegate?

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
        //background
        backgroundColor = UIColor.orange.withAlphaComponent(0.8)
        
        //border
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.withAlphaComponent(0.8).cgColor
        
        //gesture
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        longGesture.minimumPressDuration = 0.01
        self.addGestureRecognizer(longGesture)
    }
    
    func handleTap(_ sender : UIGestureRecognizer){
        if sender.state == .ended{
            onClick?()
            delegate?.controlDidPress(self)
        }
        
        switch sender.state {
        case .began:
            makeHighligh(true)
        case .ended, .cancelled:
            makeHighligh(false)
        default:
            break
        }
    }

    private func makeHighligh(_ h : Bool){
        for item in self.subviews{
            item.alpha = h ? 0.6 : 1
        }
    }
}











