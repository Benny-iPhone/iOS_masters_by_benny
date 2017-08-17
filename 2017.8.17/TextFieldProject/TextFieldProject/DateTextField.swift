//
//  DateTextField.swift
//  TextFieldProject
//
//  Created by Benny Davidovitz on 17/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class DateTextField: ToolbarTextField {

    var date : Date{
        get{
            let datePicker = self.inputView as! UIDatePicker
            return datePicker.date
        }
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
    
    override func setup(){
        super.setup()
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        
        //hook IBAction progromatically
        datePicker.addTarget(self, action: #selector(datePickerAction(_:)), for: UIControlEvents.valueChanged)
        
        self.inputView = datePicker
    }

    func datePickerAction(_ sender : UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        self.text = formatter.string(from: sender.date)
    }
    
}


















