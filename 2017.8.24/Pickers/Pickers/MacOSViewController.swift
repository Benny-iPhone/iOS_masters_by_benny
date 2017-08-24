//
//  MacOSViewController.swift
//  Pickers
//
//  Created by Benny Davidovitz on 24/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class MacOSViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var label: UILabel!
    let pickerArray : [String] = [
        "Kodiak",
        "Cheetah",
        "Puma",
        "Jaguar",
        "Panther",
        "Tiger",
        "Leopard",
        "Snow Leopard",
        "Lion",
        "Mountain Lion",
        "Mavericks",
        "Yosemite",
        "El Capitan",
        "Sierra"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = "mac os: " + pickerArray[0]
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = "mac os: " + pickerArray[row]
    }

}

















