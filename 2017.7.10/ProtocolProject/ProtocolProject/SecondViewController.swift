//
//  SecondViewController.swift
//  ProtocolProject
//
//  Created by Benny Davidovitz on 10/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
    
    func secondViewController(_ controller : SecondViewController, didTypeText text : String?)
    
}

class SecondViewController: UIViewController {

    var str : String?
    var delegate : SecondViewControllerDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editingChangedAction(_ sender: Any) {
        
        delegate?.secondViewController(self, didTypeText: textField.text)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.text = str
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
