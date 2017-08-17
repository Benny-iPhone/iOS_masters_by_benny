//
//  ToolbarTextField.swift
//  TextFieldProject
//
//  Created by Benny Davidovitz on 17/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import AVFoundation

class ToolbarTextField: UITextField {

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
    
    func setup(){
        let width = UIScreen.main.bounds.width
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        
        let doneTitle = self.returnKeyType == .next ? "Next" : "Done"
        let doneButton = UIBarButtonItem(title: doneTitle, style: .plain, target: self, action: #selector(doneAction))
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.items = [cancelButton,spaceButton,doneButton]
            
            
        self.inputAccessoryView = toolbar
    }
    
    //https://github.com/TUNER88/iOSSystemSoundsLibrary
    func doneAction(){
        let soundID : SystemSoundID = 1104//1057
        AudioServicesPlaySystemSound(soundID)
        
        self.sendActions(for: UIControlEvents.editingDidEndOnExit)
    }
    
    func cancelAction(){
        let soundID : SystemSoundID = 1016
        AudioServicesPlaySystemSound(soundID)
        
        self.resignFirstResponder()
    }


}


















