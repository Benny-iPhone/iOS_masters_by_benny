//
//  VictimViewController.swift
//  HitListByArya
//
//  Created by Benny Davidovitz on 04/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class VictimViewController: UIViewController {

    @IBOutlet weak var firstnameTextField: UITextField!
    
    @IBOutlet weak var lastnameTextField: UITextField!
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //open keyboard
        firstnameTextField.becomeFirstResponder()
        
        //create camera button
        let cameraButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(takePictureAction))
        navigationItem.rightBarButtonItem = cameraButton
        
        //setup title
        navigationItem.title = "Create"
    }
    
    func takePictureAction(){
        
        let picker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        picker.delegate = self
        
        self.present(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        //create new Victim object in relevant database
        let v = Victim(context: DBManager.manager.persistentContainer.viewContext)
        
        v.firstName = firstnameTextField.text
        v.lastName = lastnameTextField.text
        v.date = NSDate()
        v.isAlive = true
        
        v.image = pictureImageView.image
        
        DBManager.manager.saveContext()
        
        //back to table-view controller
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func tapAction(_ sender: Any) {
        
        //self.view.endEditing(true)
        
        //close keyboard
        firstnameTextField.resignFirstResponder()
        lastnameTextField.resignFirstResponder()
        
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


extension VictimViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        pictureImageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}



















