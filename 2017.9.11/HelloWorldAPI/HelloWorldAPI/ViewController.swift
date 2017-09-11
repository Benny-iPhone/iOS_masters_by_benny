//
//  ViewController.swift
//  HelloWorldAPI
//
//  Created by Benny Davidovitz on 11/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        func handle(str : String?){
            guard Thread.isMainThread else{
                DispatchQueue.main.async {
                    handle(str: str)
                }
                return
            }
            
            label.text = str
        }
        
        
        guard var name = nameTextField.text, !name.isEmpty else{
            handle(str: "please type a name")
            return
        }
        
        name = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        
        
        let urlString = "http://5.189.170.57/api/hello2.php?name=" + name
        let url = URL(string: urlString)!
        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        
        /*
         //in post request set the data in httpBody
        request.httpMethod = "POST"
        request.httpBody =
        */
        
        //request.setValue("123", forHTTPHeaderField: "user_id")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                handle(str: error?.localizedDescription)
                return
            }
            
            //handle data
            guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else{
                handle(str: "data is not a valid json")
                return
            }
            
            guard let dict = json as? [String:Any] else{
                handle(str: "json is not a dictionary")
                return
            }
            
            //more validations...
            
            let str = dict["data"] as? String
            handle(str: str)
            
            
        }.resume()
        
        handle(str: "sending request")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}







