//
//  ThePushNotificationPrimerApp.swift
//  ThePushNotificationPrimer
//
//  Created by Daniel Saidi on 2020-06-26.
//

/**
 
 Alert Notification Payload:
 
 {
     "aps" : {
        "alert" : {
             "title" : "Check out our new special!",
             "body" : "Avocado Bacon Burger on sale"
         },
         "sound" : "default",
         "badge" : 1,
    },
     "special" : "avocado_bacon_burger",
     "price" : "9.99"
 }
 
 Backgound Notification Payload:
 
 {
     "aps" : {
        "content-available" : 1
     },
     "myCustomKey" : "myCustomData"
 }

 */

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UIApplication.shared.registerForRemoteNotifications()
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(deviceToken)
        forwardTokenToServer(token: deviceToken)
    }
    
    
    // Used for alert notifications
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        guard let specialName = userInfo["special"] as? String,
              let specialPriceString = userInfo["price"] as? String,
              let specialPrice = Float(specialPriceString) else {
            // Always call the completion handler when done.
            completionHandler()
            return
        }
        // Handle the variables
        completionHandler()
     }
    
    
    // Used for background notifications
    
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable : Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        guard let url = URL(string: "www.example.com/todays-menu") else { return completionHandler(.failed) }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return completionHandler(.noData) }
            //updateMenu(withData: data)
            completionHandler(.newData)
        }
    }
    
    
    
    func forwardTokenToServer(token: Data) {
        let tokenComponents = token.map { data in String(format: "%02.2hhx", data) }
        let deviceTokenString = tokenComponents.joined()
        let queryItems = [URLQueryItem(name: "deviceToken", value: deviceTokenString)]
        var urlComps = URLComponents(string: "www.example.com/register")
        urlComps?.queryItems = queryItems
        guard let url = urlComps?.url else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle data
        }
        task.resume()
    }
}

@main
struct ThePushNotificationPrimerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear(perform: askForPermission)
        }
    }
    
    func askForPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("Permission granted: \(granted)")
        }
    }
}
