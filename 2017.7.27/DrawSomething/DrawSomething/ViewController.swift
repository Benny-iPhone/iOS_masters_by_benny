//
//  ViewController.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 27/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    

    @IBAction func clearAction(_ sender: Any) {
        drawView.clear()
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        
        drawView.strokeWidth = CGFloat(sender.value)
        
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            drawView.strokeColor = .black
        case 1:
            drawView.strokeColor = .red
        case 2:
            drawView.strokeColor = .blue
        default:
            break
        }
        
    }
    
    @IBAction func shareAction(_ sender: Any) {
        
        let image = UIImage(drawView)
        
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        
        self.present(controller, animated: true, completion: nil)
    }
    
    
}



















