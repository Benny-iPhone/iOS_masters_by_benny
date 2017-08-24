//
//  ViewController.swift
//  HelloWorldApi
//
//  Created by Benny Davidovitz on 24/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label.text = ""
        
    }

    @IBAction func buttonPressed(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        
        let url = "http://5.189.170.57/api/hello2.php"
        
        let params : [String:Any] = [
            "name":name
        ]
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON { dataResponse in
            
            guard let json = dataResponse.result.value as? [String:Any] else{
                print(dataResponse.error?.localizedDescription ?? "unkown error")
                return
            }
            
            self.label.text = json["data"] as? String
            
        }
        
    }
    


}


























