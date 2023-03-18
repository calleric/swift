//
//  TasksAppWithChatGptApp.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import SwiftUI

@main
struct TasksAppWithChatGptApp: App {
    var taskListViewModel: TaskListViewModel
    
    init () {
        taskListViewModel = TaskListViewModel()
    }
    
    var body: some Scene {
        
        WindowGroup {
            ContentView(taskListViewModel: taskListViewModel)
        }
    }
}
