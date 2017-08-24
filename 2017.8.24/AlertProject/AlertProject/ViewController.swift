//
//  ViewController.swift
//  AlertProject
//
//  Created by Benny Davidovitz on 21/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Alamofire
import AVFoundation
import ReachabilitySwift

class ViewController: UIViewController {
    
    let reachability = Reachability()!
    var player : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reachability.whenUnreachable = { r in
            self.twoButtonsAction(r)
        }
        
        try? reachability.startNotifier()
        
        guard let url = Bundle.main.url(forResource: "login", withExtension: "mp3") else{
            return
        }
        player = try? AVAudioPlayer(contentsOf: url)
    }

    @IBAction func loginAlertAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Login", message: nil, preferredStyle: .alert)
        
        alert.addTextField {
            $0.placeholder = "username"
        }
        
        alert.addTextField {
            $0.placeholder = "password"
            $0.isSecureTextEntry = true
        }
        
        alert.addAction(UIAlertAction(title: "Later", style: .cancel, handler: nil))
        
        func handler(_ action : UIAlertAction){
            guard let username = alert.textFields?.first?.text, !username.isEmpty,
                let password = alert.textFields?.last?.text, !password.isEmpty
            else{
                return
            }
            
            let url = "http://5.189.170.57/api/login.php"
            let params : [String:Any] = [
                "username":username,
                "password":password
            ]
            
            Alamofire.request(url, method: .get, parameters: params).responseJSON { (dataRes) in
                
                guard let json = dataRes.result.value as? [String:Any] else{
                    print(dataRes.error?.localizedDescription ?? "unkown error")
                    return
                }
                
                if let code = json["code"] as? Int, code == 1{
                    print("login success")
                    self.player?.play()
                } else {
                    print("login failed")
                }
                
                print(json)
                
            }
            
            /*
            if username == "user" && password == "P455W0RD"{
                print("success")
            } else{
                print("failed")
            }*/
            
        }
        
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: handler))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func alertWithTextFieldAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Type Name", message: nil, preferredStyle: .alert)
        
        alert.addTextField { //(textField) in
            $0.placeholder = "your name"
            $0.clearButtonMode = .always
        }
                
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        func handler(_ action : UIAlertAction){
            
            guard let text = alert.textFields?.first?.text, !text.isEmpty else{
                return
            }
            
            sender.setTitle(text, for: .normal)
            
        }
        
        let submitAction = UIAlertAction(title: "Submit", style: .destructive, handler: handler)
        alert.addAction(submitAction)
        
        alert.view.tintColor = .orange
        
        self.present(alert, animated: true) { 
            alert.view.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        }
        
        
        
    }
    
    @IBAction func twoButtonsAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Error", message: "No internet connection", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) in
            print("going to settings")
            guard let url = URL(string: "App-Prefs:root=WIFI"  /*UIApplicationOpenSettingsURLString*/) else{
                return
            }
            
            let app = UIApplication.shared
            guard app.canOpenURL(url) else{
                print("can't open url \(url)")
                return
            }
            
            app.open(url, options: [:], completionHandler: nil)
        }
        
        let image = #imageLiteral(resourceName: "icons8-settings")
        //KVC - Key Value Coding
        settingsAction.setValue(image, forKey: "image")
        
        alert.addAction(settingsAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func simpleAlertAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "yo!", message: "sup?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    


}
















