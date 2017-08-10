//
//  ViewController.swift
//  PlusMinusButtons
//
//  Created by Benny Davidovitz on 10/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var label : UILabel!
    
    let minValue = -1000
    let maxValue = 20
    
    var num : Int = 0{
        didSet{
            minusButton.isEnabled = num > minValue
            plusButton.isEnabled = num < maxValue
            
            label.text = "\(num)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        num = 10
    }

    @IBAction func minusAction(_ sender: Any) {

        num = max(num - 1, minValue)
        
    }

    @IBAction func plusAction(_ sender: Any) {
        num = min(num + 1, maxValue)
    }
    
    var timer : Timer?
    
    @IBAction func minusLongPressAction(_ sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .began:
            
            timerAction()

        case .ended:
            timer?.invalidate()
            timer = nil
        default:
            break
        }
    }
    
    func timerAction(){
        minusAction(minusButton)
        
        let interval = (timer?.userInfo as? TimeInterval ?? 1.111111) * 0.9
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(timerAction), userInfo: interval, repeats: false)
    }

}












