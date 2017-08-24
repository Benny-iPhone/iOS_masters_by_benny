//
//  StatesViewController.swift
//  Pickers
//
//  Created by Benny Davidovitz on 24/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class StatesViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    let data : [String:[String]]
    let allStates : [String]
    var zipCodes : [String]
    
    required init?(coder aDecoder: NSCoder) {
        
        let path = Bundle.main.path(forResource: "statedictionary", ofType: "plist")!
        data = NSDictionary(contentsOfFile: path) as? [String:[String]] ?? [:]
        allStates = Array(data.keys).sorted()
        if allStates.isEmpty{
            zipCodes = []
        } else {
            zipCodes = data[allStates[0]]!
        }
        
        super.init(coder: aDecoder)
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return allStates.count
        } else {
            return zipCodes.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return allStates[row]
        } else {
            return zipCodes[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            zipCodes = data[allStates[row]]!
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
        }
    }
}






















