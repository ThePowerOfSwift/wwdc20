//
//  HomeScreen.swift
//  BuildSwiftUIAppsForTvOS
//
//  Created by Daniel Saidi on 2020-06-23.
//

import SwiftUI

struct HomeScreen: View {
    
    @Environment(\.resetFocus) var resetFocus
    @Namespace private var namespace
    
    var body: some View {
        HStack {
            Button(action: {}) {
                Text("Custom")
                    .padding()
                    .background(Color.green)
            }.background(Color.green)
            .buttonStyle(MyButtonStyle())
            .prefersDefaultFocus(false, in: namespace)
            
            Button(action: { /*resetFocus(in: namespace)*/ }) {
                ButtonView()
            }
            .prefersDefaultFocus(true, in: namespace)
            .buttonStyle(CardButtonStyle())
            .contextMenu {
                Text("Menu Item 1")
                Text("Menu Item 2")
                Text("Menu Item 3")
            }.onPlayPauseCommand { print("Play/pause") }
        }.focusScope(namespace)
    }
}

struct ButtonView: View {
    
    @Environment(\.isFocused) var isFocused: Bool
    
    var body: some View {
        ZStack {
            Color.red.frame(width: 300, height: 200, alignment: .center).cornerRadius(20)
            Text(isFocused ? "DO ME!" : "FOCUS ME!")
        }
    }
}

struct MyButtonStyle: ButtonStyle {
        
    func makeBody(configuration: Configuration) -> some View {
        let pressScale: CGFloat = configuration.isPressed ? 1.2 : 1.0
        return configuration.label
            .scaleEffect(x: pressScale, y: pressScale, anchor: .center)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
