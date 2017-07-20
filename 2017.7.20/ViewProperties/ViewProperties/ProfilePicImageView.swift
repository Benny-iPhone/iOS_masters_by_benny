//
//  ProfilePicImageView.swift
//  ViewProperties
//
//  Created by Benny Davidovitz on 20/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

@IBDesignable class ProfilePicImageView: UIImageView {

    //storyboard call this method
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        configure()
    }
    
    //constrains finished
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configure()
    }
    
    func configure(){
        self.borderColor = .red
        self.borderWidth = 1
        self.cornerRadius = min(bounds.width, bounds.height) * 0.5
        self.layer.masksToBounds = true
    }

}





