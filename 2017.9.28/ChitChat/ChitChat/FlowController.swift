//
//  FlowController.swift
//  ChitChat
//
//  Created by Benny Davidovitz on 25/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

class FlowController{
    static let shared = FlowController()
    
    weak var window : UIWindow?
    
    private init(){
        
    }
    
    private func requestNotificationAuthorization(){
        //let action = UNNotificationAction(identifier: "reminder", title: "יותר מאוחר", options: .authenticationRequired)
        
        let action = UNTextInputNotificationAction(identifier: "reply", title: "השב", options: .authenticationRequired, textInputButtonTitle: "שלח", textInputPlaceholder: "תוכן ההודעה")
        
        let category = UNNotificationCategory(identifier: "cat", actions: [action], intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted{
                //request device token
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
    
    func determineRoot(){
        let didLogin = Auth.auth().currentUser != nil
        
        if didLogin{
            self.requestNotificationAuthorization()
        }
        
        let name = didLogin ? "Main" : "Login"
        let storyboard = UIStoryboard(name: name, bundle: .main)
        let rootVC = storyboard.instantiateInitialViewController()
        
        window?.rootViewController = rootVC
    }
}
















