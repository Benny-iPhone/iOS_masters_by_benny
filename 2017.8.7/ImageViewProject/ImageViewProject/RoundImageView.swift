//
//  RoundImageView.swift
//  ImageViewProject
//
//  Created by Benny Davidovitz on 07/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {

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
        layer.cornerRadius = min(bounds.height, bounds.width) * 0.5
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = min(bounds.height, bounds.width) * 0.5

    }
}








