//
//  ContentView.swift
//  WhatsNewInWatchOSDesign WatchKit Extension
//
//  Created by Daniel Saidi on 2020-06-26.
//

import SwiftUI

struct ContentView: View {
    
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    var body: some View {
        List {
            ForEach(numbers, id: \.self) {
                Text("\($0)")
            }.onDelete { indexSet in
                print(indexSet)
            }.toolbar {
                Button("More") { print("More") }
                Button("More") { print("More") }
                Button("More") { print("More") }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
