//
//  SubmitButton.swift
//  ButtonProject
//
//  Created by Benny Davidovitz on 10/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class SubmitButton: UIButton {

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
        self.contentEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        
        setTitleColor(.white, for: .normal)
        
        titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 20)
        
        self.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.blue.cgColor
    }


}




















