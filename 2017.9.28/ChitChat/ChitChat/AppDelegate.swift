//
//  AppDelegate.swift
//  ChitChat
//
//  Created by Benny Davidovitz on 25/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UNUserNotificationCenter.current().delegate = self
        
        FirebaseApp.configure()
        
        FlowController.shared.window = window
        FlowController.shared.determineRoot()
        
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(deviceToken as NSData)
        Messaging.messaging().setAPNSToken(deviceToken, type: .sandbox)
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if let textRes = response as? UNTextInputNotificationResponse, response.actionIdentifier == "reply"{
            
            if let roomId = response.notification.request.content.userInfo["room_id"] as? String{
                DBManager.manager.sendNewMessage(with: textRes.userText, roomId: roomId)
            }
            
            //print(textRes.userText)
            
        }
        
        completionHandler()
        
    }
}

















