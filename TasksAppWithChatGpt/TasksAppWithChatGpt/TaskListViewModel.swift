//
//  TaskListViewModel.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import Foundation

class TaskListViewModel: ObservableObject {
    
    @Published var taskViewModels: [TaskViewModel] = []
    
    let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
    
    func addTask(taskViewModel: TaskViewModel) {
        taskViewModels.append(taskViewModel)
    }
    
    func removeTask(at offsets: IndexSet) {
        taskViewModels.remove(atOffsets: offsets)
    }
}
