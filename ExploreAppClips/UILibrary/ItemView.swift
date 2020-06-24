//
//  ItemView.swift
//  UILibrary
//
//  Created by Daniel Saidi on 2020-06-24.
//

import SwiftUI

public struct ItemView: View {
    
    public init() {}
    
    public var body: some View {
        VStack {
            Color.blue.frame(height: 200)
            VStack {
                Text("Title").font(.title)
                Text("Text").font(.body)
            }
        }.cornerRadius(10.0)
        .padding(5.0)
        .background(Color.white)
        .cornerRadius(10.0)
        .shadow(radius: 2)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView().padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}
