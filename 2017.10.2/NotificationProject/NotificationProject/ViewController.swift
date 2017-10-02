//
//  ViewController.swift
//  NotificationProject
//
//  Created by Benny Davidovitz on 02/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //schedule notification
    @IBAction func createAction(_ sender: Any) {
        
        var comps = Calendar.current.dateComponents(in: .current, from: datePicker.date)
        
        let newComps = DateComponents(calendar: .current, timeZone: .current, hour: comps.hour, minute: comps.minute)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComps, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = "תזכורת"
        if let text = textField.text, !text.isEmpty{
            content.body = text
        } else {
            content.body = "no text"
        }
        content.sound = UNNotificationSound.init(named: "sound.mp3")
        //content.sound = UNNotificationSound.default()
        content.badge = 3
        
        if let url = Bundle.main.url(forResource: "image", withExtension: "png"){
            if let attach = try? UNNotificationAttachment(identifier: "img", url: url, options: nil){
                content.attachments = [attach]
            }
        }
        
/*        content.title = """
            Row1
            Row2
"""*/
        
        let request = UNNotificationRequest(identifier: "42", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //request for permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge, .carPlay]) { (granted, err) in
            if granted{
                print("permission granted")
            } else {
                print("no permission \(err!)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}











