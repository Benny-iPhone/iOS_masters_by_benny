//
//  OrangeView.swift
//  SubClassView
//
//  Created by Benny Davidovitz on 17/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class OrangeView: UIView {
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        configure()
    }
    
    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    private func configure(){
        self.backgroundColor = .orange
    }
    
    
    

}
