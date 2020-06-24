//
//  ContentView.swift
//  IntroductionToSwiftUI
//
//  Created by Daniel Saidi on 2020-06-24.
//

/**
 This project only contains the parts that I wasn't familiar
 with since earlier.
 */

import SwiftUI

struct ContentView: View {
    
    @State private var isZoomed = false
    //@Environment(\.isEditing) var isEditing = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                
                Image(systemName: "heart")
                    .resizable()
                    .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
                    .aspectRatio(contentMode: isZoomed ? .fill : .fit)
                    .onTapGesture(perform: toggleMode)
                
                Spacer()
                
                if !isZoomed {
                    BottomBadge()
                }
            }
            .navigationTitle("Hello")
            .toolbar {
                #if os(iOS)
                EditButton()
                #endif
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

extension ContentView {
    
    func toggleMode() {
        isZoomed.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BottomBadge: View {
    var body: some View {
        HStack {
            Spacer()
            Label("Heart", systemImage: "heart")
            Spacer()
        }
        .padding(20)
        .colorScheme(.dark)
        .background(Color.primary)
        .transition(.move(edge: .bottom))
        .animation(.default)
    }
}
