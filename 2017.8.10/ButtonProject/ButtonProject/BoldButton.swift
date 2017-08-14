//
//  BoldButton.swift
//  ButtonProject
//
//  Created by Benny Davidovitz on 10/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

//bold font
//2 lines
//highlighted color - light orange
//normal color - orange
class BoldButton: UIButton {

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
        self.setTitleColor(.orange, for: .normal)
        let lightOrange = UIColor.orange.withAlphaComponent(0.4)
        self.setTitleColor(lightOrange, for: .highlighted)
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel?.numberOfLines = 2
    }


}















