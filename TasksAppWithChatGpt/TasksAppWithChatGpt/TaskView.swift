//
//  TaskView.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 19/03/2023.
//

import SwiftUI

struct TaskView: View {
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(task.title)
            if let dueDate = task.dueDate {
                Text("Due date: \(dueDate, formatter: ContentView.taskDateFormat)")
                    .font(.caption)
            }
            Text("Status: \(task.status.rawValue)")
        }
        .foregroundColor(task.completed ? .gray : .primary)
        .opacity(task.completed ? 0.5 : 1)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: Task(title: "Preview Task"))
    }
}
