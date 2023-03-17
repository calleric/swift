//
//  TaskViewModel.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks = [
        Task(title: "Task 1", dueDate: Date(), status: "In progress"),
        Task(title: "Task 2", dueDate: Date().addingTimeInterval(86400), status: "Not started"),
        Task(title: "Task 3", dueDate: nil, status: "Complete")
    ]
}
