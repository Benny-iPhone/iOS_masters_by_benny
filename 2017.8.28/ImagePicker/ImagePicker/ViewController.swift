//
//  ViewController.swift
//  ImagePicker
//
//  Created by Benny Davidovitz on 28/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func buttonPressed(_ sender: Any) {
        
        let sheet = UIAlertController(title: "Select Source", message: nil, preferredStyle: .actionSheet)
        
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        func handler(_ action : UIAlertAction){
            
            let picker = UIImagePickerController()
            
            switch action.title! {
            case "Rear Camera":
                picker.sourceType = .camera
                picker.cameraDevice = .rear
            case "Selfie Camera":
                if UIImagePickerController.isCameraDeviceAvailable(.front){
                    picker.sourceType = .camera
                    picker.cameraDevice = .front
                } else {
                    picker.sourceType = .photoLibrary
                }
            case "Album":
                picker.sourceType = .photoLibrary
            default:
                return
            }
            
            picker.allowsEditing = true
            picker.delegate = self
            
            self.present(picker, animated: true, completion: nil)
            
            
        }
        
        let rearCameraAction = UIAlertAction(title: "Rear Camera", style: .default, handler: handler)
        rearCameraAction.setValue(#imageLiteral(resourceName: "icons8-camera"), forKey: "image")
        sheet.addAction(rearCameraAction)
        
        let frontCameraAction = UIAlertAction(title: "Selfie Camera", style: .default, handler: handler)
        frontCameraAction.setValue(#imageLiteral(resourceName: "icons8-selfie"), forKey: "image")
        sheet.addAction(frontCameraAction)
        
        let photoLibraryAction = UIAlertAction(title: "Album", style: .destructive, handler: handler)
        photoLibraryAction.setValue(#imageLiteral(resourceName: "icons8-art_track"), forKey: "image")
        sheet.addAction(photoLibraryAction)
        
        self.present(sheet, animated: true, completion: nil)
        
    }
    


}


extension ViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        //take edited image if not nil, if nil - take original image
        let image = editedImage ?? originalImage
        
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
}





















