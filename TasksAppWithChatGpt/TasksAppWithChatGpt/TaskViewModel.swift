//
//  TaskViewModel.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks = [
        Task(title: "Task 1"),
        Task(title: "Task 2"),
        Task(title: "Task 3")
    ]
}
