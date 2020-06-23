//
//  ContentView.swift
//  BuildSwiftUIAppsForTvOS
//
//  Created by Daniel Saidi on 2020-06-23.
//

import SwiftUI

enum Tab: String, CaseIterable, Identifiable {
    case home, second, third, fourth
    
    var id: String { rawValue }
}

struct ContentView: View {
    
    var tabs = Tab.allCases
    
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Home")
                        .tag(Tab.home)
                }
            Text("Second")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                        .tag(Tab.second)
                }
            Text("Third")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                        .tag(Tab.third)
                }
            Text("Fourth")
                .tabItem {
                    Image(systemName: "4.square.fill")
                    Text("Fourth")
                        .tag(Tab.fourth)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
