//
//  Task.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import SwiftUI

enum TaskStatus: String, CaseIterable {
    case notStarted = "Not started"
    case inProgress = "In progress"
    case complete = "Complete"
}

struct Task: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var completed: Bool = false
    var dueDate: Date?
    var status: TaskStatus = .notStarted
    
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}

