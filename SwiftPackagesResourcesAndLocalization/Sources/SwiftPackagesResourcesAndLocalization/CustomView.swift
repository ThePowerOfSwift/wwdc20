//
//  CustomView.swift
//  
//
//  Created by Daniel Saidi on 2020-06-24.
//

import SwiftUI

struct CustomView: View {
    var body: some View {
        VStack {
            Image("pig", bundle: .module)
            Text("Pig", bundle: .module)
        }
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
            .environment(\.locale, .init(identifier: "fr"))
    }
}
