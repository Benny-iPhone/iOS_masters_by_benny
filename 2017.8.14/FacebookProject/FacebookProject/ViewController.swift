//
//  ViewController.swift
//  FacebookProject
//
//  Created by Benny Davidovitz on 14/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = LoginButton(readPermissions: [.publicProfile, .email, .userFriends])
        loginButton.center = self.view.center
        
        self.view.addSubview(loginButton)
        
        pictureImageView.layer.masksToBounds = true
    }

    @IBAction func getUserInfoAction(_ sender: Any) {
        let params : [String:Any] = [
            "fields":"id,name,cover,gender,email,picture.type(large),music"
        ]
        //let request = GraphRequest(graphPath: "/me")
        let request = GraphRequest(graphPath: "/me", parameters: params)
        request.start { (httpRes, result) in
            switch result{
            case .success(let response):
                print(response)
                self.handleMe(response.dictionaryValue)
            case .failed(let err):
                print(err)
            }
        }
    }
    
    func handleMe(_ dict : [String:Any]?){
        guard let dict = dict else{
            return
        }
        //name
        nameLabel.text = dict["name"] as? String
        
        //cover photo
        if let cover = dict["cover"] as? [String:Any],
            let sourceStr = cover["source"] as? String,
            let url = URL(string: sourceStr){
            
            coverImageView.sd_setImage(with: url)
            
        }
        
        //profile picture
        if let picture = dict["picture"] as? [String:Any],
        let data = picture["data"] as? [String:Any],
        let urlString = data["url"] as? String,
            let url = URL(string: urlString){
            pictureImageView.sd_setImage(with: url)
        }
    }


}






