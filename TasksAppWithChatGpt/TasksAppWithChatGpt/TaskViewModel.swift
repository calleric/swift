//
//  TaskViewModel.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import Foundation

class TaskViewModel: ObservableObject {
    private let userDefaults: UserDefaults
    @Published var tasks: [Task]
    @Published var isEditing = false
    
    init() {
        self.userDefaults = UserDefaults.standard
        self.tasks = []
        
        if let savedTasksData = userDefaults.data(forKey: "tasks"),
           let savedTasks = try? JSONDecoder().decode([Task].self, from: savedTasksData) {
            self.tasks = savedTasks
        }
    }
    
    func saveTasks() {
        if let encodedTasks = try? JSONEncoder().encode(tasks) {
            userDefaults.set(encodedTasks, forKey: "tasks")
        }
    }
}

