//
//  ContentView.swift
//  BuildDocumentBasedAppsInSwiftUI
//
//  Created by Daniel Saidi on 2020-06-26.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: BuildDocumentBasedAppsInSwiftUIDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(BuildDocumentBasedAppsInSwiftUIDocument()))
    }
}
