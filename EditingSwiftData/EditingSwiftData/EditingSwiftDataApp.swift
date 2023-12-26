//
//  EditingSwiftDataApp.swift
//  EditingSwiftData
//
//  Created by OLEKSANDR ISAIEV on 26.12.2023.
//

import SwiftData
import SwiftUI

@main
struct EditingSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
