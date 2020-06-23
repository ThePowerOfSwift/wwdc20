//
//  ContentView.swift
//  WhatsNewInSwiftUI
//
//  Created by Daniel Saidi on 2020-06-23.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    
    @Namespace private var namespace
    
    @ScaledMetric private var padding: CGFloat = 1
    
    @State var picked = ""
    @State var text = "A list"
    @State var percent = 0.1
    
    @State var items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    @State var selectedItems = [Int]()
    
    var body: some View {
        NavigationView {
            ScrollView {
                SignInWithAppleButton(.signUp, onRequest: { _ in }, onCompletion: { _ in })
                    .signInWithAppleButtonStyle(.black)
                // Label(text, systemImage: "heart")
                // ProgressView()
                // ProgressView("Foo", value: percent, total: 1).progressViewStyle(LinearProgressViewStyle())
                // ProgressView("Bar", value: percent, total: 1).progressViewStyle(CircularProgressViewStyle())
                // Gauge(value: percent, in: 0...1) {
                //     Label("Gauge", systemImage: "drop.fill").foregroundColor(.green)
                // } currentValueLabel, minimumValueLabel, maximumValueLabel
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 00, maximum: 200))]) {
                    list(for: items)
                }
                LazyHStack {
                    list(for: selectedItems)
                }.frame(height: 100)
            }
            .animation(.easeIn)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker("Picker", selection: $picked) {
                        Text("One").tag("One")
                        Text("Two").tag("Two")
                    }.pickerStyle(SegmentedPickerStyle())
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("ACTION 2", action: { text = "Did tap 2" }).keyboardShortcut("P")
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("ACTION 3", action: {})
                        .help("HELP!")
                }
            }//.navigationTitle("What's new in SwiftUI")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

extension ContentView {
    
    func toggleSelection(for item: Int) {
        if items.contains(item) {
            items = items.filter { $0 != item }
            selectedItems.append(item)
        } else {
            selectedItems = selectedItems.filter { $0 != item }
            items.append(item)
        }
    }
    
    func list(for items: [Int]) -> some View {
        ForEach(items, id: \.self) { item in
            Image.init(systemName: "heart")
                .resizable()
                .scaledToFit()
                .background(Color.red)
                .cornerRadius(20)
                .clipShape(ContainerRelativeShape())
                .padding(3)
                .onTapGesture { self.toggleSelection(for: item) }
                .matchedGeometryEffect(id: item, in: namespace)
        }.background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
