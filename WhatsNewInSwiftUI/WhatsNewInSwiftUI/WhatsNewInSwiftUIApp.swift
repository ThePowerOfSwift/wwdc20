//
//  WhatsNewInSwiftUIApp.swift
//  WhatsNewInSwiftUI
//
//  Created by Daniel Saidi on 2020-06-23.
//

/**
 `NOTES`
 Widgets
 StateObject
 ToolbarItem
 Label
 .help
 .keyboardShortcut
 .listItemTint
 AppAccentColor
 Link(destination: URL)
 @Environment(\.openUrl) private var openURL
 .onDrag { xxx.itemProvider }
 .onDrop(of [.xxx]) { ... }
 UniformTypeIdentifiers
 
 extension UTType {
     static let myFileFormat = UTType(exportedAs: "com.danielsaidi...")
 }
 
 imported/exported types
 
 App Essentials in SwiftUI
 Build SwiftUI Views for Widgets
 */

import SwiftUI

@main
struct WhatsNewInSwiftUIApp: App {
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            ContentView()
        }.commands {
            CommandMenu("Shape") {
                Button("Add Shape...", action: { print("Foo") }).keyboardShortcut("N")
                Button("Add Text", action: { print("Foo") }).keyboardShortcut("T")
            }
        }
        
        // DocumentGroup(newDocument: Document()) { file in
        //     DocumentGroup(file.$document)
        // }
        
        #if os(macOS)
        Settings {
            Text("")
        }
        #endif
    }
}
