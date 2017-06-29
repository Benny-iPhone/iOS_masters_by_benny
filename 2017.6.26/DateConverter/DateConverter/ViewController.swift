//
//  ViewController.swift
//  DateConverter
//
//  Created by Benny Davidovitz on 26/06/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Mode : Int{
        case gregToHeb //= 0
        case hebToGreg
        case gregToChi
        
        
        /*
        func source() -> Calendar{
            switch self {
            case .gregToHeb, .gregToChi:
                return Calendar(identifier: Calendar.Identifier.gregorian)
            case .hebToGreg:
                return Calendar(identifier: .hebrew)
            }
        }
         
         func destination() -> Calendar{
         switch self {
         case .gregToHeb:
         return Calendar(identifier: .hebrew)
         case .hebToGreg:
         return Calendar(identifier: .gregorian)
         case .gregToChi:
         return Calendar(identifier: .chinese)
         }
         }
         */
        func source() -> (calendar : Calendar, locale : Locale){ //return tuple
            switch self {
            case .gregToHeb, .gregToChi:
                return (
                    Calendar(identifier: Calendar.Identifier.gregorian),
                    Locale(identifier: "en")
                )
            case .hebToGreg:
                return (
                Calendar(identifier: .hebrew),
                Locale(identifier: "he")
                )
            }
        }
        
        func destination() -> (calendar : Calendar, locale : Locale){
            switch self {
            case .gregToHeb:
                return (
                Calendar(identifier: .hebrew),
                Locale(identifier: "he")
                )
            case .hebToGreg:
                return (
                    Calendar(identifier: .gregorian),
                    Locale(identifier: "en")
                )
            case .gregToChi:
                return (
                    Calendar(identifier: .chinese),
                    Locale(identifier: "ch")
                )
            }
        }
    }
    
    var mode : Mode = .gregToHeb
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func datePickerValueChangedAction(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        //formatter.calendar = Calendar(identifier: .hebrew)
        
        let dest : (calendar : Calendar, locale: Locale) = mode.destination()
        
        formatter.calendar = dest.calendar
        formatter.locale = dest.locale
        
        formatter.dateStyle = .long
        //formatter.dateFormat = "dd.MMM.yyyy"
        
        label.text = formatter.string(from: sender.date)
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        //update mode
        let index : Int = sender.selectedSegmentIndex
        guard let m = Mode(rawValue: index) else{
            debugPrint("unsupprted index \(index)")
            return
        }
        
        self.mode = m
     
        //refresh date picker settings
        let source = mode.source()
        datePicker.calendar = source.calendar
        datePicker.locale = source.locale
        
        //refresh label
        datePicker.sendActions(for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //datePickerValueChangedAction(datePicker)
        datePicker.sendActions(for: .valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}








