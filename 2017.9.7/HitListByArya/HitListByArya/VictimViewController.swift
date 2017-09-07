//
//  VictimViewController.swift
//  HitListByArya
//
//  Created by Benny Davidovitz on 04/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class VictimViewController: UIViewController {
    
    var object : Victim?

    var didUpdatePicture : Bool = false
    
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
        
        if let object = object{
            //object is not nil => update mode
            firstnameTextField.text = object.firstName
            lastnameTextField.text = object.lastName
            pictureImageView.image = object.image
            
            submitButton.setTitle("Update wish list", for: .normal)
            
            //setup title
            navigationItem.title = "Update"
        } else {
            //object is nil => create mode
            
            submitButton.setTitle("Add to wish list", for: .normal)
            //setup title
            navigationItem.title = "Create"
        }
        
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
    @IBAction func longPressAction(_ sender: UILongPressGestureRecognizer) {
        
        guard sender.state == .ended else{
            return
        }
        
        pictureImageView.image = nil
        didUpdatePicture = true
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        //create new Victim if object is nil in relevant database
        //if object is not nil, just update it
        let v = object ?? Victim(context: DBManager.manager.persistentContainer.viewContext)
        
        v.firstName = firstnameTextField.text
        v.lastName = lastnameTextField.text
        v.date = NSDate()
        v.isAlive = true
        
        if didUpdatePicture{
            v.image = pictureImageView.image
        }
        
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
        
        self.didUpdatePicture = true
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}



















