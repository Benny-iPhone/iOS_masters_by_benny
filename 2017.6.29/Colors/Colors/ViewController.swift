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
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { (_) in
            if self.segmentedControl.selectedSegmentIndex == self.segmentedControl.numberOfSegments - 1{
                self.segmentedControl.selectedSegmentIndex = 0
            } else {
                self.segmentedControl.selectedSegmentIndex += 1
            }
            
            self.segmentAction(self.segmentedControl)
        }
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let color = Colors(rawValue: index)
        
        
        let rotate = CGAffineTransform(rotationAngle: CGFloat.pi * 0.25)
        let current = self.colorView.transform
        let total = current.concatenating(rotate)
        
        UIView.animate(withDuration: 1.5) {
            self.colorView.backgroundColor = color?.getColor()
            self.colorView.transform = total
        }
        
        
    }
    



}











