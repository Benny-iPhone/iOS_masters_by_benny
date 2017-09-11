//
//  ViewController.swift
//  GenderAPI
//
//  Created by Benny Davidovitz on 11/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        guard let name = textField.text, name.isEmpty == false else{
            label.text = "type a name please"
            return
        }
        
        APIManager.shared.getGenderBy(name: name) { (err, result) in
            if let err = err{
                self.label.text = err.localizedDescription
                return
            }
            
            self.label.text = result?.gender
            self.progressView.progress = result?.accuracy ?? 0
        }
        
        
//        let url = "https://gender-api.com/get"
//        
//        let params : [String:Any] = [
//            "name":name,
//            "key":"mvabClVyGwZEaKEpxW"
//        ]
//        
//        Alamofire.request(url, method: .get, parameters: params).responseJSON { (dataResponse) in
//            
//            guard let dict = dataResponse.result.value as? [String:Any] else{
//                print(dataResponse.error?.localizedDescription ?? "")
//                return
//            }
//            
//            print(dict)
//            
//            let gender = dict["gender"] as? String
//            self.label.text = gender
//            
//            if let accuracy = dict["accuracy"] as? Int{
//                self.progressView.progress = Float(accuracy) / 100
//            }
//            
//            
//        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






