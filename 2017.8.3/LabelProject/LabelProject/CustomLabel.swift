//
//  CustomLabel.swift
//  LabelProject
//
//  Created by Benny Davidovitz on 03/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

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
        //color, alignment, font, border, background, number of lines
        self.textColor = .red
        self.textAlignment = .center
        //self.font = UIFont.boldSystemFont(ofSize: 20)
        //self.font = UIFont.italicSystemFont(ofSize: 20)
        //self.font = UIFont(name: "Arial-BoldMT", size: 24)
        self.font = UIFont(name: "VarelaRound-Regular", size: 24)
        
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 3
        //self.layer.cornerRadius = self.bounds.size.height * 0.5
        self.layer.masksToBounds = true
        
        self.backgroundColor = .lightGray
        
        self.numberOfLines = 2

        self.shadowColor = .blue
        self.shadowOffset = CGSize(width: 1, height: 1)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.bounds.size.height * 0.5
        
    }


}








