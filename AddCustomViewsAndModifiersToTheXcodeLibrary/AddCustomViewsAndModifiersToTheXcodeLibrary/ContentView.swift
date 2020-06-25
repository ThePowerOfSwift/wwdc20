//
//  ContentView.swift
//  AddCustomViewsAndModifiersToTheXcodeLibrary
//
//  Created by Daniel Saidi on 2020-06-25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!").padding()
            Text("Hello, world!")
            Image("").resizable(resizingMode: .stretch)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LibraryContent: LibraryContentProvider {
    
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(
            Text("Hello, world!"),
            visible: true,
            title: "Hello, you!",
            category: .control)
    }
    
    @LibraryContentBuilder
    func modifiers(base: Image) -> [LibraryItem] {
        LibraryItem(
            base.resizable(resizingMode: .stretch),
            title: "Resized to stretch"
        )
    }
}

