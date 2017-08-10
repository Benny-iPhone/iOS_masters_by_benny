//
//  NumberButton.swift
//  PlusMinusButtons
//
//  Created by Benny Davidovitz on 10/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class NumberButton: UIButton {

    var digitColor : UIColor = .orange
    var opDigitColor : UIColor = .white
    
    override var isHighlighted: Bool{
        didSet{
            if isHighlighted{
                backgroundColor = digitColor
            } else {
                backgroundColor = opDigitColor
            }
        }
    }
    
    private func setup(){
        layer.borderColor = digitColor.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = bounds.width / 2
        
        setTitleColor(digitColor, for: .normal)
        setTitleColor(opDigitColor, for: .highlighted)
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
    
}















