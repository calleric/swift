//
//  TasksAppWithChatGptApp.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import SwiftUI

@main
struct TasksAppWithChatGptApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    let taskViewModel = TaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskViewModel)
        }
        .onChange(of: scenePhase) { newScenePhase in
            if newScenePhase == .inactive || newScenePhase == .background {
                taskViewModel.saveTasks()
            }
        }
    }
}
