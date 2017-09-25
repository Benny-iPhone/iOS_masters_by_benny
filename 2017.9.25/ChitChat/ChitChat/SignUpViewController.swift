//
//  SignUpViewController.swift
//  ChitChat
//
//  Created by Benny Davidovitz on 25/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var retypePasswordTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupAction(_ sender: Any) {
        guard let email = emailTextField.text else{
            return
        }
        
        guard let password = passwordTextField.text else{
            return
        }
        
        guard password == retypePasswordTextField.text else{
            return
        }
        
        guard let name = nameTextField.text, !name.isEmpty else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if let error = error{
                //failed
                print(error)
                return
            }
            
            //success
            let request = user?.createProfileChangeRequest()
            request?.displayName = name
            request?.commitChanges(completion: { (_) in
                
                //change to main flow
                FlowController.shared.determineRoot()
                
            })
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
