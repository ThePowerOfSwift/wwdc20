//
//  ContentView.swift
//  MyAppClip
//
//  Created by Daniel Saidi on 2020-06-24.
//
//  ASAuthorizationController for sign in
//

import SwiftUI
import UILibrary
import StoreKit
import AuthenticationServices   // <- ASAuthorizationController

struct ContentView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            ItemView()
                .appStoreOverlay(
                    isPresented: $isPresented) { () -> SKOverlay.Configuration in
                    SKOverlay.AppClipConfiguration(position: .bottom)
                }
            Button("Show App Store Link") { self.isPresented.toggle() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
