//
//  AppManager.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 23/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CoreLocation

extension Notification.Name{
    static var locationUpdate : Notification.Name{
        return Notification.Name(rawValue: "location_update_notification")
    }
}

class AppManager: NSObject , CLLocationManagerDelegate{
    static let manager = AppManager()
    
    private let locationManager : CLLocationManager
    var location : CLLocation?{
        return locationManager.location
    }
    
    private override init() {
        locationManager = CLLocationManager()
        super.init()
        
        locationManager.distanceFilter = 10 //meters
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.activityType = .automotiveNavigation
        locationManager.delegate = self
    }
    
    func startLocation(){
        let authStatus = CLLocationManager.authorizationStatus()
        switch authStatus {
        case .denied:
            print("user denied")
        case .restricted:
            print("restricted")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations[0])
        
        NotificationCenter.default.post(name: .locationUpdate, object: self)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
















