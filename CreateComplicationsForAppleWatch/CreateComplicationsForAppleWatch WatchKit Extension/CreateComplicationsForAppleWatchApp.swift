//
//  CreateComplicationsForAppleWatchApp.swift
//  CreateComplicationsForAppleWatch WatchKit Extension
//
//  Created by Daniel Saidi on 2020-06-24.
//
//  CLKComplicationDataSource
//

import SwiftUI
import ClockKit

@main
struct CreateComplicationsForAppleWatchApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
        
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

struct Item: Identifiable {
    
    var id: String
    var name: String
}


private class CodeDump {
    
    var descriptors: [CLKComplicationDescriptor]
    var dataDict = Dictionary<AnyHashable, Any>()
    var items = [Item]()
    
    func main() {
        items.forEach {
            dataDict = ["name": $0.name]
            descriptors.append(
                CLKComplicationDescriptor(
                    identifier: $0.name,
                    displayName: $0.name,
                    supportedFamilies: CLKComplicationFamily.allCases,
                    userInfo: dataDict)
            )
            
            descriptors.append(
                CLKComplicationDescriptor(
                    identifier: "NewItem",
                    displayName: "New item",
                    supportedFamilies: [.circularSmall])
            )
            
            descriptors.append(
                CLKComplicationDescriptor(
                    identifier: "List",
                    displayName: "List",
                    supportedFamilies: CLKComplicationFamily.allCases)
            )
            
            // handle(descriptors)
            
            CLKComplicationServer.sharedInstance().reloadComplicationDescriptors()
            
            // getCurrentTimelineEntry(for:withHandler:)
            // getTimelineEndDate(for:withHandler:)
            // getLocalizableSampleTemplate(for:withHandler:)
        }
    }
}
