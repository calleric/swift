//
//  ContentView.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = TaskViewModel()
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            List(viewModel.tasks) { task in
                VStack(alignment: .leading) {
                    Text(task.title)
                    if let dueDate = task.dueDate {
                        Text("Due date: \(dueDate, formatter: Self.taskDateFormat)")
                            .font(.caption)
                    }
                    if let status = task.status {
                        Text("Status: \(status)")
                            .font(.caption)
                    }
                }
                .foregroundColor(task.completed ? .gray : .primary)
                .opacity(task.completed ? 0.5 : 1)
                .onTapGesture {
                    if let index = self.viewModel.tasks.firstIndex(where: { $0.id == task.id }) {
                        self.viewModel.tasks[index].completed.toggle()
                    }
                }
            }
            .navigationTitle("Tasks")
            .navigationBarItems(trailing: Button(action: {
                self.viewModel.tasks.append(Task(title: "New Task", dueDate: Date(), status: "Not started"))
            }) {
                Image(systemName: "plus")
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
