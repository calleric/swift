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

struct Task: Identifiable, Equatable, Codable {
    var id = UUID()
    var title: String
    var dueDate: Date?
    var status: TaskStatus
    var completed = false
    
    enum CodingKeys: String, CodingKey {
        case id, title, dueDate, status, completed
    }
    
    init(id: UUID = UUID(), title: String, dueDate: Date?, status: TaskStatus, completed: Bool = false) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
        self.status = status
        self.completed = completed
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        dueDate = try container.decodeIfPresent(Date.self, forKey: .dueDate)
        status = try container.decode(TaskStatus.self, forKey: .status)
        completed = try container.decode(Bool.self, forKey: .completed)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encodeIfPresent(dueDate, forKey: .dueDate)
        try container.encode(status, forKey: .status)
        try container.encode(completed, forKey: .completed)
    }
}
