//
//  ContentView.swift
//  MeetNearbyInteraction
//
//  Created by Daniel Saidi on 2020-06-23.
//  https://developer.apple.com/documentation/nearbyinteraction
//
//  NOTE: This doesn't work! Each peer need separate session
//  instances and must exchange tokens in some way. Read the
//  docs at the link above! :)

import SwiftUI
import NearbyInteraction

struct ContentView: View {
    
    var body: some View {
        Text("\(SessionContext.shared.objectCount) nearby objects")
            .padding()
            .onAppear { setup() }
    }
}

extension ContentView {
    
    func setup() {
        SessionManger.shared.start()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


class SessionContext: ObservableObject {
    
    @Published var objectCount = 0
    
    static var shared = SessionContext()
}

class SessionManger: NSObject, NISessionDelegate {
    
    let session = NISession()
    
    static var shared = SessionManger()
    
    @ObservedObject var context = SessionContext.shared
    
    func start() {
        session.delegate = self
    }
    
    func session(_ session: NISession, didUpdate nearbyObjects: [NINearbyObject]) {
        context.objectCount = nearbyObjects.count
        nearbyObjects.forEach {
            let peerToken = $0.discoveryToken
            let myToken = session.discoveryToken
            let configuration = NINearbyPeerConfiguration(peerToken: peerToken)
            session.run(configuration)
        }
    }
}
