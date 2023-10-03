//
//  NotificationManager.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 29/09/2023.
//

import Foundation
import UIKit

class NotificationManager {
    
    // Create Notificaiton
    static func createNotification(tracker: Tracker) {
        self.checkForNotificationPermission(tracker: tracker)
    }
    
    // Request permission
    static func checkForNotificationPermission(tracker: Tracker) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { setting in
            print(setting.authorizationStatus)
            switch setting.authorizationStatus {
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.sound, .alert]) { allow, error in
                    if allow  {
                        print("Allowed")
                        self.scheduleNotification(tracker: tracker)
                        return
                    }
                }
            case .authorized:
                self.scheduleNotification(tracker: tracker)
                return
            default:
                return
            }
        }
    }

    // Schedule notification
    static func scheduleNotification(tracker: Tracker) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.removePendingNotificationRequests(withIdentifiers: ["notifytracker"])
        
        let (saving, _, _) = tracker.getCurrentRecords()
        let content = UNMutableNotificationContent()
        content.title = "Money Tracker"
        content.body = "Your current saving amount is \(saving)"
        content.sound = .default
        
        let calendar = Calendar.current
        let now = Date()
        var dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: now)
        dateComponents.month! += 1
        dateComponents.day = 1
        dateComponents.hour = 7
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notifytracker", content: content, trigger: trigger)
        
        notificationCenter.add(request) { error in
            if let error = error {
                return
            }
        }
    }
}
