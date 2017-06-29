//
//  ViewController.swift
//  Colors
//
//  Created by Benny Davidovitz on 29/06/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Colors : Int{
        case blue, red, green, yellow, pink, brown
        
        func getColor() -> UIColor{
            switch self {
            case .blue: return UIColor.blue
            case .red: return UIColor.red //.red
            case .green: return UIColor.green
            case .yellow: return UIColor.yellow
            case .pink: return UIColor(red: 255.0/255.0, green: 182.0/255.0, blue: 193.0/255.0, alpha: 1)
            case .brown: return UIColor.brown
            }
        }
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentAction(segmentedControl)
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let color = Colors(rawValue: index)
        colorView.backgroundColor = color?.getColor()
    }
    



}











