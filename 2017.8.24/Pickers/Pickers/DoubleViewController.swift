//
//  DoubleViewController.swift
//  Pickers
//
//  Created by Benny Davidovitz on 24/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class DoubleViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    enum Comp : Int{
        case firstnames = 0
        case lastnames = 1
        
        static let count = 2
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    let firstNames = ["Zeev","Itay","Natan"]
    let lastNames = ["Raskin","Sviri","Feldman","Kaspy"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Comp.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let c = Comp(rawValue: component) else{
            return 0
        }
        
        switch c {
        case .firstnames: return firstNames.count
        case .lastnames: return lastNames.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let c = Comp(rawValue: component) else{
            return nil
        }
        
        switch c {
        case .firstnames: return firstNames[row]
        case .lastnames: return lastNames[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let fRow = pickerView.selectedRow(inComponent: Comp.firstnames.rawValue)
        let lRow = pickerView.selectedRow(inComponent: Comp.lastnames.rawValue)
        
        label.text = firstNames[fRow] + " " + lastNames[lRow]
        
    }

}














