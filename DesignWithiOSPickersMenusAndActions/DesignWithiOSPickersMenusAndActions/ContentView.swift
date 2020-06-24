//
//  ContentView.swift
//  DesignWithiOSPickersMenusAndActions
//
//  Created by Daniel Saidi on 2020-06-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var date = Date()
    @State private var color = Color.blue
    
    var body: some View {
        ScrollView {
            VStack {
                Button(action: { print("Button") }) {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }.contextMenu {
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 3")
                }
                
                DatePicker("Date", selection: $date, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(CompactDatePickerStyle())

                ColorPicker("Color", selection: $color)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
