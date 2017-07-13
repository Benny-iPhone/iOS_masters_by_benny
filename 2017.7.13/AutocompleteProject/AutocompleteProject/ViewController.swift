//
//  ViewController.swift
//  AutocompleteProject
//
//  Created by Benny Davidovitz on 13/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import GooglePlaces
import CoreLocation
import MapKit

class ViewController: UIViewController {

    var manager = CLLocationManager()
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func findLocationAction(_ sender: Any) {
        
        let client = GMSPlacesClient.shared()
        client.currentPlace { (list, error) in
            guard let list = list else{
                print(error ?? "unknown error")
                return
            }
            
            guard let place = list.likelihoods.first?.place else{
                return
            }
            
            self.label.text = place.formattedAddress
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addressTextField.delegate = self
        
        manager.requestWhenInUseAuthorization()
        
    }

    func showGoogleAutocomplete(){
        let controller = GMSAutocompleteViewController()
        controller.delegate = self
        //disaply
        self.present(controller, animated: true, completion: nil)
    }
    
}

extension ViewController : UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.showGoogleAutocomplete()
        print(#function)
        return false
    }
    
}

extension ViewController : GMSAutocompleteViewControllerDelegate{
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        viewController.dismiss(animated: true) { 
            self.addressTextField.text = place.name
        }
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print(error)
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}












