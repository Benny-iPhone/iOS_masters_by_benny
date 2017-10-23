//
//  Branch.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 16/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class Branch: NSObject {
    let name : String
    let location : CLLocation
    
    init(name : String,
         latitude : CLLocationDegrees,
         longitude : CLLocationDegrees) {
        
        self.name = name
        self.location = CLLocation(latitude: latitude, longitude: longitude)
        
        super.init()
        
    }
    
    class func allBranches() -> [Branch]
    {
        return [
            Branch(name: "Azrieli", latitude: 32.0740814, longitude: 34.7900141),
            Branch(name: "Dolphins Reef", latitude: 29.5265179, longitude: 34.9339661),
            Branch(name: "HackerU", latitude: 32.0844269, longitude: 34.7985299),
            Branch(name: "Times Square", latitude: 40.758899, longitude: -73.9873197),
            Branch(name: "Ko Samui", latitude: 9.551546, longitude: 99.5901912),
            Branch(name: "Apple Inc.", latitude: 37.43549370, longitude: -122.24325056),
            Branch(name: "Stanford", latitude: 37.4274787, longitude: -122.1719077)
        ]
    }
    
}


extension Branch : MKAnnotation{
    var coordinate : CLLocationCoordinate2D{
        return self.location.coordinate
    }
    
    var title : String?{
        return self.name
    }
    
    
    
}


















