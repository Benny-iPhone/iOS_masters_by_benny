//
//  GenderTextField.swift
//  TextFieldProject
//
//  Created by Benny Davidovitz on 17/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class GenderTextField: ToolbarTextField {

    enum Gender : Int{
        case none
        case male
        case female
        
        static let count = 3
        
        var string : String{
            get{
                switch self {
                case .none: return "לא מספר/ת"
                case .female: return "מלכת השושנים"
                case .male: return "שוורץ אנד גבר"
                }
            }
        }
    }
    
    var gender : Gender{
        get{
            let pickerView = self.inputView as! UIPickerView
            let selectedRow = pickerView.selectedRow(inComponent: 0)
            return Gender(rawValue: selectedRow)!
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
        
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        pickerView.dataSource = self
        pickerView.delegate = self
        
        self.inputView = pickerView
    }

}

extension GenderTextField : UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Gender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Gender(rawValue: row)?.string
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = Gender(rawValue: row)?.string
    }
    
}

















