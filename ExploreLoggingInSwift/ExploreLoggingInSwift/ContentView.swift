//
//  ContentView.swift
//  ExploreLoggingInSwift
//
//  Created by Daniel Saidi on 2020-06-25.
//

/**
 To retrieve logs, connect device and run:
 log collect --device --start '2020-06-18 09:41:00' --output my.logarchive
 
 */

import SwiftUI
import os

struct ContentView: View {
    
    let logger = Logger(subsystem: "com.danielsaidi.Wally", category: "home")
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                logger.log(level: .debug, "Did it!")
                logger.log(level: .debug, "Did it \("Daniel", privacy: .public)!")
                logger.log(level: .debug, "Did it \("Daniel", privacy: .private(mask: .hash))!")
                logger.log(level: .debug, "Did it \("Daniel", align: .left(columns: 2))!")
                logger.log(level: .debug, "Did it \(1234.1234, format: .fixed(precision: 2))!")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
