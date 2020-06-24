//
//  ContentView.swift
//  AppEssentialsInSwiftUI
//
//  Created by Daniel Saidi on 2020-06-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!").padding()
    }
}

struct PlacesCommands: Commands {
    
    @FocusedBinding(\.selectedPlace) private var selectedPlace: String?
    
    var body: some Commands {
        CommandMenu("Places") {
            Section {
                Button("One", action: {}).keyboardShortcut("i")
                Button("Two", action: {}).keyboardShortcut("i")
            }.disabled(selectedPlace == nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
