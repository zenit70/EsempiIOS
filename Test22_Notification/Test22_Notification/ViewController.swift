//
//  ViewController.swift
//  Test22_Notification
//
//  Created by Ospite on 06/06/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit
// libreria  per notifiche
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    var message = "Esame di stato"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Richiesta autorizzazione. Se l'app crasha bisogna aggiungere ad info.plist la richiesta
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {(granted, error) in /* gestione errore */})
        UNUserNotificationCenter.current().delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case "repeat":
            self.sendNotification()
        case "change":
            let textResponse = response as! UNTextInputNotificationResponse
            message = textResponse.userText
            //self.sendNotification()
        default:
            break
        }
        completionHandler()
    }

    @IBAction func btnSendNotification(_ sender: UIButton) {
        sendNotification()
    }
    
    @IBAction func btnDeleteNotification(_ sender: UIButton) {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["notificationTest"])
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Notifica"
        content.subtitle = message
        content.body = "Prova di tapping: allenati!"
        content.badge = 1
        
        let repeatAction = UNNotificationAction(identifier: "repeat", title: "Ripeti", options: [])
        let changeAction = UNTextInputNotificationAction(identifier: "change", title: "Modifica", options: [])
        let category = UNNotificationCategory(identifier: "category", actions: [repeatAction, changeAction], intentIdentifiers: [], options: [])
        content.categoryIdentifier = "category"
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        // ritarda la notifica
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let requestIdentifier = "notificationTest"
        // richiesta di notifica
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        // append della notifica al sistma
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {(error) in /* gestione errore */})
    }

}

