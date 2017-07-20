//
//  ViewController.swift
//  ViewProperties
//
//  Created by Benny Davidovitz on 20/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var slider: UISlider!
    
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        print(#function)
        
    }
    @IBAction func userInteractionAction(_ sender: UISwitch) {
        
        blueView.isUserInteractionEnabled = sender.isOn
        
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        
        if sender.isOn{
            blueView.isHidden = false
        }

        self.slider.setValue(sender.isOn ? 1 : 0, animated: true)
        
        UIView.animate(withDuration: 1.5, animations: {
            self.blueView.alpha = sender.isOn ? 1 : 0
        }) { (success) in
            
            if sender.isOn == false{
                self.blueView.isHidden = true
            }
            
            
        }
        
        
        //blueView.isHidden = !sender.isOn
        
//        if sender.isOn{
//            blueView.isHidden = false
//        } else {
//            blueView.isHidden = true
//        }
    }
    
    @IBAction func alphaSliderAction(_ sender: UISlider) {
        
        blueView.alpha = CGFloat(sender.value)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueView.layer.borderColor = UIColor.black.cgColor
        blueView.layer.borderWidth = 2
        blueView.layer.cornerRadius = 10
        
        button.backgroundColor = .lightGray
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}














