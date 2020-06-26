//
//  BuildDocumentBasedAppsInSwiftUIDocument.swift
//  BuildDocumentBasedAppsInSwiftUI
//
//  Created by Daniel Saidi on 2020-06-26.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var exampleText: UTType {
        UTType(importedAs: "com.example.plain-text")
    }
    static let exampleMyAppDoc: UTType =
        UTType(exportedAs: "com.example.MyApp.app")
}

struct BuildDocumentBasedAppsInSwiftUIDocument: FileDocument, Codable {

    init() {
        // The demo creates a bunch of shapes
    }

    static var readableContentTypes: [UTType] { [.exampleMyAppDoc] }

    init(fileWrapper: FileWrapper, contentType: UTType) throws {
        guard let data = fileWrapper.regularFileContents//,
        //       let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self = try JSONDecoder().decode(Self.self, from: data)
        
    }
    
    func write(to fileWrapper: inout FileWrapper, contentType: UTType) throws {
        // let data = text.data(using: .utf8)!
        let data = try JSONEncoder().encode(self)
        fileWrapper = FileWrapper(regularFileWithContents: data)
    }
}
