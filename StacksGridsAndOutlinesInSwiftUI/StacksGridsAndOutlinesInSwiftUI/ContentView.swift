//
//  ContentView.swift
//  StacksGridsAndOutlinesInSwiftUI
//
//  Created by Daniel Saidi on 2020-06-26.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        personGroups = [
            PersonGroup(name: "Group 1", persons: persons),
            PersonGroup(name: "Group 2", persons: persons),
            PersonGroup(name: "Group 3", persons: persons)
        ]
    }
    
    let numbers = [1, 2, 3, 4, 5, 6]
    
    let persons = [
        Person(name: "Single guy", children: nil),
        Person(name: "Married guy", children: [
            Person(name: "Daughter", children: []),
            Person(name: "Son", children: [])
        ]),
        Person(name: "Single girl", children: [])
    ]
    
    var personGroups = [PersonGroup]()
    
    var columns = [
        GridItem(spacing: 10),
        GridItem(spacing: 10),
        GridItem(spacing: 10)
    ]
    
    var adaptive = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        
        // Various grids
        
//        ScrollView {
//            LazyVGrid(columns: columns, spacing: 10) {
//                NumberCells(numbers: numbers)
//            }
//
//            LazyVGrid(columns: adaptive, spacing: 10) {
//                NumberCells(numbers: numbers)
//            }
//        }
        
        
        // Tree
        
//        List(persons, children: \.children) {
//            Text($0.name)
//        }
        
        
        // OutlineGroup
        
//        List {
//            ForEach(personGroups) { group in
//                Section(header: Text(group.name)) {
//                    OutlineGroup(group.persons, children: \.children) {
//                        Text($0.name)
//                    }
//                }
//            }
//        }.listStyle(SidebarListStyle())
        
        
        // Form
        
        Form {
            DisclosureGroup {
                Toggle("Do it", isOn: .constant(true))
                Toggle("Do it", isOn: .constant(true))
            } label: { Label("Foo", systemImage: "star") }
        }
        
        
        
        // List
        
//        List {
//            NumberCells(numbers: numbers)
//        }
        
        
        // List of lists
        
//         List(numbers, id: \.self) {
//             NumberCells(numbers: numbers)
//         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct Person: Identifiable {
    
    let name: String
    let children: [Person]?
    
    var id: String { name }
}

struct PersonGroup: Identifiable {
    
    let name: String
    let persons: [Person]
    
    var id: String { name }
}

struct NumberCells: View {
    
    let numbers: [Int]
    
    var body: some View {
        ForEach(numbers, id: \.self) {
            Text("\($0)")
                .frame(maxWidth: .infinity)
                .background(Color.red)
        }
    }
}
