//
//  WhatsNewInWatchOSDesignApp.swift
//  WhatsNewInWatchOSDesign WatchKit Extension
//
//  Created by Daniel Saidi on 2020-06-26.
//

import SwiftUI

@main
struct WhatsNewInWatchOSDesignApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
