//
//  TaskViewModel.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task]
    @Published var isEditing = false // add isEditing property
    
    init() {
        tasks = [
            Task(title: "Task 1", dueDate: Date(), status: .inProgress),
            Task(title: "Task 2", dueDate: Date().addingTimeInterval(86400), status: .notStarted),
            Task(title: "Task 3", dueDate: nil, status: .complete)
        ]
    }
}

