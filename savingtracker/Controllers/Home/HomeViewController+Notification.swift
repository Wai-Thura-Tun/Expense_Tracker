//
//  HomeViewController+Notification.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 28/09/2023.
//

import Foundation
import UIKit

extension HomeViewController {
    func checkForNotificationPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { setting in
            print(setting.authorizationStatus)
            switch setting.authorizationStatus {
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.sound, .alert]) { allow, error in
                    if allow  {
                        print("Allowed")
                        self.scheduleNotification()
                        return
                    }
                }
            case .authorized:
                self.scheduleNotification()
                return
            default:
                return
            }
        }
    }

    func scheduleNotification() {
        let (saving, _, _) = self.tracker.getCurrentRecords()
        let content = UNMutableNotificationContent()
        content.title = "Money Tracker"
        content.body = "Your current saving amount is \(saving)"
        content.sound = .default
        
        let calendar = Calendar.current
        let now = Date()
        var dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: now)
        dateComponents.minute! = 59
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notifytracker", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
            else {
                print("Notification scheduled successfully")
            }
        }
    }

    func isNotificationSchedule() -> Bool {
        let notificationCenter = UNUserNotificationCenter.current()
        var isScheduled = false
        notificationCenter.getPendingNotificationRequests { requests in
            for request in requests {
                if request.identifier == "notifytracker" {
                    isScheduled = true
                    break
                }
            }
        }
        return isScheduled
    }

}
