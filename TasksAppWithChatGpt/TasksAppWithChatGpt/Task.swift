//
//  Task.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import SwiftUI

enum TaskStatus: String, CaseIterable, Codable {
    case notStarted
    case inProgress
    case complete
    
    var iconName: String {
        switch self {
        case .notStarted:
            return "circle"
        case .inProgress:
            return "circle.fill"
        case .complete:
            return "checkmark.circle.fill"
        }
    }
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

