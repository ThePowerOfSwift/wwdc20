//
//  BuildDocumentBasedAppsInSwiftUIApp.swift
//  BuildDocumentBasedAppsInSwiftUI
//
//  Created by Daniel Saidi on 2020-06-26.
//

/**
 
 `Document Types` are used by the system to be
 able to open the file type in your app.
 
 `Imported Type Identifiers` has this type added.
 We declare the type as a plain text type.
 
 Rename the id from `com.example.plain-text` to
 `com.example.MyApp.app`.
 
 To publish this type and be the authorative creator
 create an `Exported Type Identifier`.
 
 
 
 
 
 
 */

import SwiftUI

@main
struct BuildDocumentBasedAppsInSwiftUIApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: BuildDocumentBasedAppsInSwiftUIDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
