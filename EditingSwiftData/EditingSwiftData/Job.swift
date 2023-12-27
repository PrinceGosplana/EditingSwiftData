//
//  Job.swift
//  EditingSwiftData
//
//  Created by OLEKSANDR ISAIEV on 27.12.2023.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String
    var priority: Int
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
