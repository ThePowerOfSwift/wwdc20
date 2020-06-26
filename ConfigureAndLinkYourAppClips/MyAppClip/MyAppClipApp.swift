//
//  MyAppClipApp.swift
//  MyAppClip
//
//  Created by Daniel Saidi on 2020-06-25.
//

import SwiftUI

@main
struct MyAppClipApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
                guard
                    let incomingURL = userActivity.webpageURL,
                    let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true)
                else { return }
                if let item = components.queryItems?.first(where: { $0.name == "item" }) {
                    print("Item link for #\(item.value)")
                } else {
                    print("Unknown link: \(userActivity.webpageURL)")
                }
                
                

                /**
                 Notes:
                 Direct to the linked content in your app clip.
                 Once the user installs the app, this must be handled by the app as well.
                 Check out the run scheme for how to inject test urls
                 */
            }
        }
    }
}
