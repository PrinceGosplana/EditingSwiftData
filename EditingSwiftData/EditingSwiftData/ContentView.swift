//
//  ContentView.swift
//  EditingSwiftData
//
//  Created by OLEKSANDR ISAIEV on 26.12.2023.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    /*
    @Query(filter: #Predicate<User> { user in
//        user.name.contains("R") // will find only capitalized R
//        user.name.localizedStandardContains("R") &&// R or r
//        user.city == "London"
        if user.name.localizedStandardContains("R") {
            if user.city == "London" {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }, sort: \User.name) var users: [User]
    */
    @State private var path = [User]()
    @State private var showingUpcomingOnly = false
    @State private var sordOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    var body: some View {
        NavigationStack(path: $path) {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sordOrder)
            /*
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            */
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                Button("Add user", systemImage: "plus") {
                    let user = User(name: "", city: "", joinDate: .now)
                    modelContext.insert(user)
                    path = [user]
                }
                
                Button(showingUpcomingOnly ? "Show Everyone" : "Show upcoming") {
                    showingUpcomingOnly.toggle()
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sordOrder) {
                        Text("Sort by name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        Text("Sort by join date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
